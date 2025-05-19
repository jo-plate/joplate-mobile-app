import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final m = Localization.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(m.account.delete_account),
        content: Text(m.common.delete_account_confirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(m.common.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(m.common.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await _deleteAccount(context);
    }
  }

  Future<String?> _showPasswordDialog(BuildContext context) async {
    final m = Localization.of(context);
    final passwordController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(m.account.delete_account),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(m.common.enter_password_to_delete),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: m.account.password,
                border: const OutlineInputBorder(),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(m.common.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(m.common.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      return passwordController.text;
    }
    return null;
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final m = Localization.of(context);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Always require password confirmation
      final password = await _showPasswordDialog(context);
      if (password == null) return;

      // Reauthenticate with password
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);

      // Delete the account
      await user.delete();

      if (context.mounted) {
        AppSnackbar.showSuccess(m.common.account_deleted);
        await context.read<AuthCubit>().logout();
      }
    } on FirebaseAuthException catch (e) {
      String message = m.common.delete_account_failed;
      switch (e.code) {
        case 'requires-recent-login':
          message = m.common.requires_recent_login;
          break;
        case 'invalid-credential':
          message = m.common.invalid_credentials;
          break;
        default:
          message += e.message ?? e.code;
      }
      if (context.mounted) {
        AppSnackbar.showError(message);
      }
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.showError('${m.common.delete_account_failed}${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.editprofile.header),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider.value(
        value: injector<AuthCubit>(),
        child: Builder(builder: (context) {
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.isLoggedIn && state.userProfile == null) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const ProfileBanner(
                            clickable: false,
                          ),
                          const SizedBox(height: 16),
                          MenuItem(
                              title: m.editprofile.full_name,
                              icon: Icons.person,
                              onTap: () => AutoRouter.of(context).push(const EditFullNameRoute())),
                          const SizedBox(height: 16),
                          MenuItem(
                            title: m.editprofile.phone_number,
                            icon: Icons.phone_outlined,
                            onTap: () => AutoRouter.of(context).push(const EditPhoneNumberRoute()),
                          ),
                          const SizedBox(height: 16),
                          MenuItem(
                              title: m.editprofile.email,
                              icon: Icons.email_outlined,
                              onTap: () => AutoRouter.of(context).push(const EditEmailRoute())),
                          const SizedBox(height: 16),
                          MenuItem(
                            title: m.editprofile.change_password,
                            icon: Icons.password_outlined,
                            onTap: () => AutoRouter.of(context).push(const ChangePasswordRoute()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      MenuItem(
                        title: m.profile.delete_account,
                        icon: Icons.delete,
                        onTap: () => _showDeleteConfirmationDialog(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

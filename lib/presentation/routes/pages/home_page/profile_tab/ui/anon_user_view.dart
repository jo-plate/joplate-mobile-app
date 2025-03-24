import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';

class AnonUserView extends StatelessWidget {
  const AnonUserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.key,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            m.profile.notsignedin,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          FilledButton(
              onPressed: () {
                AutoRouter.of(context).push(const AuthRoute());
              },
              child: Text(m.profile.signin)),
        ],
      )),
    );
  }
}

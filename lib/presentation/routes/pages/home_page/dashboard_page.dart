import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return AutoTabsScaffold(
      routes: const [
        ProfileRoute(),
        HomeRoute(),
        FeedRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.person), label: m.footer.profile),
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: m.footer.home),
            BottomNavigationBarItem(icon: const Icon(Icons.rss_feed), label: m.footer.feed),
          ],
        );
      },
    );
  }
}

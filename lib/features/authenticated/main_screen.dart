import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ansaap_app/core/di/injection.dart' as di;

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final taps = [
    {'route': const HomeRoute(), 'title': 'الرئيسية'},
    {'route': ProfileRoute(), 'title': 'الملف الشخصي'},
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
          ...taps.map((tap) => tap['route'] as PageRouteInfo),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          tabsRouter.current.title;
          return AppScaffold(
              title: taps[tabsRouter.activeIndex]['title'].toString(),
              drawer: const Drawer(),
              safeTopArea: true,
              actions: [],
              bottomNavigation: FlashyTabBar(
                selectedIndex: tabsRouter.activeIndex,
                showElevation: true,
                onItemSelected: tabsRouter.setActiveIndex,
                iconSize: 20,
                items: taps.asMap().entries.map((entry) {
                  int index = entry.key;
                  var tap = entry.value;
                  return NavBarItem(
                    icon: index == 0 ? BoxIcons.bx_home_alt : Bootstrap.person,
                    title: tap['title'] as String,
                  );
                }).toList(),
              ),
              body: child);
        });
  }
}

class NavBarItem extends FlashyTabBarItem {
  NavBarItem({
    required IconData icon,
    required String title,
    Color activeColor = AppColors.primary,
    Color inactiveColor = AppColors.lightPrimary,
  }) : super(
            icon: Icon(
              icon,
            ),
            title: AppText(
              title,
            ),
            activeColor: activeColor,
            inactiveColor: inactiveColor);
}
import 'package:personal_expense/state_management/dashboard_navigation/dashboard_navigation_cubit.dart';
import 'package:personal_expense/ui/pages/dashboard/home/home_page.dart';
import 'package:personal_expense/ui/pages/dashboard/profile/profile_page.dart';
import 'package:personal_expense/utils/enum/dashboard_navigation_enum.dart';
import 'package:personal_expense/utils/theme/styling_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'home/home_page.dart';
export 'profile/profile_page.dart';

class DashBoard extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DashBoard());
  }

  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardNavigationCubit>(
      create: (context) => DashboardNavigationCubit(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar:
              BlocBuilder<DashboardNavigationCubit, DashboardNavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                selectedLabelStyle: StylingText.bottomNavigationSelected,
                unselectedLabelStyle: StylingText.bottomNavigationUnSelected,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  if (index == 0) {
                    BlocProvider.of<DashboardNavigationCubit>(context)
                        .getNavBarItem(DashboardNavigationItems.home);
                  } else if (index == 1) {
                    BlocProvider.of<DashboardNavigationCubit>(context)
                        .getNavBarItem(DashboardNavigationItems.profile);
                  }
                },
              );
            },
          ),
          body: BlocBuilder<DashboardNavigationCubit, DashboardNavigationState>(
              builder: (context, state) {
            if (state.navbarItem == DashboardNavigationItems.home) {
              return const HomePage();
            } else if (state.navbarItem == DashboardNavigationItems.profile) {
              return const ProfilePage();
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}

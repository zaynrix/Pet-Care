part of home_ui_module;

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const MainShopScreen(),
    PetsScreen(),
    ReminderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context , controller , child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.selectedScreen,
          backgroundColor: ColorManager.white,
          iconSize: AppSize.s24,
          elevation: 0,
          onTap: controller.onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label:"home",
              icon: SvgPicture.asset(controller.selectedScreen == 0 ? IconAssets.homeSelected : IconAssets.unSelectedHome)
            ),
            BottomNavigationBarItem(
              label:"shop",
              icon: SvgPicture.asset(controller.selectedScreen == 1 ?IconAssets.shopSelected : IconAssets.unSelectedCart)
            ),
            BottomNavigationBarItem(
              label:"pets",
              icon: SvgPicture.asset(controller.selectedScreen == 2 ? IconAssets.unSelectedPets : IconAssets.unSelectedPets)
            ),
            BottomNavigationBarItem(
              label:"reminder",
              icon: SvgPicture.asset(controller.selectedScreen == 3 ? IconAssets.notificationSelected : IconAssets.unSelectedNotification)
            ),
            BottomNavigationBarItem(
              label:"profile",
              icon: SvgPicture.asset(controller.selectedScreen == 4 ? IconAssets.profileSelected : IconAssets.unSelectedProfile )
            ),
          ],
        ),
        body: _pages.elementAt(controller.selectedScreen),
      ),
    );
  }
}

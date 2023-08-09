part of home_ui_module;

class MainScreenApp extends StatefulWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const MainShopScreen(),
    PetsScreen(),
    ReminderScreen(),
    ProfileScreen(),
  ];

  @override
  State<MainScreenApp> createState() => _MainScreenAppState();
}

class _MainScreenAppState extends State<MainScreenApp> {
  var dataaa = sl<HomeProvider>();

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: RouteService.serviceNavi.navKey.currentContext!,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(RouteService.serviceNavi.navKey.currentContext!)
          .showSnackBar(SnackBar(
        content: Text(
          'Notification Created on ${notification.channelKey}',
        ),
      ));
    });

    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }

      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => const PlantStatsPage(),
      //   ),
      //   (route) => route.isFirst,
      // );
    });
    // sl<NotificationProvider>().allowNotificationsWidget();
    print("initState sl HomeProvider/MainScreenApp ${dataaa.hashCode}");
    sl<HomeProvider>().getPetsProvider();
    sl.resetLazySingleton(instance: dataaa);
    // sl.reset(dispose: true);
  }

  @override
  void dispose() {
    sl<NotificationProvider>().disposeNotifications();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("sl HomeProvider/MainScreenApp/build ${dataaa.hashCode}");
    return Consumer<HomeProvider>(
      builder: (context, controller, child) => Scaffold(
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
                label: "home",
                icon: SvgPicture.asset(controller.selectedScreen == 0
                    ? IconAssets.homeSelected
                    : IconAssets.unSelectedHome)),
            BottomNavigationBarItem(
                label: "shop",
                icon: SvgPicture.asset(controller.selectedScreen == 1
                    ? IconAssets.shopSelected
                    : IconAssets.unSelectedCart)),
            BottomNavigationBarItem(
                label: "pets",
                icon: SvgPicture.asset(controller.selectedScreen == 2
                    ? IconAssets.petsSelected
                    : IconAssets.unSelectedPets)),
            BottomNavigationBarItem(
                label: "reminder",
                icon: SvgPicture.asset(controller.selectedScreen == 3
                    ? IconAssets.notificationSelected
                    : IconAssets.unSelectedNotification)),
            BottomNavigationBarItem(
                label: "profile",
                icon: SvgPicture.asset(controller.selectedScreen == 4
                    ? IconAssets.profileSelected
                    : IconAssets.unSelectedProfile)),
          ],
        ),
        body: MainScreenApp._pages.elementAt(controller.selectedScreen),
      ),
    );
  }
}

part of home_ui_module;

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    ProfileScreen(),
    const MainShopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Row(
          children: [
            Text(
              "Hello, ",
              style: titleRegular,
            ),
            Text(
              "Jaylon",
              style: titleBold,
            )
          ],
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            iconPath: IconAssets.search,
          ),
          AppSize.s35.addHorizontalSpace
        ],
      ),
      body: const Column(
        children: [
          Center(
            child: Text("Home Page"),
          )
        ],
      ),
    );
  }
}

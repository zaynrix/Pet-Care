part of home_ui_module;


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: const [
            Text("Hello, " , style: titleRegular,),
            Text("Jaylon" , style: titleBold,)
          ],
        ),
        actions: [
          CustomIconButton(
            iconPath: IconAssets.search,
          ),
          AppSize.s35.addHorizontalSpace
        ],
      ),
      body: Column(
        children: const [
          Center(
            child: Text("Home Page"),
          )
        ],
      ),
    );
  }
}

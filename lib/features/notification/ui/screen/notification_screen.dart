part of notifications_module;

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          AppSize.s30.addVerticalSpace,
          Expanded(
            child: Container(
              width: double.infinity,
              padding: AppSize.s24.paddingAll,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s15.circularRadius,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today",
                      style: supTitleSemiBold,
                    ),
                    AppSize.s8.addVerticalSpace,
                    Divider(
                      color: ColorManager.primaryWithTransparent10,
                    ),
                    NotificationCard(
                      iconPath: IconAssets.vaccine,
                      title: "Vaccinate your pet timely",
                      time: "2 minutes ago",
                      color: ColorManager.quaternary,
                      deleteFunction: (value){},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

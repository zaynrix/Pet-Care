part of auth_module;

class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Set this to true
        extendBody: true,

        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppSize.s20.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: AppSize.s210.w,
                padding: const EdgeInsets.all(0),
                margin: EdgeInsetsDirectional.only(
                  top: AppSize.s20.h,
                  start: AppSize.s10.w,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.transparent,
                ),
                child: Consumer<AuthProvider>(
                  builder: (context, auth, child) => TabBar(
                    onTap: (index) => auth.changeCurrantTap(index),
                    unselectedLabelColor: ColorManager.primary,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: ColorManager.secondary, width: 3),
                      ),
                      color: ColorManager.transparent,
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          AppStrings.signIn,
                          maxLines: 1,
                          style: auth.currantAuthTap == 0
                              ? titleSemiBoldSecondary
                              : titleRegular,
                        ),
                      ),
                      Tab(
                        child: Text(
                          AppStrings.signUp,
                          maxLines: 1,
                          style: auth.currantAuthTap == 1
                              ? titleSemiBoldSecondary
                              : titleRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  AppSize.s10.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      AppSize.s60.h,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      LoginScreen(),
                      SignUpScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

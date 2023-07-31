part of home_ui_module;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// PR request
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController emailController = TextEditingController();

  final reminderController = Get.put(ReminderController(), permanent: true);

  @override
  void initState() {
    super.initState();
    sl<HomeProvider>().getVetsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, instance, child) => Scaffold(
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          title: const Text(
            AppStrings.search,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: 24.paddingHorizontal,
              child: CustomTextFormField(
                  onChange: (val) {
                    instance.filterList(val);
                    instance.searchController.text = val;
                    instance.replaceIt();
                  },
                  suffixIcon:
                      instance.replace == false ? Icons.search : Icons.close,
                  hintText: AppStrings.typeProblems,
                  validator: (value) => value!.validateEmail(),
                  keyBoardType: TextInputType.emailAddress),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: instance.searchController.text.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      32.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: const Text(
                          AppStrings.discover,
                          style: titleSemiBoldPrimary,
                        ),
                      ),
                      13.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: const Divider(),
                      ),
                      Padding(
                        padding: 24.paddingLeft,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: instance.discoverList.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            return Text(
                              instance.discoverList[index],
                              style: bodyRegular(color: ColorManager.primary),
                            );
                          },
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                      DividerShopCard(
                        title: AppStrings.article,
                        textButton: AppStrings.seeAll,
                        textButtonColor: ColorManager.secondary,
                        onPressed: () {},
                      ),
                      // 16.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: Consumer<ProductProvider>(
                          builder: (context, productProvider, child) =>
                              SizedBox(
                            height: 180,
                            child: productProvider.products == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: productProvider
                                        .products!.products!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        ArticleCard(
                                      onTap: () =>
                                          productProvider.setProductObject(
                                              current: productProvider
                                                  .products!.products![index]),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                      DividerShopCard(
                        title: AppStrings.topVet,
                        textButton: AppStrings.seeAll,
                        textButtonColor: ColorManager.secondary,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          height: 180.height,
                          child: Consumer<HomeProvider>(
                            builder: (context, value, child) =>
                                value.petsModel == null
                                    ? const CustomCircularProgressIndicator()
                                    : ListView.builder(
                                        itemCount:
                                            value.vetsModel!.vets!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return VetsCard(
                                            vets: value.vetsModel!.vets![index],
                                          );
                                        },
                                      ),
                          ),
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                    ])
              : instance.searchList.isNotEmpty
                  ? Consumer<ProductProvider>(
                      builder: (context, productProvider, child) =>
                          productProvider.products == null
                              ? const CustomCircularProgressIndicator()
                              : Padding(
                                  padding: 20.paddingVertical,
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          2, // Number of columns in the grid
                                      crossAxisSpacing:
                                          0.0, // Spacing between columns
                                      mainAxisSpacing:
                                          8.0, // Spacing between rows
                                    ),
                                    itemCount: instance.searchList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        productProvider.setProductObject(
                                            current:
                                                instance.searchList[index]);
                                      },
                                      child: ShodCardGrid(
                                        onTap: () {
                                          setState(() {
                                            instance.searchList[index].inCart !=
                                                    true
                                                ? instance.searchList[index]
                                                : instance.searchList[index];
                                            instance.searchList[index].inCart =
                                                instance
                                                    .searchList[index].inCart!;
                                          });
                                        },
                                        singleProduct:
                                            instance.searchList[index],
                                      ),
                                    ),
                                  ),
                                ),
                    )
                  : Center(
                      child: Text("No Result \n for ${instance.querySearch}"),
                    ),
        ),
      ),
    );
  }
}

class VetsCard extends StatelessWidget {
  const VetsCard({
    super.key,
    this.vets,
  });

  final Vets? vets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingRight,
      child: Container(
        width: 150.width,
        height: 180.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.0),
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.network(
                vets!.image!,
                fit: BoxFit.cover,
                width: 150.width,
                height: 180.height,
              ),
            ),
            Positioned(
              left: 14,
              bottom: 11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vets!.name!,
                    style: footNoteBold.copyWith(color: ColorManager.primary),
                  ),
                  4.addVerticalSpace,
                  RatingStars(
                    rating: vets!.review!.toDouble(),
                  ),
                ],
              ),
            ),
            const PositionsCardShadow()
          ],
        ),
      ),
    );
  }
}

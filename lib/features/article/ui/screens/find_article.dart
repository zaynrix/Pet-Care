part of article_module;

class FindArticle extends StatelessWidget {
  const FindArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("12 results for “sick”"),
      ),
      body: Padding(
        padding: AppPadding.p24.paddingHorizontal,
        child: Column(
          children: [
            Container(
              margin: AppSize.s20.marginVertical,
              padding: AppPadding.p24.paddingAll,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s16.circularRadius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text("What are the signs of sick dog?", style: bodyBoldPrimary,),
                  AppSize.s16.addVerticalSpace,
                  SizedBox(
                    // height: 80.height,
                    child: Text("If your dog is sick, it's important that you know what warning signs to look out for so you can take ap", style: bodyRegular(color: ColorManager.gray), overflow: TextOverflow.ellipsis, maxLines: 3,),
                  ),
                  AppSize.s16.addVerticalSpace,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 40.height,
                      width: AppSize.s120.width,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Find Vets", style: footNoteRegular(color: ColorManager.white),),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

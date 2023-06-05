import 'package:flutter/material.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/flutter_state_render_dialog.dart';

class TestDialogState extends StatelessWidget {
  const TestDialogState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      appBar: AppBar(
        title: const Text("Test Dialog"),
        backgroundColor: ColorManager.mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("This is the test state dialog" , style: h3Bold,),
          addVerticalSpace(AppSize.s40),
          const ElevatedButton(onPressed: showCustomDialog
          //     (){
          //   showCustomDialog;
          //   // dialogRender(
          //   //     context: context,
          //   //     stateRenderType: StateRenderType.popUpLoadingState, message: 'Loading', title: "Fuck", retryAction: null);
          // }
          , child: Text("Make Test"))
        ],
      ),
    );
  }
}

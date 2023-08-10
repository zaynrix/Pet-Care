
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/resources/colors_manager.dart';

final GlobalKey<State> keyLoader = GlobalKey<State>();

// showDialogState({required BuildContext context}){
//   Future.delayed(Duration(seconds: 2), (){
//   dialogRender(
//       context: context,
//       stateRenderType: StateRenderType.popUpLoadingState, message: 'Loading', title: "Fuck", retryAction: null);
//   RouteService.serviceNavi.popFunction();
//   });
// }

final GlobalKey<State> _keyLoader = GlobalKey<State>();

OverlayEntry? _overlayEntry;

void showCustomDialog() {
  OverlayState? overlayState = Overlay.of(_keyLoader.currentContext!);
  _overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('My Dialog'),
        content: const Text('This is a custom dialog.'),
        actions: [
          ElevatedButton(
            child: const Text('Close'),
            onPressed: () {
              _overlayEntry?.remove();
            },
          ),
        ],
      );
    },
  );
  overlayState.insert(_overlayEntry!);
}

// void showCustomDialog() {
//   showDialog(
//     context: _keyLoader.currentContext!,
//     builder: (BuildContext context) {
//       return Builder(
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('My Dialog'),
//             content: Text('This is a custom dialog.'),
//             actions: [
//               ElevatedButton(
//                 child: Text('Close'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     },
//   );
// }


dialogRender({
  // required BuildContext context,
  required StateRenderType stateRenderType,
  required String message,
  required String title,
  required retryAction,
  Widget? child,
}) {
  showDialog(
    context: keyLoader.currentContext!,
    builder: (BuildContext  context) => StateRender(
      stateRenderType: stateRenderType,
      message: message,
      title: title,
      retryAction: retryAction,
      child: child,
    ),
  );
}

class StateRender extends StatelessWidget {
  const StateRender(
      {Key? key,
      required this.stateRenderType,
      this.message = 'Loading',
      this.title = '',
      this.retryAction,
      this.child})
      : super(key: key);

  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final void Function()? retryAction;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: ColorManager.white.withOpacity(0.6),
      insetPadding: EdgeInsets.zero,
      content: SizedBox.expand(
        child: Container(
          // color: ColorManager.white.withOpacity(0.6),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAnimatedAsset(),
              const SizedBox(height: 8),
              _buildMessageText(),
              const SizedBox(height: 16),
              if (stateRenderType != StateRenderType.popUpLoadingState)
                _buildPopUpButton(),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildAnimatedAsset() {
    String animatedAsset = '';
    switch (stateRenderType) {
      case StateRenderType.popUpLoadingState:
        animatedAsset = 'assets/json/loading_status.json';
        break;
      case StateRenderType.popUpErrorState:
        animatedAsset = 'assets/json/error_status.json';
        break;
      case StateRenderType.popUpSuccessState:
        animatedAsset = 'assets/json/success_status.json';
        break;
    }

    return SizedBox(
      height: 150,
      width: 150,
      child: Lottie.asset(animatedAsset),
    );
  }

  Widget _buildMessageText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPopUpButton() {
    return SizedBox(
      width: double.infinity,
      child: child ??
          TextButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: retryAction,
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
    );
  }
}

enum StateRenderType {
  popUpLoadingState,
  popUpErrorState,
  popUpSuccessState,
}

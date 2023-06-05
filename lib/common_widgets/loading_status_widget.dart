import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/utils/enums.dart';

class LoadingStatusWidget extends StatelessWidget {
  const LoadingStatusWidget({
    required this.loadingStatus,
    Key? key,
  }) : super(key: key);

  final LoadingStatusOption loadingStatus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child:  Lottie.asset(animationAssets(loadingStatus.name) ,
            height: 150,
            width: 150),
      ),
    );
  }
}

String animationAssets(String status){
  switch (status) {
    case "loading" :
      {
        return "assets/json/loading_status.json";
      }
    case "error" :
      {
        return "assets/json/error_status.json";
      }
    case "success" :
      {
        return "assets/json/success_status.json";
      }
  }
  return "";
}

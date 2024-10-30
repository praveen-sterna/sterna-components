import 'package:flutter/material.dart';
import '../navigation/navigation.dart';
import '../utills/sterna_constants.dart';


class LoadingBottomSheet{
  LoadingBottomSheet._();

  static final LoadingBottomSheet instance = LoadingBottomSheet._();

  BuildContext? context = Navigation.instance.navigatorKey.currentContext;

  Future<void> showBottomSheet() async{
    if(context != null){
      await showModalBottomSheet(
        context: context!,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16,),
                  Text("Loading", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: SternaConstants.primaryTextColor)),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: SternaConstants.primary,
                      strokeWidth: 2.5,
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "We are processing your request,\nPlease wait",
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.8, fontSize: 14, color: SternaConstants.secondaryTextColor, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16,),
                ],
              )
            ),
          );
        },
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sterna_components/utills/sterna_constants.dart';
import '../components/button.dart';
import '../navigation/navigation.dart';


class ErrorBottomSheet{
  ErrorBottomSheet._();

  static final ErrorBottomSheet instance = ErrorBottomSheet._();

  BuildContext? context = Navigation.instance.navigatorKey.currentContext;

  Future<void> showBottomSheet({required String error}) async{
    if(context != null){
      await showModalBottomSheet(
        context: context!,
        isDismissible: false,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Error", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: SternaConstants.primaryTextColor)),
                    IconButton(
                      icon: Icon(Icons.close, color: SternaConstants.primaryTextColor,),
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                    ),
                  ],
                ),
                Lottie.asset(
                  'assets/lottie/error.json',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16),
                Text(error, style: TextStyle(fontSize: 15, color: SternaConstants.secondaryTextColor, fontWeight: FontWeight.w300, height: 1.8),textAlign: TextAlign.center,),
              ],
            ),
          );
        },
      );
    }
  }
}

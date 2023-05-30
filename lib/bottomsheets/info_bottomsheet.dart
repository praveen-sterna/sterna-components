import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/button.dart';
import '../navigation/navigation.dart';


class InfoBottomSheet{
  InfoBottomSheet._();

  static final InfoBottomSheet instance = InfoBottomSheet._();

  BuildContext? context = Navigation.instance.navigatorKey.currentContext;

  Future<void> showBottomSheet({required String info}) async{
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
                    const Text("Info", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black,),
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                    ),
                  ],
                ),
                Lottie.asset(
                  'assets/lottie/info.json',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16),
                Text(info, style: const TextStyle(fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.w300, height: 1.8),textAlign: TextAlign.center,),
              ],
            ),
          );
        },
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/button.dart';
import '../navigation/navigation.dart';


class SessionExpiredBottomSheet{
  SessionExpiredBottomSheet._();

  static final SessionExpiredBottomSheet instance = SessionExpiredBottomSheet._();

  BuildContext? context = Navigation.instance.navigatorKey.currentContext;

  Future<void> showBottomSheet({required Function() onLogout}) async{
    if(context != null){
      await showModalBottomSheet(
        context: context!,
        isDismissible: false,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async{
              return false;
            },
            child: Container(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Session Expired", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)),
                    ],
                  ),
                  Lottie.asset(
                    'assets/lottie/error.json',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 16),
                  const Text("Current session expired. Logout and start new session", style: TextStyle(fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.w300, height: 1.8),textAlign: TextAlign.center,),
                  const SizedBox(height: 24),
                  Button(
                    onPressed: () {
                      onLogout();
                    },
                    text: "Logout",
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

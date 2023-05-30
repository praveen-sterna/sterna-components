import 'package:flutter/material.dart';
import '../components/button.dart';
import '../navigation/navigation.dart';


class LogoutBottomSheet{
  LogoutBottomSheet._();

  static final LogoutBottomSheet instance = LogoutBottomSheet._();

  BuildContext? context = Navigation.instance.navigatorKey.currentContext;

  Future<void> showBottomSheet({required Function() onLogout}) async{
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black,),
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Are you sure, Do you really want to logout?", style: TextStyle(fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.w300, height: 1.8),),
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      color: Colors.blueGrey.shade50,
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                      text: "Cancel",
                      textColor: Colors.blueGrey,
                    ),
                    const SizedBox(width: 8),
                    Button(
                      onPressed: () {
                        Navigation.instance.goBack();
                        onLogout();
                      },
                      text: "Logout",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

import 'package:flutter/material.dart';
import '../components/button.dart';
import '../navigation/navigation.dart';
import '../utills/sterna_constants.dart';


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
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: SternaConstants.primaryTextColor)),
                    IconButton(
                      icon: Icon(Icons.close, color: SternaConstants.primaryTextColor,),
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("Are you sure, Do you really want to logout?", style: TextStyle(fontSize: 15, color: SternaConstants.secondaryTextColor, fontWeight: FontWeight.w300, height: 1.8),),
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      width: 50,
                      color: Colors.blueGrey.shade50,
                      onPressed: () {
                        Navigation.instance.goBack();
                      },
                      text: "Cancel",
                      textColor: Colors.blueGrey,
                    ),
                    const SizedBox(width: 8),
                    Button(
                      width: 50,
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

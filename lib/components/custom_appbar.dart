import 'package:flutter/material.dart';
import 'package:sterna_components/sterna_components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  final String title;
  final bool? centerTitle;
  final bool? isLeading;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  const CustomAppBar({Key? key, required this.title, this.centerTitle, this.isLeading, this.leadingIcon, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: SternaConstants.appBarColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: (isLeading ?? true) ? IconButton(
        onPressed: (){
          Navigation.instance.goBack();
        },
        icon: Icon(leadingIcon ?? Icons.keyboard_backspace_rounded, color: SternaConstants.appBarIconColor,),
      ) : null,
      actions: actions,
      title: Text(title,style: TextStyle(color: SternaConstants.appBarIconColor, fontSize: 20, fontWeight: FontWeight.w600),),
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

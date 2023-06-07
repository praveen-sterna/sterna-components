import 'package:flutter/material.dart';
import 'package:sterna_components/sterna_components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  final String title;
  final bool? centerTitle;
  final bool? isLeading;
  final IconData? leadingIcon;
  final Color? bgColor;
  final List<Widget>? actions;
  final Color? titleColor;
  const CustomAppBar({Key? key, required this.title, this.centerTitle, this.isLeading, this.leadingIcon, this.bgColor, this.actions, this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: bgColor ?? SternaConstants.primary,
      automaticallyImplyLeading: false,
      leading: (isLeading ?? true) ? IconButton(
        onPressed: (){
          Navigation.instance.goBack();
        },
        icon: Icon(leadingIcon ?? Icons.keyboard_backspace_rounded, color: titleColor ?? Colors.white,),
      ) : null,
      actions: actions,
      title: Text(title,style: TextStyle(color: titleColor ?? Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

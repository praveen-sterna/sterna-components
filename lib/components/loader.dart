import 'package:flutter/material.dart';
import '../utills/sterna_constants.dart';

class Loader extends StatelessWidget {
  final Color? color;
  const Loader({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: color ?? SternaConstants.primary,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sterna_components/sterna_components.dart';

import 'button.dart';

class NoData extends StatelessWidget {
  final String text;
  final Function() onRetry;

  const NoData({Key? key, required this.text, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14, height: 1.8, color: SternaConstants.secondaryTextColor, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
          const SizedBox(height: 20,),
          Button(text: "Retry", onPressed: onRetry)
        ],
      ),
    );
  }
}

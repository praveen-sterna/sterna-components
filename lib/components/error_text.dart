import 'package:flutter/material.dart';

import 'button.dart';

class ErrorText extends StatelessWidget {
  final String? title;
  final String error;
  final Function() onRetry;

  const ErrorText({Key? key, required this.error, required this.onRetry, this.title}) : super(key: key);

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
          const SizedBox(height: 16,),
          Text(
            error,
            style: const TextStyle(fontSize: 14, height: 1.8, color: Colors.blueGrey,fontWeight: FontWeight.w300),
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

import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final bool isRequired;
  const Label({Key? key, required this.text,required this.isRequired}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 15),),
        const SizedBox(width: 4,),
        Visibility(
            visible: isRequired,
            child: const Text("*",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w600),)
        )
      ],
    );
  }
}

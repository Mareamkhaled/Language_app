import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.word, required this.onPressed});
  final String word;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                        backgroundColor: MyColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)))),
                    child: Text(
                      word,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    )),
        ),
      ],
    );
  }
}
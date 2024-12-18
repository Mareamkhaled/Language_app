import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TextWithTextFormField extends StatelessWidget {
  TextWithTextFormField({super.key, required this.label,this.onchanged, required this.hint, this.controller});
  final TextEditingController? controller;
  final String label;
  final String hint; 
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
                  alignment: Alignment.centerLeft,
                  child: Text(label)),
                SizedBox(height: 5,),
                TextFormField(
                  validator: (value) {
        if(value!.isEmpty){
           return "field required";
        }
       // return null;
      },
                  onChanged: onchanged,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
                    fillColor: MyColors.fadedBlueColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)
                    )
                  ),
                )
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sms_email/constants/colors_const.dart';
import 'package:sms_email/extensions/context_exten.dart';
import 'package:sms_email/extensions/number_exten.dart';
import 'package:sms_email/extensions/string_exten.dart';
import 'package:sms_email/widgets/sheet_wrapper.dart';

class ConfirmSheet extends StatelessWidget {
  final VoidCallback onOk;
  const ConfirmSheet({super.key, required this.onOk});

  @override
  Widget build(BuildContext context) {
    return SheetWrapper(
      child: Column(
        children: [
      
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Are you sure you want to send SMS to",
                  style: TextStyle(
                    color: Color(0xFF201A3F),
                    fontFamily: 'Slussen', fontWeight: FontWeight.w300, fontSize: 18
                  )
                ),
                TextSpan(
                  text: " +91 90876 54321?",
                  style: TextStyle(
                    color: Color(0xFF201A3F),
                    fontFamily: 'Slussen', fontWeight: FontWeight.w700, fontSize: 18
                  )
                ),
                TextSpan(
                  text: "and Email to",
                  style: TextStyle(
                    color: Color(0xFF201A3F),
                    fontFamily: 'Slussen', fontWeight: FontWeight.w300, fontSize: 18
                  )
                ),
                TextSpan(
                  text: " Dummymail@gmail.com",
                  style: TextStyle(
                    color: Color(0xFF201A3F),
                    fontFamily: 'Slussen', fontWeight: FontWeight.w700, fontSize: 18
                  )
                ),
              ]
            ),
          ),
      
          26.h(),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              GestureDetector(
                onTap: ()=>context.back(),
                child: Container(
                  width: 104,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF65DE).withOpacity(0.07),
                    borderRadius: BorderRadius.circular(32)
                  ),
                  alignment: Alignment.center,
                  child: "NO".bold14(color: ColorsConst.secondary),
                ),
              ),
      
              20.w(),
      
              GestureDetector(
                onTap: (){
                  context.back();
                  onOk();
                },
                child: Container(
                  width: 104,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorsConst.secondary,
                    borderRadius: BorderRadius.circular(32)
                  ),
                  alignment: Alignment.center,
                  child: "YES".bold14(color: Colors.white),
                ),
              ),
      
            ],
          )
      
        ],
      ),
    );
  }
}
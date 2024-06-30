import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sms_email/constants/assets_const.dart';
import 'package:sms_email/extensions/context_exten.dart';
import 'package:sms_email/extensions/number_exten.dart';

class SheetWrapper extends StatelessWidget {
  final Widget child;
  const SheetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
      
          Stack(
            alignment: Alignment.center,
            children: [
      
              Container(
                width: 60, height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFF0F0F0)
                ),
              ),
      
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: ()=>context.back(),
                  icon: Image.asset(AssetsConst.close, width: 24, height: 24,),
                  iconSize: 24,
                  color: const Color(0xFF201A3F),
                ),
              )
      
            ],
          ),
      
          30.h(),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  20, vertical: 10),
            child: child,
          )
      
        ],
      ),
    );
  }
}
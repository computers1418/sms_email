import 'package:flutter/material.dart';
import 'package:sms_email/extensions/number_exten.dart';
import 'package:sms_email/extensions/string_exten.dart';
import 'package:sms_email/widgets/arrow_back.dart';

import '../constants/assets_const.dart';
import '../constants/colors_const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ArrowBack(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                "Good Day!".regular10(color: ColorsConst.textLight),
                3.h(),

                "Dr. Mitchell Adams".bold14(color: ColorsConst.text),
              ],
            ),
          ),
          15.w(),
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(AssetsConst.avatar),
          )
        ],
      ),
    );
  }
}
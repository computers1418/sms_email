import 'package:flutter/material.dart';
import 'package:sms_email/widgets/confirm_sheet.dart';
import 'package:sms_email/widgets/success_sheet.dart';

class AppViewModel {

  late TextEditingController numberController;
  late TextEditingController emailController;


  late TextEditingController pNameController;
  late TextEditingController dNameController;
  late TextEditingController dateTimeController;
  late TextEditingController locationController;

  AppViewModel(){
    numberController = TextEditingController();
    emailController = TextEditingController();

    pNameController = TextEditingController();
    dNameController = TextEditingController();
    dateTimeController = TextEditingController();
    locationController = TextEditingController();
  }


  showConfirmSheet(BuildContext context){

    showModalBottomSheet(
      context: context, 
      builder: (_){
        return ConfirmSheet(
          onOk: (){
            showSuccessSheet(context);
          },
        );
      });
  }

  showSuccessSheet(BuildContext context){

    showModalBottomSheet(
      context: context, 
      builder: (_){
        return const SuccessSheet();
      });
  }

}
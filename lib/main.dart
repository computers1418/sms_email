import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_email/app.dart';
import 'package:sms_email/constants/theme_const.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light // Set your desired color
  ));

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!);
        },
      theme: ThemeConst.getApplicationTheme(),
      home: const App(),
    )
  );
}

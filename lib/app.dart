import 'package:flutter/material.dart';
import 'package:sms_email/app_viewmodel.dart';
import 'package:sms_email/constants/assets_const.dart';
import 'package:sms_email/constants/colors_const.dart';
import 'package:sms_email/extensions/number_exten.dart';
import 'package:sms_email/extensions/string_exten.dart';
import 'package:sms_email/widgets/custom_appbar.dart';
import 'package:sms_email/widgets/input_field.dart';
import 'package:sms_email/widgets/input_field2.dart';
import 'package:sms_email/widgets/message_content.dart';
import 'package:sms_email/widgets/single_select.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final templates = [
    "No SMS Template",
    "SMS Template 1",
    "SMS Template 2",
    "SMS Template 3",
    "SMS Template 4",
    "SMS Template 5",
    "SMS Template 6",
    "SMS Template 7"
  ];
  late AppViewModel _viewModel;

  String patientName = '';
  String doctorName = '';
  String dateTime = '';
  String location = '';

  bool enable = false;

  @override
  void initState() {
    _viewModel = AppViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Send".regular14(color: ColorsConst.textLight),
                        2.h(),
                        "Personalize".bold24(color: ColorsConst.text),
                      ],
                    ),
                  ),
                  12.h(),
                  Row(
                    children: [
                      Expanded(
                        child: SingleSelect(
                            items: templates, label: "No SMS Template"),
                      ),
                      20.w(),
                      Expanded(
                        child: SingleSelect(
                          items: templates,
                          label: "No Email Template",
                          enable: false,
                        ),
                      )
                    ],
                  ),
                  20.h(),
                  "Receiver Details".semibold12(color: const Color(0x4DFFFFFF)),
                  10.h(),
                  InputField(
                    controller: _viewModel.numberController,
                    image: AssetsConst.number,
                    hintText: "Patients Number",
                    onChanged: (e) {
                      if (_viewModel.numberController.text.trim().isNotEmpty ||
                          _viewModel.emailController.text.trim().isNotEmpty) {
                        setState(() {
                          enable = true;
                        });
                      } else {
                        setState(() {
                          enable = false;
                        });
                      }
                    },
                  ),
                  8.h(),
                  InputField(
                    controller: _viewModel.emailController,
                    image: AssetsConst.mail,
                    hintText: "Patients Email ID",
                    onChanged: (e) {
                      if (_viewModel.numberController.text.trim().isNotEmpty ||
                          _viewModel.emailController.text.trim().isNotEmpty) {
                        setState(() {
                          enable = true;
                        });
                      } else {
                        setState(() {
                          enable = false;
                        });
                      }
                    },
                  ),
                  30.h(),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      "Template 4".medium14(color: const Color(0xFFFFDE8F)),
                      Container(
                        padding: const EdgeInsets.all(36),
                        margin: const EdgeInsets.only(top: 4, bottom: 25),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(AssetsConst.pattern))),
                        child: MessageContent(
                            pName: patientName,
                            dName: doctorName,
                            dateTime: dateTime,
                            location: location),
                      ),
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          // onTap: enable
                          //     ? () => _viewModel.showConfirmSheet(context)
                          //     : null,
                          onTap: () {
                            if (_viewModel.numberController.text.isNotEmpty) {
                              _viewModel.phoneConfirmSheet(context);
                            }
                            if (_viewModel.numberController.text.isNotEmpty &&
                                _viewModel.emailController.text.isNotEmpty) {
                              _viewModel.showConfirmSheet(context);
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 176,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFE49356),
                                          Color(0xFFFF65DE)
                                        ])),
                                alignment: Alignment.center,
                                child:
                                    "SEND SMS".bold16(color: ColorsConst.text),
                              ),
                              if (!enable)
                                Container(
                                  width: 176,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  25.h()
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                  color: Color(0xFFF2F7FB)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Add Text to Template".semibold12(color: ColorsConst.primary),
                  15.h(),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: InputField2(
                            controller: _viewModel.pNameController,
                            hintText: 'Patient Name',
                            onChanged: (e) {
                              setState(() {
                                patientName = e;
                              });
                            }),
                      ),
                      20.w(),
                      Expanded(
                        flex: 4,
                        child: InputField2(
                            controller: _viewModel.dNameController,
                            hintText: 'Dr. Name',
                            onChanged: (e) {
                              setState(() {
                                doctorName = e;
                              });
                            }),
                      )
                    ],
                  ),
                  10.h(),
                  InputField2(
                      controller: _viewModel.dateTimeController,
                      hintText: 'Date & Time',
                      onChanged: (e) {
                        setState(() {
                          dateTime = e;
                        });
                      }),
                  10.h(),
                  InputField2(
                      controller: _viewModel.locationController,
                      hintText: 'Location',
                      onChanged: (e) {
                        setState(() {
                          location = e;
                        });
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

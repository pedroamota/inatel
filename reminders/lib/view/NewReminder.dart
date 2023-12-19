import 'dart:async';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:provider/provider.dart';
import 'package:reminders/controller/FlutterNotification.dart';
import 'package:reminders/models/apps.dart';
import 'package:sizer/sizer.dart';

import '../core/colors.dart';

class NewReminder extends StatefulWidget {
  List<AppInfo>? listApp;

  NewReminder({this.listApp});

  @override
  State<NewReminder> createState() => _NewReminderState();
}

class _NewReminderState extends State<NewReminder> {
  String? app;
  final sizeBox = 10.h;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Container(
          padding: EdgeInsets.only(top: 5.sp),
          height: 14.h,
          child: Row(
            children: [
              SizedBox(
                width: 2.w,
              ),
              Image(image: AssetImage("assets/reminders.png")),
            ],
          ),
          width: 60.w,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.tips_and_updates_outlined,
                      color: Colors.white,
                      size: 9.w,
                    ),
                    Text(
                      'Crie o seu primeiro Reminder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 5.w,
                        fontFamily: 'Concert',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 233, 147),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                  child: TextFormField(
                    key: formKey1,
                    controller: title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Concert',
                    ),
                    decoration: InputDecoration(
                      enabled: true,
                      contentPadding: EdgeInsets.only(left: 15, right: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      labelText: "Titulo:",
                      labelStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontFamily: 'Concert',
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        print("null text");
                        return "Preencha o campo";
                      }
                      title.text = value;
                      return "teste";
                    },
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 233, 147),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                  child: TextFormField(
                    key: formKey2,
                    controller: text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Concert',
                    ),
                    decoration: InputDecoration(
                      enabled: true,
                      contentPadding: EdgeInsets.only(left: 15, right: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      labelText: "Descrição:",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Concert',
                        fontSize: 10.sp,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        print("null descrição");
                        return "Preencha o campo";
                      }
                      text.text = value;
                      return "teste";
                    },
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 233, 147),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                  child: DropdownButtonFormField<String>(
                    iconSize: 20.sp,
                    decoration: InputDecoration(
                      enabled: true,
                      contentPadding: EdgeInsets.only(left: 14, right: 14),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      labelText: null,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) => setState(
                      () => dropdownValue = value,
                    ),
                    value: dropdownValue,
                    hint: Text(
                      "Escolha um App:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                    iconEnabledColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Concert',
                    ),
                    dropdownColor: Colors.white,
                    focusColor: Colors.transparent,
                    items: widget.listApp!.map<DropdownMenuItem<String>>(
                      (AppInfo value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Row(
                            children: [
                              Container(
                                  height: 4.h,
                                  child: Image.memory(value.icon!)),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                width: 65.w,
                                child: Text(
                                  value.name!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 35.sp,
            height: 35.sp,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              mini: true,
              onPressed: () {
                formKey1.currentState?.validate();
                formKey2.currentState?.validate();
                CustomNotification notification = CustomNotification(
                  id: 1,
                  title: "Reminders",
                  body: "${title.text}: ${text.text}",
                );
                Future.delayed(const Duration(seconds: 8),
                    () => printMensage(notification));

                //DBLocal().save(title.text, text.text, app);
              },
              child: Icon(
                Icons.check,
                size: 8.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  printMensage(notification) {
    Provider.of<NotificationService>(context, listen: false)
        .showNotification(notification);
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:reminders/models/reminder.dart';
import 'package:reminders/view/NewReminder.dart';
import 'package:reminders/core/colors.dart';
import 'package:sizer/sizer.dart';

import '../models/apps.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<AppInfo> listApp = [];
  Timer? timer;
  bool hasData = true;
  late Reminder listReminders;

  Future getAllApps() async {
    List<AppInfo> appInfo = await InstalledApps.getInstalledApps();
    for (AppInfo a in appInfo) {
      listApp.add(a);
    }
    print(listApp[0].name);
  }

  Future<Reminder> recuperaReminder() async {
    Reminder aux = Reminder();

    /*
    if (aux != 0) {
      aux.forEach(
        (i) {
          print("recupera reminder ${i.title}");
          listReminders.add(i);
        },
      );
    } else {
      hasData = false;
    }*/
    return aux;
  }

  @override
  void initState() {
    getAllApps();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.sp),
            height: 22.h,
            width: 100.w,
            child: Image(
              image: AssetImage("assets/reminders.png"),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 80.h,
              child: Image.asset("assets/home.gif"),
            ),
          ),
          Positioned(
            top: 90.h,
            left: 45.w,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewReminder(
                    listApp: listApp,
                  ),
                ),
              ),
              child: Icon(
                Icons.add_outlined,
                size: 30.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
          Center(
            child: FutureBuilder(
              future: recuperaReminder(), //_pdfInfo()
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return hasData
                      ? Container(
                          width: 20.w,
                          height: 30.h,
                          color: Colors.redAccent,
                        )
                      : Container(
                          child: Text("${lembrete}"),
                        );
                } else {
                  recuperaReminder();
                  return CircularProgressIndicator();
                }
              },
            ),
          )




loading
        ? Container(
            child: Column(
              children: [
                SizedBox(
                  height: 3.0.h,
                ),
                CircularProgressIndicator()
              ],
            ),
          )
        : (pacientes.isEmpty)
            ? Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Container(
                        child: Icon(
                          LineIcons.user,
                          size: 20.0.h,
                          color: Colors.grey[300],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.0.w, left: 10.0.w),
                        child: Text(
                          lang.noPatientFound,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: TextH.subtitle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Container(
                height: 65.0.h,
                width: 90.0.w,
                child: Scrollbar(
                  thickness: 2.0.w,
                  isAlwaysShown: true,
                  radius: Radius.circular(10),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.transparent,
                          Colors.white,
                        ],
                        stops: [0.6, 1],
                      ).createShader(bounds);
                    },
                    child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 2.5.h,
                        );
                      },
                      itemCount: pacientes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 6.0.h,
                          width: 90.0.w,
                          padding: EdgeInsets.only(
                            left: 1.0.w,
                            right: 2.0.w,
                          ),
                          margin: EdgeInsets.only(
                            left: 4.0.w,
                            right: 4.0.w,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  offset: Offset(0, 5),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: Row(
                            children: [
                              // Initial Icon
                              GestureDetector(
                                child: Container(
                                  height: 4.5.h,
                                  width: 4.5.h,
                                  margin: EdgeInsets.only(
                                    left: 1.0.w,
                                    right: 2.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: Styles.Gradient,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      pacientes[index]
                                          .trim()
                                          .split(' ')
                                          .map((l) => l[0])
                                          .take(2)
                                          .join(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: TextH.subtitle - 1.w,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  featuresPaciente(
                                    pacientes[index],
                                    emailkey[index],
                                    index,
                                  );
                                },
                              ),

                              // Nome do Paciente
                              GestureDetector(
                                child: Container(
                                  width: 60.0.w - 4.5.h,
                                  padding: EdgeInsets.only(left: 2.0.w),
                                  child: Text(
                                    pacientes[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: TextH.subtitle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  featuresPaciente(
                                    pacientes[index],
                                    emailkey[index],
                                    index,
                                  );
                                },
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 6.0.w,
                                ),
                                onTap: () => showSelect(emailkey[index]),
                              ),

                              // Espaçamento
                              SizedBox(
                                width: 3.0.w,
                              ),
                              GestureDetector(
                                child: Icon(Icons.remove_red_eye, size: 6.0.w),
                                onTap: () => selectHistoric(
                                  index,
                                  emailkey[index],
                                ),
                              ), //_recuperarMedidas(index)),
                            ],
                          ),
                        );
                      },
                    ),
                    blendMode: BlendMode.dstOut,
                  ),
                ),
              );
  }
 */
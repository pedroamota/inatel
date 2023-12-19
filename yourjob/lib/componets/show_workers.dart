import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yourjob/model/funcao.dart';
import 'package:yourjob/model/worker.dart';

class ShowWorkers {
  showWorker(
    int index,
    BuildContext context,
    List<Worker> workersList,
  ) {
    return showDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (
        BuildContext context,
      ) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              scrollable: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 93.0.w,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2.w, right: 2.w),
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 20.sp,
                        height: 20.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                        child: GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            height: 20.sp,
                            width: 20.sp,
                            child: Center(
                              child: Icon(
                                Icons.clear,
                                color: Colors.black.withOpacity(.5),
                                size: 18.sp,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        workersList[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(workersList[index].category),
                          Row(
                            children: [
                              Text("Estrelas: ${workersList[index].stars}"),
                              const Icon(Icons.star),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Funcoes().sendMessage(workersList[index].phone),
                      child: Text(
                        workersList[index].phone,
                      ),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

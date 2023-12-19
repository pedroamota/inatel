import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yourjob/componets/show_workers.dart';
import 'package:yourjob/helpers/crub.dart';
import 'package:yourjob/model/worker.dart';

class ListServices extends StatefulWidget {
  final String? category;

  const ListServices({super.key, this.category});

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Crud().getAllData(widget.category),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot != 404) {
          List<Worker> workers = snapshot.data as List<Worker>;
          return SizedBox(
            height: 80.0.h,
            width: 100.w,
            child: Scrollbar(
              thickness: 2.0.w,
              isAlwaysShown: true,
              radius: const Radius.circular(10),
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 2.2.h,
                  );
                },
                itemCount: workers.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () =>
                        ShowWorkers().showWorker(index, context, workers),
                    child: Container(
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
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 207, 207, 207),
                              offset: Offset(0, 5),
                              blurRadius: 5,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Nome do Paciente
                          Container(
                            width: 40.w,
                            padding: EdgeInsets.only(left: 2.0.w),
                            child: Text(
                              workers[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            workers[index].category,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Icon(
                              Icons.phone,
                              size: 6.0.w,
                            ),
                          ), //_recuperarMedidas(index)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }
      },
    );
  }
}

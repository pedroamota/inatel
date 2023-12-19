import 'package:flutter/material.dart';
import 'package:yourjob/componets/list_services_widgets.dart';

class FilterPage extends StatelessWidget {
  final String category;

  const FilterPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 84, 149),
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: ListServices(
          category: category,
        ),
      ),
    );
    ;
  }
}

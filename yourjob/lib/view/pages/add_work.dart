import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yourjob/helpers/crub.dart';
import 'package:yourjob/model/worker.dart';
import 'package:yourjob/view/pages/home_page.dart';

class AddWork extends StatefulWidget {
  const AddWork({super.key});

  @override
  State<AddWork> createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  String? dropdownValueActivity;

  InputDecoration decorations = const InputDecoration(
    enabled: true,
    contentPadding: EdgeInsets.only(left: 15, right: 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    labelStyle: TextStyle(color: Colors.grey),
  );

  @override
  void initState() {
    _name.text = '';
    _phone.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cadastre um Novo Serviço',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: 60.h,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Nome da empresa"),
              TextFormField(
                controller: _name,
                decoration: decorations,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o nome da empresa";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              const Text("Categoria da empresa"),
              DropdownButtonFormField<String>(
                decoration: decorations,
                onChanged: (value) => {
                  dropdownValueActivity = value,
                },
                value: dropdownValueActivity,
                hint: const Text(
                  "Categoria",
                ),
                items: [
                  'Jardim',
                  'Casa',
                  'Eletrodomesticos',
                  'Cozinha',
                  'Educação',
                  'Saúde',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Escolha uma categoria";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              const Text("Numero da empresa"),
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.number,
                decoration: decorations,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o numero";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Crud().insertWorker(
                        Worker(
                          name: _name.text,
                          category: dropdownValueActivity!,
                          phone: _phone.text,
                          stars: 5,
                        ),
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MyHomePage(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yourjob/view/pages/filter_page.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({super.key});

  List<AssetImage> categorias = [
    const AssetImage("assets/casa.jpeg"),
    const AssetImage("assets/cozinha.jpeg"),
    const AssetImage("assets/educacao.jpeg"),
    const AssetImage("assets/eletro.jpeg"),
    const AssetImage("assets/jardim.jpeg"),
    const AssetImage("assets/saude.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    List listaCategorias = [
      'Casa',
      'Cozinha',
      'Educação',
      'Eletrodomesticos',
      'Jardim',
      'Saúde',
    ];

    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Categorias',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50.h,
            width: 90.w,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: categorias.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1.9,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterPage(
                        category: listaCategorias[index],
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: Image(image: categorias[index], fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

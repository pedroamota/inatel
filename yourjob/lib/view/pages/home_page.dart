import 'package:flutter/material.dart';
import 'package:yourjob/componets/list_services_widgets.dart';
import 'package:yourjob/view/pages/add_work.dart';
import 'package:yourjob/view/pages/abas/home_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int pageIndex;

  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'All')
  ];

  final List<Widget> _bodys = [
    HomePageWidget(),
    const ListServices(),
  ];

  void handleTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    pageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/logo.png"),
              height: 50,
            ),
            SizedBox(width: 8),
            Text(
              "YourJob",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 4, 84, 149),
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: Center(child: _bodys.elementAt(pageIndex))),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: pageIndex,
        items: _abas,
        onTap: handleTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddWork())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

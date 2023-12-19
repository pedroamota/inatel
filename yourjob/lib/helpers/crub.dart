import 'package:yourjob/helpers/connectDB.dart';
import '../model/worker.dart';

class Crud extends connectBD {
  getAllData([category]) async {
    final conn = await connectBD().dbConnect();
    List<Worker> servicos = [];

    try {
      final result = category != null
          ? await conn.query(
              'SELECT * FROM worker WHERE category = ?',
              [category],
            )
          : await conn.query('SELECT * FROM worker');
      await conn.close();

      result.forEach(
        (i) {
          Worker aux = Worker(
            name: i["name"],
            category: i["category"],
            stars: i["stars"],
            phone: i["phone"],
          );
          servicos.add(aux);
        },
      );
    } catch (e) {
      return 404;
    }

    return servicos;
  }

  insertWorker(Worker add) async {
    final conn = await connectBD().dbConnect();

    try {
      final result = await conn.query(
          "INSERT INTO worker (name, category, phone, stars) VALUES (?,?,?,?)",
          [add.name, add.category, add.phone, add.stars]);
    } catch (e) {
      return 404;
    }
    return 202;
  }
}

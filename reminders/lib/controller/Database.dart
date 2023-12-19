import 'package:reminders/models/reminder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBLocal {
  _getDBLocal() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'reminder.db');
    var db = openDatabase(
      path,
      version: 1,
      onCreate: (db, verRecente) async {
        //Sera usado ID?
        await db.execute(
            "CREATE TABLE lembretes (title TEXT, text TEXT, app TEXT)");
      },
    );
    return db;
  }

  save(title, text, app) async {
    Database db = await _getDBLocal();
    Map<String, dynamic> dados = {
      "title": title,
      "text": text,
      "app": app,
    };
    db.insert("lembretes", dados);
  }

  update(Reminder note) async {
    Database db = await _getDBLocal();
    await db.rawQuery(
      "UPDATE lembretes SET text = ? and title = ? and app = ? WHERE id = ?",
      [
        note.text,
        note.title,
        note.app,
      ],
    );
  }

  remove(String id) async {
    Database db = await _getDBLocal();
    db.delete(
      "lembretes",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  getAllReminders() async {
    List<Reminder> notes = [];
    Database db = await _getDBLocal();
    List<Map> list = await db.rawQuery('SELECT * FROM lembretes');

    if (list.length != 0) {
      
      list.forEach(
        (element) {
          Reminder aux = Reminder();
          aux.title = element["title"];
          aux.text = element["text"];
          aux.app = element["app"];
          notes.add(aux);
          print("get database; ${aux.title}");
        },
      );
    } else {
      return 0;
    }
    return notes[0];
  }
}

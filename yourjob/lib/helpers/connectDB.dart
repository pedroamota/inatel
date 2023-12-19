import 'package:mysql1/mysql1.dart';

class connectBD {
  dbConnect() async {
    try {
      final client = await MySqlConnection.connect(
        ConnectionSettings(
          host: '138.94.52.106',
          port: 3306,
          user: 'userBiva',
          password: 'bS3/ZI/rkF',
          db: 'dbiva',
        ),
      );
      return client;
    } catch (e) {
      return null;
    }
  }
}

import 'package:mysql1/mysql1.dart';
class DataBaseConection{
  static Future <MySqlConnection> getConnection()async{
    //CONFIGURAMOS LA CONEXIÓN
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'loveland_db',
    );
    var conn = await MySqlConnection.connect(settings);
    return conn;
  }
  //Cuando queramos conectarnos, solo tendremos que conectarnos con:"DataBaseConection.getConnection();"
  

}
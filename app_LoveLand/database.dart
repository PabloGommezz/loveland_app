//Vamos a crear la base de datos para la app. 
import 'package:mysql1/mysql1.dart';
main()async{

  var settings = new ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    db:'loveland_db',
    
  );

  var conn = await MySqlConnection.connect(settings);
  await conn.query("USE loveland_db");
  await conn.query ("""CREATE TABLE IF NOT EXISTS usuarios(
  CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50) NOT NULL,
  contrasena VARCHAR(100) NOT NULL,
  edad INT NOT NULL,
  genero VARCHAR(10) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
  )""");




   


}
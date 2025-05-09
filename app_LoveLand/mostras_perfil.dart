
import 'conexion_db.dart';
import 'dart:io';
class MostrasPerfil{
 static Future<void> mostrarPerfil(String nombre, String contrasena) async {
  stdout.writeln("A continuación se muestra tu perfil:");
  stdout.writeln("Introduce tu nombre de usuario para mostrar tu perfil:");
  nombre=stdin.readLineSync()??"Error";
  while (nombre.isEmpty){
    stdout.writeln("🚨 el nombre no puede estar vacío");
  }
  stdout.writeln("Ahora introduce tu contraseña para mostrar tu perfil:");
  contrasena=stdin.readLineSync()??"Error";
  while (contrasena.isEmpty){
    stdout.writeln("🚨 la contraseña no puede estar vacía");
  }

  final conn = await DataBaseConection.getConnection();

  final resultado = await conn.query(
    'SELECT * FROM usuarios WHERE usuario = ? AND password = ?',
    [nombre, contrasena],
  );

  if (resultado.isNotEmpty) {
    for (var fila in resultado) {
      print("Nombre: ${fila['usuario']}");
      print("Contraseña: ${fila['password']}");
      print("Edad: ${fila['edad']}");
      print("Género: ${fila['genero']}");
      print("Ciudad: ${fila['ciudad']}");
      print("Info: ${fila['info_usuario']}");
    }
  } else {
    print("No se encontró ningún usuario con esas credenciales.");
  }

  await conn.close();
}
}
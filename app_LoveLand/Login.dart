import 'dart:io';
import 'VerificarUsuario.dart';
import 'conexion_db.dart';

 class Login {
  Future <void> Loguear()async{
  bool loginCorrecto=false;
  while(!loginCorrecto){
    stdout.write("""
  Introduce tu nombre
""");
    String nombre = stdin.readLineSync()??"error";
    stdout.write("""
  Introduce tu contraseña
""");
    String contrasena =stdin.readLineSync()??"Error";

    //Primero verificamos que no sean campos vacíos.
    if(nombre.trim().isNotEmpty && contrasena.trim().isNotEmpty){//si no estan vacíos. Al usar el operador "??" en caso de ser vacios me lo devolveria como error. 
      loginCorrecto=await verificarUsuario(nombre,contrasena); //llamo a la función para verificar el usuario y le paso los valores metidos por el usuario
      //Si el login es correcto:
      if(loginCorrecto){
        print("!Login correcto! Bienvenido de nuevo $nombre");
      }else {
        //si el login es incorrecto
        print ("!Error! El usuario o contraseña no coinciden. Intentalo de nuevo");
      }
    }else {
      //Si no ingresa ambos datos
      print("!Error! Debes introducir tanto el nombre como la contraseña. Por favor, vuelve a intentarlo");
    }

  }
 }

 }
 


import 'Api.dart';
import 'conexion_db.dart';
import 'menuEjecutable.dart';
import 'menu_dentro.dart'; 
import 'dart:io';
import 'Registro.dart';
import 'Login.dart';
import 'usuario.dart';
main()async{

 try{

    // Crear la conexión a la base de datos
    var conn = await DataBaseConection.getConnection();
    
    // Cerrar la conexión al final
    await conn.close();
}catch(e){
  print ("$e");
  
 //}finally{
   //var conn = await DataBaseConection.getConnection();
  //await conn.close();
}

stdout.writeln("""
!Hola!
¿Eres nuevo o ya eres de los nuestro? :)
(1)==> REGISTRARSE 🆕👤
(2)==> INICIAR SESIÓN 🚪🔑
(3)==> MOSTRAR TODOS LOS USUARIOS DE LA APP(nombre y edad)
(4)==> RECIBIR UN CONSEJO DE LOVELAND 💘
(5)==> ESCUCHAR UNA FRASE AMOROSA 💌
""");

int opcion;
String respuesta= stdin.readLineSync()??"Error";
opcion=int.tryParse(respuesta)?? 0;
if(opcion==1){
  // Llamar a la función Registro() desde la instancia de Menu
  var menu = Menu();
  await menu.Registro();
  MenuDentro.Opciones();
  
}else if(opcion==2){
  var inicioSesion = Login();
  await inicioSesion.Loguear();
  MenuDentro.Opciones();
}else if (opcion==3){
  await mostrarTodosLosUsuarios();
}else if(opcion==4){
  await Api.obtenerConsejo();
  return main();
} else if(opcion==5){
  await Api.obtenerFraseAmorosa();
  return main();
}


}

// Función para mostrar todos los usuarios
Future<void> mostrarTodosLosUsuarios() async {
  var usuarios = await Usuario().all(); // Devuelve una lista de objetos Usuario
  
  if (usuarios.isEmpty) {
    print("No hay usuarios en la base de datos.");
  } else {
    print("Usuarios registrados:");
    for (var usuario in usuarios) {
      print('Usuario: ${usuario.nombre}, Edad: ${usuario.edad}');
    }
  }
}













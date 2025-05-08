import 'dart:io';
import 'package:mysql1/mysql1.dart';

import 'conexion_db.dart';
 class Buscador {
  static filtroBusqueda() async{
    stdout.write
    ("""

    Selecciona tu rango de edad. (Ejemplo : 18 - 23)
    """);
    String respuesta =stdin.readLineSync()??"Error";
    var partes = respuesta.split('-'); // separa el intervalo en dos partes: edad mínima y edad máxima, de manera automática. 
    if(partes.length !=2){
      print("formato inválido. Debes asegurarte de introducir el intervalo corréctamente");
      return;
    }
    int? edadMin = int.tryParse(partes [0].trim());
    int? edadMax = int.tryParse(partes[1].trim());//el '.trim()' limpia espacios en blanco que puedan entorpecer la busqueda en nuestra Database. 
    if(edadMin==null||edadMax==null){
      print("Rango de edad inválido. Asegúrate de ingresar números");
      return;
    }
    stdout.write("¿Buscas hombres, mujeres...? ");
    String generoBusqueda = stdin.readLineSync() ?? "";
    stdout.write("¿Por que ciudad te gustaría buscar?(Madrid o Talavera de la Reina)");
    String ciudadBusqueda =stdin.readLineSync()??"Error";
    if (generoBusqueda.isEmpty || ciudadBusqueda.isEmpty){
      print("genero o ciudad no válidos. Puede que no hayas rellenado estos campos de búsqueda");
      return;
    }
    print("🔍 Buscando perfiles entre $edadMin y $edadMax años, género: ${generoBusqueda.toLowerCase()}, ciudad: $ciudadBusqueda...\n");
    var conn =await DataBaseConection.getConnection();// nos conectamos a la base de datos.
    var resultado = await conn.query( 
      "SELECT * FROM usuarios WHERE edad BETWEEN ? AND ? AND genero = ? AND ciudad = ?", 
      [edadMin,edadMax,generoBusqueda.toLowerCase(),ciudadBusqueda],// el '.toLowercase()' convierte las letras mayusculas en minúsculas. 
    );
    await conn.close();
    //Ahora, haremos que el resultado se muestre en la pantalla del usuario:
    if (resultado.isNotEmpty){
      print("afinando la búsqueda");
      for (var fila in resultado){
        print(fila);
      }
    } else{
      print("ops! No hemos encontrado resultados disponibles");
    }
  }
 }
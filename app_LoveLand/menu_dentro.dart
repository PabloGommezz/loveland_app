// menu_dentro.dart

import 'dart:io';

import 'menuEjecutable.dart';

class MenuDentro {
   static Opciones() async {
    stdout.writeln("""Elige la sección a la que te gustaría entrar
          (1) Encontrar un plan para esta noche 😈
          (2) Tomar un primer contacto 
          (3) Buscar algo temporal, sin mucho compromiso 😜
          (4) Encontrar al amor de tu vida, "Love is in the air" 🙋‍♂️💘🙋‍♀️
      """);
    int? opcion;
    String respuesta = stdin.readLineSync() ?? "Error";
    opcion = int.tryParse(respuesta);
    if (opcion == 1) {
      stdout.writeln("""¿Buscas algo rápido y sin tensiones? Bienvenido a la sección más picante y ardiente de LoveLand.""");
      var menu1 =menuEjecutable();
      await menu1.Opcion1();
 
    } else if (opcion == 2) {
      stdout.writeln("""¿Despacio o lento? Bienvenido a la sección más impredecible de Loveland.""");
      var menu2 =menuEjecutable();
      await menu2.Opcion2();
       
    } else if (opcion == 3) {
      print("""¿Seriedad informal? Bienvenido a la sección más escurridiza y apasionante de LoveLand.""");
      var menu3=menuEjecutable();
      await menu3.Opcion3();
    } else if (opcion == 4) {
      print("""¿Te adentras a la mayor búsqueda de tu vida? Bienvenido a la sección más romántica y mágica de LoveLand.""");
      var menu4=menuEjecutable();
      await menu4.Opcion4();
    }
  }
}

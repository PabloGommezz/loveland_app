import 'dart:io';
import 'conexion_db.dart';
import 'package:mysql1/mysql1.dart';
import 'bucarUsuarios.dart';
class menuEjecutable{
   Future <void> Opcion1()async{
    stdout.writeln("""
En esta sección, encontrarás personas que, al igual que tu, desean encontrar un plan inmediato e inprovisado. 
Seguramente, aunque no lo creas, esta es la sección más misteriosa y desconocida de todas. ¿Te preguntarás por que 🤔? 
Lo que empieza como algo informal y espontáneo, a veces termina en una boda impresionante, y si no me crees... !solo adéntrate!

A continuación te presentaremos algunos perfiles que podrían interesarte... 📝
""");
 await Buscador.buscarUsuarios();
  
    
  }
  Future <void> Opcion2()async{
    stdout.writeln("""
  La toma de contacto es super importante a la hora de conocer a una persona. Muchas veces, los primeros minutos con una persona🤝,
  nos dice mucho sobre la personalidad de un individuo. A veces, en cuestión de minutos ⏲️, nuestro cuerpo se quiere aferrar a pasar el máximo tiempo con
  esa persona 🧑‍🤝‍🧑, pero otras... solo queremos salir corriendo 🏃‍♀️💨. 
  Aquí, en esta sección, podrás conocer si el amor a primera vista existe, o no 🕵️🌍. 

""");
await Buscador.buscarUsuarios();
  }
  Future <void> Opcion3() async{
    stdout.writeln("""
  Hay personas que deciden apostar todo al color de la esperanza del amor 🎰, y buscar a esa persona que le rebose de energía por el resto de sus vidas 🤸‍♂️...
  ¿Un poco ñoño verdad 😳? Otros que prefieren, sin más, buscar la intimidad sin ningún compromiso a futuro... ¿quizás un poco rebelde 🤘? 
  Sin embargo, "el equilibrio es la virtud ⚖️", por lo que esta sección es el espacio intermedio para aquellos que prefieren ir con los pies en el suelo, 
  y tomar cada paso 🎶 sin pausa pero sin prisa 🎶. 

""");
await Buscador.buscarUsuarios();
  }
  Future <void> Opcion4() async{
    stdout.writeln("""
  Aquellos ineptos que dicen saber que el amor ha desaparecido en esta nueva sociedad, no tiene ni idea 😡. Y más aquellos que creen que es imposible encontrar a 
  tu persona ideal en una aplicación de móvil y una página web 📱. 
  Si, en esta sección, esas sugerencias se vuelven ridículas, pues aquí dentro, podrás encontrar y conocer a tu persona favorita. Si eres de esas personas que 
  todavía cree en el amor duradero y eterno, has encontrado tu lugar ✔️. 

""");
await Buscador.buscarUsuarios();
}
}
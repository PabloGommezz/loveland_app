import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:io';

class Api {
  static Future <void> obtenerConsejo() async{
    var url = Uri.parse("https://api.adviceslip.com/advice");
    
    try{
      var respuesta = await http.get (url);
      if( respuesta.statusCode == 200){
        var datos = jsonDecode(respuesta.body);
        var consejo = datos ['slip']['advice'];
        print 
        ("""\n Consejo de Loveland 📝:
        $consejo\n""");
      } else {
        print
        ("""No se pudo obtener el consejo. Inténtelo mas tarde.""");

      }
    }catch (e){
      print("error al conectar con la API: $e");
    }
  }
   static Future<void> obtenerFraseAmorosa() async {
  var url = Uri.parse('https://zenquotes.io/api/random'); // URL de la API
  var respuesta = await http.get(url); // Hacemos la petición

  if (respuesta.statusCode == 200) {
    var data = jsonDecode(respuesta.body); // Convertimos la respuesta a JSON
    var frase = data[0]['q']; // Obtenemos el texto del consejo
    var autor = data[0]['a']; // Obtenemos el autor

    print("\n💘 Consejo amoroso para ti:");
    print('"$frase"');
    print("— $autor\n");
  } else {
    print("Error al obtener el consejo.");
  }
}
}
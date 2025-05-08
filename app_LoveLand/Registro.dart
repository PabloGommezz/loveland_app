import 'dart:io';
import 'conexion_db.dart';




class Menu {

  Future<void> Registro() async {
    var conn = await DataBaseConection.getConnection();

    try {
      stdout.writeln('''
¡Vaya! Así que eres nuevo por aquí, ¡qué alegría me da recibir nuevos visitantes a la isla! 
Como ya te habrán contado en el poblado, aquí podrás encontrar cientos de personas que, como tú, están dispuestas
a vivir experiencias increíbles 💕.   
Nuestro objetivo en esta isla es que salgas de aquí con la serotonina por las nubes...😍 ¡Estoy deseando que empieces!

Antes de nada, queremos saber de ti... ¿cuál es tu nombre?
Recuerda que este nombre es público, y los demás usuarios te conocerán e interactuarán contigo por tu nombre que hayas introducido. 
😎
''');
// Validación robusta para el nombre de usuario
    String? usuario;
      String respuesta = stdin.readLineSync() ?? "Error";
      
      // Verificar que no sea vacío y que no contenga solo espacios
      //Usamos while para que en caso de error, vuelva a pedir que ingrese el nombre.
      while (respuesta == "Error" || respuesta.isEmpty||respuesta.length>50) {
        print("Error: El nombre no puede ser vacío. Por favor, ingresa un nombre válido y que no supere los 50 caractéres.");
      }
      usuario = respuesta ;
      
     

      stdout.writeln("""
¡Bienvenido $usuario! Ay, me encanta tu nombre... $usuario. ¡Destila pasión!
Creo que pronto saldrás de esta isla;)

Ahora debes crear una contraseña para tu perfil... ya sabes, para que no ande cualquiera con tu cuenta. 
Recuerda introducir una contraseña sencilla y fácil de recordar para ti (pero difícil de descifrar)
""");

      String? contrasena;
      String respuestaa = stdin.readLineSync() ?? "Error";

      while (respuestaa == "Error" || respuestaa.isEmpty || respuestaa.length > 250) {
        print("Error: La contraseña no puede ser vacía y debe tener como máximo 250 caracteres.");
      }
      contrasena=respuestaa;

    

      stdout.writeln('''
Recuerda $usuario que cada vez que entres a la isla te pediremos tu contraseña...
Si lo ves necesario, apúntalo en un papel :)

¡Necesito empezar ya! Pero recuerda que este sitio no es para menores de 18 años.
Introduce tu edad

''');
int? edad;

do {
  stdout.writeln("¿Cuántos años tienes?");
  String input = stdin.readLineSync() ?? "";

  edad = int.tryParse(input.trim());

  if (edad == null) {
    print("Por favor, introduce un número válido.");
  } else if (edad < 18) {
    print("Eres menor de edad. No puedes entrar a la isla.");
    edad = null; // Forzar a que se repita el bucle
  }

} while (edad == null);

print("¡Perfecto! Tienes $edad años y puedes entrar.");



      


    
    

      print("""
Bienvenido a la isla 🎉. Por fin podemos confirmar que ya eres de los nuestros🙃
      """);

      print("""
Para que nuestras búsquedas sean más específicas necesitamos conocer donde vives o donde resides actualmente.
Recuerda que aquí te presentaremos las mejores opciones acorde a tus rangos de búsqueda...
Aquí se tiene en cuenta todo, hasta los pelos de tus brazos 📒 
""");
      String? ciudad;
      String respuest= stdin.readLineSync() ?? "Error";

      // Validar que la ciudad no esté vacía
      while (respuest == "Error" || respuest.isEmpty) {
        print("Error: La ciudad no puede ser vacía. Por favor, ingresa una ciudad válida.");
      
      }
      ciudad=respuest;

      
      

      stdout.writeln("""
¡Me encanta! $ciudad es un lugar que me encanta. 
En esta aplicación no solo necesitamos conocer dónde vives, sino por supuesto, tu rango de desplazamiento. 
Entendemos que dependiendo de tu disponibilidad y tus ganas de emprender nuevas aventuras, serás capaz de desplazarte más o menos...
¿Qué eres, de buscar cerquita de ti o de ser un Indiana Jones con espíritu aventurero 🧳🗺️
""");

      stdout.writeln("Introduce la distancia teniendo en cuenta que el valor por defecto será en Kilómetros");
      double? movilidad;
      do {
        String distancia= stdin.readLineSync() ?? "Error";
        movilidad = double.tryParse(distancia);
        if (movilidad == null) {
          print("Por favor, introduce un valor válido. Puedes introducir valores decimales.");
        } else {
          print("$movilidad kilómetros");
        }
      } while (movilidad == null);

     

      stdout.writeln("""
Pues $usuario... YA ESTÁS DENTRO, eres oficialmente un nuevo usuario aquí, en Loveland. 
A partir de aquí iniciarás una experiencia única, maravillosa y sobre todo llena de emociones y diversiones. 
Recuerda que no es solo una app para ligar como muchos ineptos dicen... 😒
Este es un lugar especial, mágico, y dónde las personas desean conocerse para conectar con nuevas emociones internas...

Creo que hablo demasiado...😳
Ya veo en tus ojos la ilusión que tienes por entrar, ¡DISFRUTA! 
""");

 await conn.query(
  "INSERT INTO usuarios (usuario, password, edad, ciudad) VALUES (?,?,?,?)",
  [usuario, contrasena, edad, ciudad]
);

    } catch (e) {
      print("Error en la conexión o en la ejecución de consultas: $e");
    } finally {
      await conn.close(); // Cerrar la conexión
    }
  }



  Future<void> Login()async{
    //Conexion a la base de datos
    var conn = await DataBaseConection.getConnection();
  try{
    print("Hola de nuevo! Ingresa tu nombre de usuario");
    String usuario=stdin.readLineSync()??"Error";
    print("Ahora introduce tu contraseña");
    String contrasena=stdin.readLineSync()??"Error";
    
    // Realizar la consulta para buscar el usuario
    var result = await conn.query(
      'SELECT * FROM usuarios WHERE usuario = ?', 
      [usuario]
    );
    if (result.isEmpty) {
      // Si no se encuentra el usuario
      stdout.writeln("El nombre de usuario no existe.");
    } else {
      // Si el usuario existe, se compara la contraseña
      var storedPassword = result.first;  // Primer (y único) resultado de la consulta
      
    if (storedPassword == contrasena) {
        // Contraseña correcta
        stdout.writeln("""
¡Bienvenido, $usuario! Es un placer volver a verte dentro de la isla. !Ya te echabamos de menos!
        """);
      } else {
        // Contraseña incorrecta
        stdout.writeln("Contraseña incorrecta. Inténtalo de nuevo.");
      }
    }
  }catch(e){
    stdout.writeln("Error en el login $e");
  }finally{
    await conn.close();
  }
    
  }
}







   
    



  
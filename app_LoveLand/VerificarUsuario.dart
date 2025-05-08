
import 'conexion_db.dart';


Future <bool> verificarUsuario (String usuario,String contrasena) async{

   
    var conn = await DataBaseConection.getConnection();
    final resultado = await conn.query(
      "SELECT * FROM usuarios WHERE usuario=? AND password=?",
      [usuario,contrasena],
    );
    await conn.close();
    return resultado.isNotEmpty;

    }

  

   

import "package:mysql1/mysql1.dart";

import "conexion_db.dart";
import "model_class.dart";

class Usuario extends ModelClass {
  
  String? _nombre;
  String? _contrasena;
  int? _edad;

  @override
  String? tableName = 'usuarios';
  @override
  String? primaryKey = 'id_usuario';
  @override
  Map <String, dynamic> campos() => {"usuario" :_nombre ,"password":_contrasena};

  // Getters que permiten null safety
  String? get nombre => _nombre;
  String? get contrasena => _contrasena;
  int? get edad => _edad;
  

  // Setters
  set nombre (String? texto) => _nombre=texto;
  set contrasena(String? texto) => _contrasena=texto;
  set edad (int? edad) => _edad = edad;
  //Constructores
  Usuario();

  Usuario.fromMap(ResultRow map) {
    _nombre = map ['usuario'];
    _contrasena = map ['password'];
  }
  @override
 fromMap(ResultRow row) => Usuario.fromMap(row);
 loginUsuario() async {
  var conn =await DataBaseConection.getConnection();
  try{
    var resultado=await conn.query('SELECT * FROM usuarios WHERE nombre =?', [_nombre]);
    Usuario usuario =Usuario.fromMap(resultado.first);
    if (_contrasena==usuario.contrasena) {
      return usuario;
    } else {
      return false;
    }
  } catch (e) {
    print (e);
    return false;
  } finally{
    await conn.close();
  }
 }

  
}


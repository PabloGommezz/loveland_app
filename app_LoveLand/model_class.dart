import 'package:mysql1/mysql1.dart';

import 'conexion_db.dart';

abstract class ModelClass {
  // Nombre de la tabla y clave primaria
  String? get tableName;
  String? get primaryKey;

  // Método para convertir una fila de la base de datos en un objeto
  ModelClass fromMap(ResultRow row);

  // Método para convertir un objeto en un mapa (clave:valor)
  Map<String, dynamic> campos();

  all () async {
    var conn =await DataBaseConection.getConnection();
    try{
      var resultado = await conn.query('SELECT * FROM $tableName');
      List registros = resultado.map((row) => fromMap(row)).toList();
      return registros;
    } catch (e) {
      print (e);
    } finally {
      await conn.close();
    }
  }
  
  get (int id) async{
    var conn = await DataBaseConection.getConnection();
    try{
      var resultado = await conn.query('SELECT *  FROM $tableName WHERE $primaryKey = ?',[id]);
      var registro = fromMap (resultado.first);
      return registro;
    } catch (e){
      print (e);
    } finally {
      await conn.close();
    }
  }

  insert () async{
    var conn = await DataBaseConection.getConnection();
    String listaCampos = campos().keys.join(",");
    List valores  = campos().values.toList();
    String interrogantes = valores.map((e)=>"?").join(",");
    try{
      await conn.query ('INSERT INTO $tableName ($listaCampos) VALUES ($interrogantes)',
          valores);
          print ('registro insertado correctamente');
    } catch (e){
      print (e);
    } finally {
      await conn.close();
    }
  }

}
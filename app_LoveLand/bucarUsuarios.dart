import 'dart:io';
import 'package:mysql1/mysql1.dart';
import 'conexion_db.dart';

class Buscador {
  static Future<void> buscarUsuarios() async {
    print("\n🔎 Vamos a buscar usuarios registrados...");

    // Pedir rango de edad
    stdout.write("Introduce el rango de edad (Ejemplo: 20-35): ");
    String entrada = stdin.readLineSync() ?? "";
    var partes = entrada.split('-');

    if (partes.length != 2) {
      print("⚠️ Formato incorrecto. Usa el formato: numero-numero.");
      return;
    }

    int? edadMin = int.tryParse(partes[0].trim());
    int? edadMax = int.tryParse(partes[1].trim());

    if (edadMin == null || edadMax == null) {
      print("⚠️ Edad inválida. Escribe solo números.");
      return;
    }

    // Pedir género
    stdout.write("¿Género (hombre, mujer, binario)?: ");
    String genero = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    // Pedir ciudad
    stdout.write("¿Ciudad?: ");
    String ciudad = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    print("\nBuscando usuarios entre $edadMin y $edadMax años, género: $genero, ciudad: $ciudad...\n");

    try {
      var conn = await DataBaseConection.getConnection();
      var resultados = await conn.query(
        'SELECT usuario, edad, genero FROM usuarios WHERE edad BETWEEN ? AND ? AND LOWER(genero) = ? AND LOWER(ciudad) = ?',
        [edadMin, edadMax, genero, ciudad]
      );
      await conn.close();

      if (resultados.isNotEmpty) {
        print("✅ Usuarios encontrados:\n");
        for (var fila in resultados) {
          print("👤 ${fila['usuario']} | Edad: ${fila['edad']} | Género: ${fila['genero']}");
        }
      } else {
        print("❌ No hay usuarios que coincidan con los datos.");
      }
    } catch (e) {
      print("❌ Error al buscar en la base de datos: $e");
    }
  }
}

// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:universal_html/html.dart' as html;

Future getCsv(List<SupabaseRowListStruct> supabaseRowList) async {
  // Add your function code here!
  // Convertir la lista de listas de strings en formato CSV
  final StringBuffer csvBuffer = StringBuffer();
  for (var rowStruct in supabaseRowList) {
    final String csvRow = rowStruct.supabaseRowList
        .join(','); // Asumiendo que este es el campo correcto
    csvBuffer.writeln(csvRow);
  }

  // Convertir el contenido del StringBuffer a una cadena y luego a una lista de bytes
  final String csvContent = csvBuffer.toString();
  final List<int> bytes = utf8.encode(csvContent);
  final html.Blob blob = html.Blob([bytes], 'text/csv');

  // Crear un enlace para descargar el archivo
  final String url = html.Url.createObjectUrlFromBlob(blob);
  final html.AnchorElement anchor = html.AnchorElement(href: url)
    ..setAttribute('download', 'data.csv')
    ..click();

  // Limpieza: revocar la URL del objeto para evitar fugas de memoria
  html.Url.revokeObjectUrl(url);
}

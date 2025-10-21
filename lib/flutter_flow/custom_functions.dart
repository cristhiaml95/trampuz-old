import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? parsePostgresTimestamp(String timestamp) {
  List<DateFormat> formats = [
    DateFormat(
        "yyyy-MM-dd HH:mm:ss.SSSSSSz"), // timestamptz with microseconds and timezone
    DateFormat("yyyy-MM-dd HH:mm:ssz"), // timestamptz
    DateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS"), // timestamp with microseconds
    DateFormat("yyyy-MM-dd HH:mm:ss"), // timestamp
    DateFormat("HH:mm:ss.SSSSSSz"), // timetz with microseconds
    DateFormat("HH:mm:ssz"), // timetz
    DateFormat("HH:mm:ss.SSSSSS"), // time with microseconds
    DateFormat("HH:mm:ss"), // time
    DateFormat("yyyy-MM-dd"), // date
  ];

  for (var format in formats) {
    try {
      return format.parse(timestamp, true);
    } catch (e) {
      // Continuar probando con otros formatos
    }
  }

  // Si ninguno de los formatos coincide, imprimir advertencia y retornar null
  print('Could not parse the date/time: $timestamp');
  return null;
}

List<String> splitBarcodes(String barcodesGroup) {
  // Primero se eliminan los '/' del string
  var tempString = barcodesGroup.trim().replaceAll('/', '');

  // Se dividen los elementos por espacios y saltos de línea
  var splitList = tempString.split(RegExp(r'\s+|\n+'));

  // Filtrar la lista para eliminar cualquier elemento vacío
  splitList = splitList.where((s) => s.isNotEmpty).toList();

  // Verificar si la lista está vacía después de filtrar
  if (splitList.isEmpty) {
    return [];
  }

  return splitList;
}

int sumList(List<int> integerList) {
  int suma = 0;
  for (int numero in integerList) {
    suma += numero;
  }
  return suma;
}

String joinStrings(List<String> strings) {
  var filteredStrings = strings.where((string) => string != '/').toList();

  return filteredStrings.join(' ');
}

String formatDateTimeForPostgres(DateTime dateTime) {
  return dateTime.toUtc().toIso8601String();
}

List<String> noRepeated(List<String> duplicatedList) {
  return duplicatedList.toSet().toList();
}

List<String> intToStringList(List<int> intList) {
  List<String> stringList = intList.map((i) => i.toString()).toList();
  return stringList;
}

DateTime stringToDateTime(String timeString) {
  DateTime now = DateTime.now();

  // Dividir el string 'HH:mm' para obtener las horas y minutos
  List<String> parts = timeString.split(':');
  if (parts.length != 2) {
    throw FormatException("El string debe estar en formato HH:mm");
  }

  // Convertir las partes en enteros
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  // Crear un nuevo objeto DateTime con la fecha actual y la hora especificada
  return DateTime(now.year, now.month, now.day, hour, minute);
}

String toString(int intValue) {
  return intValue.toString();
}

DateTime stringToDate(
  String dateString,
  int defaultDate,
) {
  // Crear un DateFormat utilizando el paquete intl para especificar el formato de entrada
  final format = DateFormat("dd/MM/yy");
  try {
    // Usar el método parse para convertir la cadena de texto en un DateTime
    final result = format.parse(dateString);
    return result;
  } catch (e) {
    // Determinar la fecha predeterminada basada en el parámetro defaultDate
    if (defaultDate == 0) {
      return DateTime(2001, 1, 1); // Fecha predeterminada es 01/01/01
    } else if (defaultDate == 1) {
      return DateTime(2040, 12, 31); // Fecha predeterminada es 31/12/40
    } else {
      // En caso de que defaultDate no sea ni 0 ni 1, puedes decidir qué hacer
      // Por simplicidad, retornaremos 01/01/01, pero puedes manejar este caso como prefieras
      return DateTime(2001, 1, 1);
    }
  }
}

String floatToString(double floatValue) {
  return floatValue.toString();
}

List<String> floatToStringList(List<double> floatList) {
  List<String> stringList = floatList.map((i) => i.toString()).toList();
  return stringList;
}

String urlName(String url) {
// Dividimos el enlace (URL) en una lista de subcadenas utilizando '/' como delimitador.
  List<String> partes = url.split('/');

  // Verificamos si el último elemento es vacío debido a un '/' al final del URL.
  // Si es así, retornamos el penúltimo elemento.
  if (partes.isNotEmpty && partes.last.isEmpty) {
    return partes[partes.length - 2];
  }

  // Retornamos el último elemento de la lista, que es la parte después del último '/'.
  return partes.last;
}

DateTime plus2Time(DateTime supabaseTime) {
  return supabaseTime.subtract(Duration(hours: 2));
}

String? listToStringWithParenthesis(List<String>? list) {
  if (list == null || list.isEmpty) {
    return null;
  }

  // Une los elementos de la lista con comas y encierra en paréntesis
  return '(${list.join(',')})';
}

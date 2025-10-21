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

import 'package:supabase_flutter/supabase_flutter.dart';

Future conectar(
  String tabela,
  Future Function() acao,
) async {
  final supabase = SupaFlow.client;
  final channelName = 'public:$tabela';

  // Configurar canal para escuchar cambios en la tabla
  final channel = supabase.channel(channelName);

  // Suscribirse a cambios en PostgreSQL
  channel
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: tabela,
        callback: (payload) {
          // Ejecutar la acción proporcionada
          acao();
          print('Change detected: ${payload.toString()}');
        },
      )
      .subscribe();
}

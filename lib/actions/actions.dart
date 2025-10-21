import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';

Future startingPage(BuildContext context) async {
  ApiCallResponse? apiCustomsOP;
  ApiCallResponse? apiWarehousesOP;
  ApiCallResponse? apiGoodsOP;

  await Future.wait([
    Future(() async {
      apiCustomsOP = await TablesGroup.customsCall.call(
        userToken: currentJwtToken,
      );

      if ((apiCustomsOP?.succeeded ?? true)) {
        FFAppState().customList = TablesGroup.customsCall
            .customName(
              (apiCustomsOP?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Customs API call problem.',
              style: TextStyle(),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    }),
    Future(() async {
      apiWarehousesOP = await TablesGroup.warehouseCall.call(
        userToken: currentJwtToken,
      );

      if ((apiWarehousesOP?.succeeded ?? true)) {
        FFAppState().warehouseList = TablesGroup.warehouseCall
            .warehouseName(
              (apiWarehousesOP?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Warehouse API call problem.',
              style: TextStyle(),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    }),
    Future(() async {
      apiGoodsOP = await TablesGroup.goodsCall.call(
        userToken: currentJwtToken,
      );

      if ((apiGoodsOP?.succeeded ?? true)) {
        FFAppState().goodsList = TablesGroup.goodsCall
            .item(
              (apiGoodsOP?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Goods API call problem.',
              style: TextStyle(),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    }),
    Future(() async {
      await action_blocks.goodDescriptionApiAction(context);
    }),
    Future(() async {
      await action_blocks.clientApiAction(context);
    }),
    Future(() async {
      await action_blocks.packagingAction(context);
    }),
  ]);
}

Future orderWarehouseAction(BuildContext context) async {
  ApiCallResponse? orderWarehouseApiOP;

  orderWarehouseApiOP = await TablesGroup.orderWarehouseTCall.call(
    orderWarehouseV: FFAppState().orderWarehouseApiV,
    userToken: currentJwtToken,
  );

  if ((orderWarehouseApiOP.succeeded ?? true)) {
    FFAppState().orderWarehouseAS = ((orderWarehouseApiOP.jsonBody ?? '')
            .toList()
            .map<OrderWarehouseRowStruct?>(OrderWarehouseRowStruct.maybeFromMap)
            .toList() as Iterable<OrderWarehouseRowStruct?>)
        .withoutNulls
        .toList()
        .cast<OrderWarehouseRowStruct>();
  }
}

Future goodDescriptionApiAction(BuildContext context) async {
  ApiCallResponse? apiGoodDescriptionsOP;

  apiGoodDescriptionsOP = await TablesGroup.goodDescriptionsCall.call(
    goodDescriptionV: FFAppState().goodDescriptionApiV,
    userToken: currentJwtToken,
  );

  if ((apiGoodDescriptionsOP.succeeded ?? true)) {
    FFAppState().goodDescriptionList = ((apiGoodDescriptionsOP.jsonBody ?? '')
            .toList()
            .map<GoodDescriptionRowStruct?>(
                GoodDescriptionRowStruct.maybeFromMap)
            .toList() as Iterable<GoodDescriptionRowStruct?>)
        .withoutNulls
        .toList()
        .cast<GoodDescriptionRowStruct>();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Good descriptions API call problem.',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future clientApiAction(BuildContext context) async {
  ApiCallResponse? apiClientOP;

  apiClientOP = await TablesGroup.clientsCall.call(
    clientV: FFAppState().clientApiV,
    userToken: currentJwtToken,
  );

  if ((apiClientOP.succeeded ?? true)) {
    FFAppState().clientList = ((apiClientOP.jsonBody ?? '')
            .toList()
            .map<ClientRowStruct?>(ClientRowStruct.maybeFromMap)
            .toList() as Iterable<ClientRowStruct?>)
        .withoutNulls
        .toList()
        .cast<ClientRowStruct>();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Client API call problem.',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future packagingAction(BuildContext context) async {
  ApiCallResponse? packagingApiOP;

  packagingApiOP = await TablesGroup.packagingCall.call(
    userToken: currentJwtToken,
  );

  if ((packagingApiOP.succeeded ?? true)) {
    FFAppState().packagingList = ((packagingApiOP.jsonBody ?? '')
            .toList()
            .map<PackaingRowStruct?>(PackaingRowStruct.maybeFromMap)
            .toList() as Iterable<PackaingRowStruct?>)
        .withoutNulls
        .map((e) => e.packaging)
        .toList()
        .toList()
        .cast<String>();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Packaging API call problem.',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

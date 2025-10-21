import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/light_mode/light_mode_widget.dart';
import '/pages/components/user_details/user_details_widget.dart';
import '/index.dart';
import 'warehouse2_widget.dart' show Warehouse2Widget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Warehouse2Model extends FlutterFlowModel<Warehouse2Widget> {
  ///  Local state fields for this page.

  bool warehouseB = false;

  bool orderNoB = false;

  bool clientB = false;

  bool orderStatusB = false;

  bool flowB = false;

  bool containerB = false;

  bool dateArrivalB = false;

  String? selectedIndexID;

  List<FixedColumnsStruct> fixedColumns = [];
  void addToFixedColumns(FixedColumnsStruct item) => fixedColumns.add(item);
  void removeFromFixedColumns(FixedColumnsStruct item) =>
      fixedColumns.remove(item);
  void removeAtIndexFromFixedColumns(int index) => fixedColumns.removeAt(index);
  void insertAtIndexInFixedColumns(int index, FixedColumnsStruct item) =>
      fixedColumns.insert(index, item);
  void updateFixedColumnsAtIndex(
          int index, Function(FixedColumnsStruct) updateFn) =>
      fixedColumns[index] = updateFn(fixedColumns[index]);

  bool rowPerPageB = true;

  bool intCustomB = false;

  bool licenceB = false;

  bool improvementB = false;

  bool loadRefDvhB = false;

  bool quantityB = false;

  bool packagingB = false;

  bool customB = false;

  bool rampaB = false;

  ///  State fields for stateful widgets in this page.

  // Model for lightMode component.
  late LightModeModel lightModeModel;
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // State field(s) for warehouseDD widget.
  String? warehouseDDValue;
  FormFieldController<String>? warehouseDDValueController;
  // State field(s) for orderNoTF widget.
  FocusNode? orderNoTFFocusNode;
  TextEditingController? orderNoTFTextController;
  String? Function(BuildContext, String?)? orderNoTFTextControllerValidator;
  // State field(s) for orderStatusDD widget.
  String? orderStatusDDValue;
  FormFieldController<String>? orderStatusDDValueController;
  // State field(s) for flowDD widget.
  String? flowDDValue;
  FormFieldController<String>? flowDDValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for licenceTF widget.
  FocusNode? licenceTFFocusNode;
  TextEditingController? licenceTFTextController;
  String? Function(BuildContext, String?)? licenceTFTextControllerValidator;
  // State field(s) for improvementDD widget.
  String? improvementDDValue;
  FormFieldController<String>? improvementDDValueController;
  // State field(s) for containerNoTF widget.
  FocusNode? containerNoTFFocusNode;
  TextEditingController? containerNoTFTextController;
  String? Function(BuildContext, String?)? containerNoTFTextControllerValidator;
  // State field(s) for rampaTF widget.
  FocusNode? rampaTFFocusNode;
  TextEditingController? rampaTFTextController;
  String? Function(BuildContext, String?)? rampaTFTextControllerValidator;
  // State field(s) for loadRefDvhTF widget.
  FocusNode? loadRefDvhTFFocusNode;
  TextEditingController? loadRefDvhTFTextController;
  String? Function(BuildContext, String?)? loadRefDvhTFTextControllerValidator;
  // State field(s) for q1TF widget.
  FocusNode? q1TFFocusNode;
  TextEditingController? q1TFTextController;
  String? Function(BuildContext, String?)? q1TFTextControllerValidator;
  // State field(s) for q2TF widget.
  FocusNode? q2TFFocusNode;
  TextEditingController? q2TFTextController;
  String? Function(BuildContext, String?)? q2TFTextControllerValidator;
  // State field(s) for packagingDD widget.
  String? packagingDDValue;
  FormFieldController<String>? packagingDDValueController;
  // State field(s) for customDD widget.
  String? customDDValue;
  FormFieldController<String>? customDDValueController;
  // State field(s) for intCustomTF widget.
  FocusNode? intCustomTFFocusNode;
  TextEditingController? intCustomTFTextController;
  String? Function(BuildContext, String?)? intCustomTFTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<OrderWarehouseRowStruct>();
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRowW2OP;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedW2Row;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRowW22OP;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedRowW22OP;

  @override
  void initState(BuildContext context) {
    lightModeModel = createModel(context, () => LightModeModel());
    userDetailsModel = createModel(context, () => UserDetailsModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    lightModeModel.dispose();
    userDetailsModel.dispose();
    orderNoTFFocusNode?.dispose();
    orderNoTFTextController?.dispose();

    licenceTFFocusNode?.dispose();
    licenceTFTextController?.dispose();

    containerNoTFFocusNode?.dispose();
    containerNoTFTextController?.dispose();

    rampaTFFocusNode?.dispose();
    rampaTFTextController?.dispose();

    loadRefDvhTFFocusNode?.dispose();
    loadRefDvhTFTextController?.dispose();

    q1TFFocusNode?.dispose();
    q1TFTextController?.dispose();

    q2TFFocusNode?.dispose();
    q2TFTextController?.dispose();

    intCustomTFFocusNode?.dispose();
    intCustomTFTextController?.dispose();

    paginatedDataTableController.dispose();
  }

  /// Action blocks.
  Future warehouse2FilterAction(BuildContext context) async {
    FFAppState().orderWarehouseApiV = 'is_deleted=eq.false';
    FFAppState().orderWarehouseApiV = (String var1) {
      return var1 + '&order=eta_date.desc.nullslast&limit=50';
    }(FFAppState().orderWarehouseApiV);
    if (warehouseDDValue != null && warehouseDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&warehouse_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, warehouseDDValue!);
    }
    if (orderNoTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&order_no=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, orderNoTFTextController.text);
    }
    if (orderStatusDDValue != null && orderStatusDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&order_status=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, orderStatusDDValue!);
    }
    if (flowDDValue != null && flowDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&flow=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, flowDDValue!);
    }
    if (containerNoTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&container_no=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, containerNoTFTextController.text);
    }
    if (FFAppState().clientApiB) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&client=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, FFAppState().clientApiId);
    }
    if (FFAppState().goodDescriptionApiB) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&good_description=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, FFAppState().goodDescriptionApiId);
    }
    if (datePicked1 != null) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&eta_date=gte.' + var2;
      }(
          FFAppState().orderWarehouseApiV,
          valueOrDefault<String>(
            dateTimeFormat(
              "yyyy-MM-dd",
              datePicked1,
              locale: FFLocalizations.of(context).languageCode,
            ),
            '2000-01-01',
          ));
    }
    if (datePicked2 != null) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&eta_date=lte.' + var2;
      }(
          FFAppState().orderWarehouseApiV,
          valueOrDefault<String>(
            dateTimeFormat(
              "yyyy-MM-dd",
              datePicked2,
              locale: FFLocalizations.of(context).languageCode,
            ),
            '2030-12-31',
          ));
    }
    if (intCustomTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&internal_ref_custom=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, intCustomTFTextController.text);
    }
    if (licenceTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&licence_plate=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, licenceTFTextController.text);
    }
    if (improvementDDValue != null && improvementDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&improvement=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, improvementDDValue!);
    }
    if (loadRefDvhTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&load_ref_dvh=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, loadRefDvhTFTextController.text);
    }
    if (q1TFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&quantity=gte.' + var2;
      }(FFAppState().orderWarehouseApiV, q1TFTextController.text);
    }
    if (q2TFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&quantity=lte.' + var2;
      }(FFAppState().orderWarehouseApiV, q2TFTextController.text);
    }
    if (packagingDDValue != null && packagingDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&packaging_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, packagingDDValue!);
    }
    if (customDDValue != null && customDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&custom_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, customDDValue!);
    }
    if (rampaTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&loading_gate_ramp=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, rampaTFTextController.text);
    }
  }
}

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/light_mode/light_mode_widget.dart';
import '/pages/components/user_details/user_details_widget.dart';
import '/index.dart';
import 'order_warehouse_widget.dart' show OrderWarehouseWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class OrderWarehouseModel extends FlutterFlowModel<OrderWarehouseWidget> {
  ///  Local state fields for this page.

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

  String? selectedIndexID;

  bool orderNoB = false;

  bool clientB = false;

  bool flowB = false;

  bool invStatusB = false;

  bool warehouseB = false;

  bool orderStatusB = false;

  bool licenceB = false;

  bool improvementB = false;

  bool palletPositionB = false;

  bool universalRefNumB = false;

  bool fmsRefB = false;

  bool loadRefDvhB = false;

  bool customB = false;

  bool goodB = false;

  bool goodDescriptionB = false;

  bool assistant1B = false;

  bool assistant2B = false;

  bool assistant3B = false;

  bool assistant4B = false;

  bool assistant5B = false;

  bool assistant6B = false;

  bool adminB = false;

  bool barcodeB = false;

  bool intCustomB = false;

  bool containerNoB = false;

  bool rowPerPageB = true;

  bool dateArrivalB = false;

  bool packagingB = false;

  bool? sortTime;

  String? barcodeFiltered;

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Model for lightMode component.
  late LightModeModel lightModeModel;
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // State field(s) for orderNoTF widget.
  FocusNode? orderNoTFFocusNode;
  TextEditingController? orderNoTFTextController;
  String? Function(BuildContext, String?)? orderNoTFTextControllerValidator;
  // State field(s) for invStatusDD widget.
  String? invStatusDDValue;
  FormFieldController<String>? invStatusDDValueController;
  // State field(s) for warehouseDD widget.
  String? warehouseDDValue;
  FormFieldController<String>? warehouseDDValueController;
  // State field(s) for orderStatusDD widget.
  String? orderStatusDDValue;
  FormFieldController<String>? orderStatusDDValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for flowDD widget.
  String? flowDDValue;
  FormFieldController<String>? flowDDValueController;
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
  // State field(s) for packagingDD widget.
  String? packagingDDValue;
  FormFieldController<String>? packagingDDValueController;
  // State field(s) for palletPositionTF widget.
  FocusNode? palletPositionTFFocusNode;
  TextEditingController? palletPositionTFTextController;
  String? Function(BuildContext, String?)?
      palletPositionTFTextControllerValidator;
  // State field(s) for UniversalRefNumTF widget.
  FocusNode? universalRefNumTFFocusNode;
  TextEditingController? universalRefNumTFTextController;
  String? Function(BuildContext, String?)?
      universalRefNumTFTextControllerValidator;
  // State field(s) for FMSrefTF widget.
  FocusNode? fMSrefTFFocusNode;
  TextEditingController? fMSrefTFTextController;
  String? Function(BuildContext, String?)? fMSrefTFTextControllerValidator;
  // State field(s) for loadRefDvhTF widget.
  FocusNode? loadRefDvhTFFocusNode;
  TextEditingController? loadRefDvhTFTextController;
  String? Function(BuildContext, String?)? loadRefDvhTFTextControllerValidator;
  // State field(s) for customDD widget.
  String? customDDValue;
  FormFieldController<String>? customDDValueController;
  // State field(s) for intCustomTF widget.
  FocusNode? intCustomTFFocusNode;
  TextEditingController? intCustomTFTextController;
  String? Function(BuildContext, String?)? intCustomTFTextControllerValidator;
  // State field(s) for goodDD widget.
  String? goodDDValue;
  FormFieldController<String>? goodDDValueController;
  // State field(s) for assistant1DD widget.
  String? assistant1DDValue;
  FormFieldController<String>? assistant1DDValueController;
  // State field(s) for assistant2DD widget.
  String? assistant2DDValue;
  FormFieldController<String>? assistant2DDValueController;
  // State field(s) for adminDD widget.
  String? adminDDValue;
  FormFieldController<String>? adminDDValueController;
  // State field(s) for barcodesTF widget.
  FocusNode? barcodesTFFocusNode;
  TextEditingController? barcodesTFTextController;
  String? Function(BuildContext, String?)? barcodesTFTextControllerValidator;
  // State field(s) for assistant3DD widget.
  String? assistant3DDValue;
  FormFieldController<String>? assistant3DDValueController;
  // State field(s) for assistant4DD widget.
  String? assistant4DDValue;
  FormFieldController<String>? assistant4DDValueController;
  // State field(s) for assistant5DD widget.
  String? assistant5DDValue;
  FormFieldController<String>? assistant5DDValueController;
  // State field(s) for assistant6DD widget.
  String? assistant6DDValue;
  FormFieldController<String>? assistant6DDValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<OrderWarehouseRowStruct>();
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRowOP;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedRowOP;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRow2OP;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedRow2OP;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRowOPCopy;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshThisRow2OPCopy;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedRowOPCopy;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRow2OPCopy;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  OrderLevelRow? insertedRow2OPCopy;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Icon widget.
  ApiCallResponse? refreshRowOP2;
  // State field(s) for onlineSW widget.
  bool? onlineSWValue;
  // State field(s) for rowsQuantityTF widget.
  FocusNode? rowsQuantityTFFocusNode;
  TextEditingController? rowsQuantityTFTextController;
  String? Function(BuildContext, String?)?
      rowsQuantityTFTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

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

    palletPositionTFFocusNode?.dispose();
    palletPositionTFTextController?.dispose();

    universalRefNumTFFocusNode?.dispose();
    universalRefNumTFTextController?.dispose();

    fMSrefTFFocusNode?.dispose();
    fMSrefTFTextController?.dispose();

    loadRefDvhTFFocusNode?.dispose();
    loadRefDvhTFTextController?.dispose();

    intCustomTFFocusNode?.dispose();
    intCustomTFTextController?.dispose();

    barcodesTFFocusNode?.dispose();
    barcodesTFTextController?.dispose();

    paginatedDataTableController.dispose();
    rowsQuantityTFFocusNode?.dispose();
    rowsQuantityTFTextController?.dispose();
  }

  /// Action blocks.
  Future orderWarehouseFiltersAction(BuildContext context) async {
    FFAppState().orderWarehouseApiV = 'is_deleted=eq.false';
    FFAppState().orderWarehouseApiV = (String var1) {
      return var1 + '&availability=neq.consumed&limit=50&is_deleted=eq.false';
    }(FFAppState().orderWarehouseApiV);
    if (orderNoTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&order_no=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, orderNoTFTextController.text);
    }
    if (invStatusDDValue != null && invStatusDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&inv_status=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, invStatusDDValue!);
    }
    if (FFAppState().clientApiB) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&client=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, FFAppState().clientApiId);
    }
    if (warehouseDDValue != null && warehouseDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&warehouse_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, warehouseDDValue!);
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
    if (containerNoTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&container_no=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, containerNoTFTextController.text);
    }
    if (palletPositionTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&pallet_position=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, palletPositionTFTextController.text);
    }
    if (universalRefNumTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&universal_ref_no=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, universalRefNumTFTextController.text);
    }
    if (fMSrefTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&fms_ref=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, fMSrefTFTextController.text);
    }
    if (loadRefDvhTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&load_ref_dvh=ilike.*' + var2 + '*';
      }(FFAppState().orderWarehouseApiV, loadRefDvhTFTextController.text);
    }
    if (customDDValue != null && customDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&custom_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, customDDValue!);
    }
    if (intCustomTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&internal_ref_custom=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, intCustomTFTextController.text);
    }
    if (goodDDValue != null && goodDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&item=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, goodDDValue!);
    }
    if (FFAppState().goodDescriptionApiB) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&good_description=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, FFAppState().goodDescriptionApiId);
    }
    if (assistant1DDValue != null && assistant1DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant1=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant1DDValue!);
    }
    if (assistant2DDValue != null && assistant2DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant2=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant2DDValue!);
    }
    if (adminDDValue != null && adminDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&admin=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, adminDDValue!);
    }
    if (assistant3DDValue != null && assistant3DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant3=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant3DDValue!);
    }
    if (assistant4DDValue != null && assistant4DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant4=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant4DDValue!);
    }
    if (assistant5DDValue != null && assistant5DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant5=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant5DDValue!);
    }
    if (assistant6DDValue != null && assistant6DDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&assistant6=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, assistant6DDValue!);
    }
    if (barcodesTFTextController.text != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&barcode_list=cs.{' + var2 + '}';
      }(FFAppState().orderWarehouseApiV, barcodesTFTextController.text);
    }
    if ((choiceChipsValue != null && choiceChipsValue != '') &&
        (choiceChipsValue != 'all')) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&availability=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, choiceChipsValue!);
    }
    if (datePicked1 != null) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&eta_date=gte.' + var2;
      }(
          FFAppState().orderWarehouseApiV,
          dateTimeFormat(
            "yyyy-MM-dd",
            datePicked2,
            locale: FFLocalizations.of(context).languageCode,
          ));
    }
    if (datePicked2 != null) {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&eta_date=lte.' + var2;
      }(
          FFAppState().orderWarehouseApiV,
          dateTimeFormat(
            "yyyy-MM-dd",
            datePicked2,
            locale: FFLocalizations.of(context).languageCode,
          ));
    }
    if (packagingDDValue != null && packagingDDValue != '') {
      FFAppState().orderWarehouseApiV = (String var1, String var2) {
        return var1 + '&packaging_name=eq.' + var2;
      }(FFAppState().orderWarehouseApiV, packagingDDValue!);
    }
    if (sortTime != null) {
      if (sortTime!) {
        FFAppState().orderWarehouseApiV = (String var1) {
          return var1 + '&order=eta_i.desc.nullslast';
        }(FFAppState().orderWarehouseApiV);
      } else {
        FFAppState().orderWarehouseApiV = (String var1) {
          return var1 + '&order=eta_i.asc.nullslast';
        }(FFAppState().orderWarehouseApiV);
      }
    } else {
      FFAppState().orderWarehouseApiV = (String var1) {
        return var1 + '&order=crono.desc.nullslast';
      }(FFAppState().orderWarehouseApiV);
    }
  }
}

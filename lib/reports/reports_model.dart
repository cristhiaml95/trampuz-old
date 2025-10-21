import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/light_mode/light_mode_widget.dart';
import '/pages/components/user_details/user_details_widget.dart';
import '/index.dart';
import 'reports_widget.dart' show ReportsWidget;
import 'package:flutter/material.dart';

class ReportsModel extends FlutterFlowModel<ReportsWidget> {
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

  int selectedIndex = 0;

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

  int counter = 0;

  DateTime? dateArrival1;

  DateTime? dateArrival2;

  bool dateArrivalB = false;

  bool quantityB = false;

  bool packagingB = false;

  bool weightB = false;

  bool manipulationB = false;

  bool loadingTypeB = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (packaging)] action in reports widget.
  ApiCallResponse? packagingApiOP;
  // Stores action output result for [Backend Call - API (manipulation)] action in reports widget.
  ApiCallResponse? manipulationApiOP;
  // Model for lightMode component.
  late LightModeModel lightModeModel;
  // Model for userDetails component.
  late UserDetailsModel userDetailsModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

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
  // State field(s) for q1TF widget.
  FocusNode? q1TFFocusNode1;
  TextEditingController? q1TFTextController1;
  String? Function(BuildContext, String?)? q1TFTextController1Validator;
  // State field(s) for q2TF widget.
  FocusNode? q2TFFocusNode1;
  TextEditingController? q2TFTextController1;
  String? Function(BuildContext, String?)? q2TFTextController1Validator;
  // State field(s) for packagingDD widget.
  String? packagingDDValue1;
  FormFieldController<String>? packagingDDValueController1;
  // State field(s) for w1TF widget.
  FocusNode? w1TFFocusNode1;
  TextEditingController? w1TFTextController1;
  String? Function(BuildContext, String?)? w1TFTextController1Validator;
  // State field(s) for w2TF widget.
  FocusNode? w2TFFocusNode1;
  TextEditingController? w2TFTextController1;
  String? Function(BuildContext, String?)? w2TFTextController1Validator;
  // State field(s) for goodDD widget.
  String? goodDDValue1;
  FormFieldController<String>? goodDDValueController1;
  // State field(s) for loadingTypeDD widget.
  String? loadingTypeDDValue;
  FormFieldController<String>? loadingTypeDDValueController;
  // State field(s) for manipulationsDD widget.
  String? manipulationsDDValue;
  FormFieldController<String>? manipulationsDDValueController;
  // State field(s) for generalDT widget.
  final generalDTController =
      FlutterFlowDataTableController<OrderWarehouseRowStruct>();
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for invStatusDD widget.
  String? invStatusDDValue;
  FormFieldController<String>? invStatusDDValueController;
  // State field(s) for containerNo2TF widget.
  FocusNode? containerNo2TFFocusNode;
  TextEditingController? containerNo2TFTextController;
  String? Function(BuildContext, String?)?
      containerNo2TFTextControllerValidator;
  // State field(s) for q1TF widget.
  FocusNode? q1TFFocusNode2;
  TextEditingController? q1TFTextController2;
  String? Function(BuildContext, String?)? q1TFTextController2Validator;
  // State field(s) for q2TF widget.
  FocusNode? q2TFFocusNode2;
  TextEditingController? q2TFTextController2;
  String? Function(BuildContext, String?)? q2TFTextController2Validator;
  // State field(s) for packagingDD widget.
  String? packagingDDValue2;
  FormFieldController<String>? packagingDDValueController2;
  // State field(s) for w1TF widget.
  FocusNode? w1TFFocusNode2;
  TextEditingController? w1TFTextController2;
  String? Function(BuildContext, String?)? w1TFTextController2Validator;
  // State field(s) for w2TF widget.
  FocusNode? w2TFFocusNode2;
  TextEditingController? w2TFTextController2;
  String? Function(BuildContext, String?)? w2TFTextController2Validator;
  // State field(s) for goodDD widget.
  String? goodDDValue2;
  FormFieldController<String>? goodDDValueController2;
  // State field(s) for stockDT widget.
  final stockDTController =
      FlutterFlowDataTableController<OrderWarehouseRowStruct>();

  @override
  void initState(BuildContext context) {
    lightModeModel = createModel(context, () => LightModeModel());
    userDetailsModel = createModel(context, () => UserDetailsModel());
  }

  @override
  void dispose() {
    lightModeModel.dispose();
    userDetailsModel.dispose();
    tabBarController?.dispose();
    licenceTFFocusNode?.dispose();
    licenceTFTextController?.dispose();

    containerNoTFFocusNode?.dispose();
    containerNoTFTextController?.dispose();

    universalRefNumTFFocusNode?.dispose();
    universalRefNumTFTextController?.dispose();

    fMSrefTFFocusNode?.dispose();
    fMSrefTFTextController?.dispose();

    loadRefDvhTFFocusNode?.dispose();
    loadRefDvhTFTextController?.dispose();

    q1TFFocusNode1?.dispose();
    q1TFTextController1?.dispose();

    q2TFFocusNode1?.dispose();
    q2TFTextController1?.dispose();

    w1TFFocusNode1?.dispose();
    w1TFTextController1?.dispose();

    w2TFFocusNode1?.dispose();
    w2TFTextController1?.dispose();

    generalDTController.dispose();
    containerNo2TFFocusNode?.dispose();
    containerNo2TFTextController?.dispose();

    q1TFFocusNode2?.dispose();
    q1TFTextController2?.dispose();

    q2TFFocusNode2?.dispose();
    q2TFTextController2?.dispose();

    w1TFFocusNode2?.dispose();
    w1TFTextController2?.dispose();

    w2TFFocusNode2?.dispose();
    w2TFTextController2?.dispose();

    stockDTController.dispose();
  }

  /// Action blocks.
  Future reportsFiltersAction(BuildContext context) async {
    FFAppState().orderWarehouseApiV = 'is_deleted=eq.false';
    if (tabBarCurrentIndex == 0) {
      if (datePicked1 != null) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&eta_date=gte.' + var2;
        }(
            FFAppState().orderWarehouseApiV,
            dateTimeFormat(
              "yyyy-MM-dd",
              datePicked1,
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
      if (universalRefNumTFTextController.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&universal_ref_no=ilike.*' + var2 + '*';
        }(FFAppState().orderWarehouseApiV,
            universalRefNumTFTextController.text);
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
      if (q1TFTextController1.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&quantity=gte.' + var2;
        }(FFAppState().orderWarehouseApiV, q1TFTextController1.text);
      }
      if (q2TFTextController1.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&quantity=lte.' + var2;
        }(FFAppState().orderWarehouseApiV, q2TFTextController1.text);
      }
      if (packagingDDValue1 != null && packagingDDValue1 != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&packaging_name=ilike.*' + var2 + '*';
        }(FFAppState().orderWarehouseApiV, packagingDDValue1!);
      }
      if (w1TFTextController1.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&weight=gte.' + var2;
        }(FFAppState().orderWarehouseApiV, w1TFTextController1.text);
      }
      if (w2TFTextController1.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&weight=lte.' + var2;
        }(FFAppState().orderWarehouseApiV, w2TFTextController1.text);
      }
      if (loadingTypeDDValue != null && loadingTypeDDValue != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&loading_type=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, loadingTypeDDValue!);
      }
      if (manipulationsDDValue != null && manipulationsDDValue != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&other_manipulation=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, manipulationsDDValue!);
      }
      if (goodDDValue1 != null && goodDDValue1 != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&item=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, goodDDValue1!);
      }
      if (FFAppState().goodDescriptionApiB) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&good_description=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, FFAppState().goodDescriptionApiId);
      }
      if (FFAppState().clientApiB) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&client=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, FFAppState().clientApiId);
      }
    } else {
      if (datePicked3 != null) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&eta_date=gte.' + var2;
        }(
            FFAppState().orderWarehouseApiV,
            dateTimeFormat(
              "yyyy-MM-dd",
              datePicked3,
              locale: FFLocalizations.of(context).languageCode,
            ));
      }
      if (datePicked4 != null) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&eta_date=lte.' + var2;
        }(
            FFAppState().orderWarehouseApiV,
            dateTimeFormat(
              "yyyy-MM-dd",
              datePicked4,
              locale: FFLocalizations.of(context).languageCode,
            ));
      }
      if (invStatusDDValue != null && invStatusDDValue != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&inv_status=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, invStatusDDValue!);
      }
      if (containerNo2TFTextController.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&container_no=ilike.*' + var2 + '*';
        }(FFAppState().orderWarehouseApiV, containerNo2TFTextController.text);
      }
      if (q1TFTextController2.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&quantity=gte.' + var2;
        }(FFAppState().orderWarehouseApiV, q1TFTextController2.text);
      }
      if (q2TFTextController2.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&quantity=lte.' + var2;
        }(FFAppState().orderWarehouseApiV, q2TFTextController2.text);
      }
      if (packagingDDValue2 != null && packagingDDValue2 != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&packaging_name=ilike.*' + var2 + '*';
        }(FFAppState().orderWarehouseApiV, packagingDDValue2!);
      }
      if (w1TFTextController2.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&weight=gte.' + var2;
        }(FFAppState().orderWarehouseApiV, w1TFTextController2.text);
      }
      if (w2TFTextController1.text != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&weight=lte.' + var2;
        }(FFAppState().orderWarehouseApiV, w2TFTextController2.text);
      }
      if (goodDDValue2 != null && goodDDValue2 != '') {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&item=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, goodDDValue2!);
      }
      if (FFAppState().goodDescriptionApiB) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&good_description=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, FFAppState().goodDescriptionApiId);
      }
      if (FFAppState().clientApiB) {
        FFAppState().orderWarehouseApiV = (String var1, String var2) {
          return var1 + '&client=eq.' + var2;
        }(FFAppState().orderWarehouseApiV, FFAppState().clientApiId);
      }
    }

    FFAppState().orderWarehouseApiV = (String var1) {
      return var1 + '&order=crono.desc.nullslast';
    }(FFAppState().orderWarehouseApiV);
  }
}

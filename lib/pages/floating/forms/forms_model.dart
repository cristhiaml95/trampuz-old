import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'forms_widget.dart' show FormsWidget;
import 'package:flutter/material.dart';

class FormsModel extends FlutterFlowModel<FormsWidget> {
  ///  Local state fields for this component.

  int page = 0;

  int unitLast = 0;

  int numberOfBarcodes = 0;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for orderNoTF widget.
  FocusNode? orderNoTFFocusNode;
  TextEditingController? orderNoTFTextController;
  String? Function(BuildContext, String?)? orderNoTFTextControllerValidator;
  // State field(s) for flowDD widget.
  String? flowDDValue;
  FormFieldController<String>? flowDDValueController;
  DateTime? datePicked1;
  // State field(s) for orderStatusDD widget.
  String? orderStatusDDValue;
  FormFieldController<String>? orderStatusDDValueController;
  // State field(s) for warehouseDD widget.
  String? warehouseDDValue;
  FormFieldController<String>? warehouseDDValueController;
  DateTime? datePicked2;
  // State field(s) for adminDD widget.
  String? adminDDValue;
  FormFieldController<String>? adminDDValueController;
  // State field(s) for customDD widget.
  String? customDDValue;
  FormFieldController<String>? customDDValueController;
  // State field(s) for internalRefT widget.
  FocusNode? internalRefTFocusNode;
  TextEditingController? internalRefTTextController;
  String? Function(BuildContext, String?)? internalRefTTextControllerValidator;
  // State field(s) for internalAccT widget.
  FocusNode? internalAccTFocusNode;
  TextEditingController? internalAccTTextController;
  String? Function(BuildContext, String?)? internalAccTTextControllerValidator;
  // State field(s) for inventoryStatusDD widget.
  String? inventoryStatusDDValue;
  FormFieldController<String>? inventoryStatusDDValueController;
  // Stores action output result for [Custom Action - selectTime] action in Container widget.
  DateTime? announcedTime1T;
  // Stores action output result for [Custom Action - selectTime] action in Container widget.
  DateTime? announcedTime2T;
  // Stores action output result for [Custom Action - selectTime] action in Container widget.
  DateTime? arrivalT;
  // State field(s) for loadingGateDD widget.
  String? loadingGateDDValue;
  FormFieldController<String>? loadingGateDDValueController;
  // State field(s) for sequence widget.
  FocusNode? sequenceFocusNode;
  TextEditingController? sequenceTextController;
  String? Function(BuildContext, String?)? sequenceTextControllerValidator;
  // Stores action output result for [Custom Action - selectTime] action in Container widget.
  DateTime? startT;
  // Stores action output result for [Custom Action - selectTime] action in Container widget.
  DateTime? stopT;
  // State field(s) for licencePlateTF widget.
  FocusNode? licencePlateTFFocusNode;
  TextEditingController? licencePlateTFTextController;
  String? Function(BuildContext, String?)?
      licencePlateTFTextControllerValidator;
  // State field(s) for improvementDD widget.
  String? improvementDDValue;
  FormFieldController<String>? improvementDDValueController;
  // State field(s) for containerT widget.
  FocusNode? containerTFocusNode;
  TextEditingController? containerTTextController;
  String? Function(BuildContext, String?)? containerTTextControllerValidator;
  // State field(s) for commentTF widget.
  FocusNode? commentTFFocusNode;
  TextEditingController? commentTFTextController;
  String? Function(BuildContext, String?)? commentTFTextControllerValidator;
  // State field(s) for quantityT widget.
  FocusNode? quantityTFocusNode;
  TextEditingController? quantityTTextController;
  String? Function(BuildContext, String?)? quantityTTextControllerValidator;
  // State field(s) for palletPositionT widget.
  FocusNode? palletPositionTFocusNode;
  TextEditingController? palletPositionTTextController;
  String? Function(BuildContext, String?)?
      palletPositionTTextControllerValidator;
  // State field(s) for preCheckCB widget.
  bool? preCheckCBValue;
  // State field(s) for checkCB widget.
  bool? checkCBValue;
  // State field(s) for unitT widget.
  FocusNode? unitTFocusNode;
  TextEditingController? unitTTextController;
  String? Function(BuildContext, String?)? unitTTextControllerValidator;
  // State field(s) for weightT widget.
  FocusNode? weightTFocusNode;
  TextEditingController? weightTTextController;
  String? Function(BuildContext, String?)? weightTTextControllerValidator;
  // State field(s) for otherManipulationDD widget.
  String? otherManipulationDDValue;
  FormFieldController<String>? otherManipulationDDValueController;
  // State field(s) for loadTypeDD widget.
  String? loadTypeDDValue;
  FormFieldController<String>? loadTypeDDValueController;
  // State field(s) for loadType2DD widget.
  String? loadType2DDValue;
  FormFieldController<String>? loadType2DDValueController;
  // State field(s) for responsibleDD widget.
  String? responsibleDDValue;
  FormFieldController<String>? responsibleDDValueController;
  // State field(s) for assistant1DD widget.
  String? assistant1DDValue;
  FormFieldController<String>? assistant1DDValueController;
  // State field(s) for assistant2DD widget.
  String? assistant2DDValue;
  FormFieldController<String>? assistant2DDValueController;
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
  // State field(s) for universalRefNumT widget.
  FocusNode? universalRefNumTFocusNode;
  TextEditingController? universalRefNumTTextController;
  String? Function(BuildContext, String?)?
      universalRefNumTTextControllerValidator;
  // State field(s) for fmsRefT widget.
  FocusNode? fmsRefTFocusNode;
  TextEditingController? fmsRefTTextController;
  String? Function(BuildContext, String?)? fmsRefTTextControllerValidator;
  // State field(s) for loadRefDvhT widget.
  FocusNode? loadRefDvhTFocusNode;
  TextEditingController? loadRefDvhTTextController;
  String? Function(BuildContext, String?)? loadRefDvhTTextControllerValidator;
  // State field(s) for goodsDD widget.
  String? goodsDDValue;
  FormFieldController<String>? goodsDDValueController;
  // State field(s) for packagingDD widget.
  String? packagingDDValue;
  FormFieldController<String>? packagingDDValueController;
  // State field(s) for barcodesTF widget.
  FocusNode? barcodesTFFocusNode;
  TextEditingController? barcodesTFTextController;
  String? Function(BuildContext, String?)? barcodesTFTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for repeatedBarcodesTF widget.
  FocusNode? repeatedBarcodesTFFocusNode;
  TextEditingController? repeatedBarcodesTFTextController;
  String? Function(BuildContext, String?)?
      repeatedBarcodesTFTextControllerValidator;
  // State field(s) for nonExistentBarcodesTF widget.
  FocusNode? nonExistentBarcodesTFFocusNode;
  TextEditingController? nonExistentBarcodesTFTextController;
  String? Function(BuildContext, String?)?
      nonExistentBarcodesTFTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? sureQueryOP;
  // Stores action output result for [Backend Call - API (refreshOrderLevelCalculatedColumns)] action in Button widget.
  ApiCallResponse? refreshRowOP;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    orderNoTFFocusNode?.dispose();
    orderNoTFTextController?.dispose();

    internalRefTFocusNode?.dispose();
    internalRefTTextController?.dispose();

    internalAccTFocusNode?.dispose();
    internalAccTTextController?.dispose();

    sequenceFocusNode?.dispose();
    sequenceTextController?.dispose();

    licencePlateTFFocusNode?.dispose();
    licencePlateTFTextController?.dispose();

    containerTFocusNode?.dispose();
    containerTTextController?.dispose();

    commentTFFocusNode?.dispose();
    commentTFTextController?.dispose();

    quantityTFocusNode?.dispose();
    quantityTTextController?.dispose();

    palletPositionTFocusNode?.dispose();
    palletPositionTTextController?.dispose();

    unitTFocusNode?.dispose();
    unitTTextController?.dispose();

    weightTFocusNode?.dispose();
    weightTTextController?.dispose();

    universalRefNumTFocusNode?.dispose();
    universalRefNumTTextController?.dispose();

    fmsRefTFocusNode?.dispose();
    fmsRefTTextController?.dispose();

    loadRefDvhTFocusNode?.dispose();
    loadRefDvhTTextController?.dispose();

    barcodesTFFocusNode?.dispose();
    barcodesTFTextController?.dispose();

    repeatedBarcodesTFFocusNode?.dispose();
    repeatedBarcodesTFTextController?.dispose();

    nonExistentBarcodesTFFocusNode?.dispose();
    nonExistentBarcodesTFTextController?.dispose();
  }
}

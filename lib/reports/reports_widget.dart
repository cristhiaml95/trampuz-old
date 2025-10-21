import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/light_mode/light_mode_widget.dart';
import '/pages/components/user_details/user_details_widget.dart';
import '/pages/floating/documents/documents_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reports_model.dart';
export 'reports_model.dart';

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({
    super.key,
    String? orderWarehouseTablesKey,
    int? numberOfRows,
  })  : this.orderWarehouseTablesKey =
            orderWarehouseTablesKey ?? 'orderWarehouseTablesDefKey',
        this.numberOfRows = numberOfRows ?? 100;

  final String orderWarehouseTablesKey;
  final int numberOfRows;

  static String routeName = 'reports';
  static String routePath = '/reports';

  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget>
    with TickerProviderStateMixin {
  late ReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          await action_blocks.startingPage(context);
          safeSetState(() {});
        }),
        Future(() async {
          await actions.desconectar(
            'order_level',
          );
          await Future.delayed(
            Duration(
              milliseconds: 1000,
            ),
          );
          await actions.conectar(
            'order_level',
            () async {
              if (FFAppState().onlineMode) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'New change! - Online',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        height: 0.25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                await action_blocks.orderWarehouseAction(context);
                FFAppState().updates = FFAppState().updates + 1;
                safeSetState(() {});
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'New change! - Offline',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        height: 0.25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            },
          );
        }),
        Future(() async {
          FFAppState().orderWarehouseApiV = 'is_deleted=eq.false';
          safeSetState(() {});
          FFAppState().orderWarehouseApiV = (String var1) {
            return var1 + '&order=crono.desc.nullslast&is_deleted=eq.false';
          }(FFAppState().orderWarehouseApiV);
          await action_blocks.orderWarehouseAction(context);
          safeSetState(() {});
        }),
        Future(() async {
          _model.packagingApiOP = await TablesGroup.packagingCall.call(
            userToken: currentJwtToken,
          );

          _model.manipulationApiOP = await TablesGroup.manipulationCall.call(
            userToken: currentJwtToken,
          );

          FFAppState().packagingList = TablesGroup.packagingCall
              .packagingName(
                (_model.packagingApiOP?.jsonBody ?? ''),
              )!
              .toList()
              .cast<String>();
          FFAppState().manipulationList = TablesGroup.manipulationCall
              .manipulation(
                (_model.manipulationApiOP?.jsonBody ?? ''),
              )!
              .toList()
              .cast<String>();
          safeSetState(() {});
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.licenceTFTextController ??= TextEditingController();
    _model.licenceTFFocusNode ??= FocusNode();

    _model.containerNoTFTextController ??= TextEditingController();
    _model.containerNoTFFocusNode ??= FocusNode();

    _model.universalRefNumTFTextController ??= TextEditingController();
    _model.universalRefNumTFFocusNode ??= FocusNode();

    _model.fMSrefTFTextController ??= TextEditingController();
    _model.fMSrefTFFocusNode ??= FocusNode();

    _model.loadRefDvhTFTextController ??= TextEditingController();
    _model.loadRefDvhTFFocusNode ??= FocusNode();

    _model.q1TFTextController1 ??= TextEditingController();
    _model.q1TFFocusNode1 ??= FocusNode();

    _model.q2TFTextController1 ??= TextEditingController();
    _model.q2TFFocusNode1 ??= FocusNode();

    _model.w1TFTextController1 ??= TextEditingController();
    _model.w1TFFocusNode1 ??= FocusNode();

    _model.w2TFTextController1 ??= TextEditingController();
    _model.w2TFFocusNode1 ??= FocusNode();

    _model.containerNo2TFTextController ??= TextEditingController();
    _model.containerNo2TFFocusNode ??= FocusNode();

    _model.q1TFTextController2 ??= TextEditingController();
    _model.q1TFFocusNode2 ??= FocusNode();

    _model.q2TFTextController2 ??= TextEditingController();
    _model.q2TFFocusNode2 ??= FocusNode();

    _model.w1TFTextController2 ??= TextEditingController();
    _model.w1TFFocusNode2 ??= FocusNode();

    _model.w2TFTextController2 ??= TextEditingController();
    _model.w2TFFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: FFAppState().users2(
        uniqueQueryKey: valueOrDefault<String>(
          widget.orderWarehouseTablesKey,
          'orderWarehouseUsersDefKey',
        ),
        requestFn: () => UsersTable().queryRows(
          queryFn: (q) => q,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> reportsUsersRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: FFAppState().navOpen == true ? 270.0 : 72.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.add_task_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  if (FFAppState().navOpen == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'yakl8w1o' /* Trampuž */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.openSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 12.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.space_dashboard,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              if (FFAppState().navOpen == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7uqhp8pp' /* Reports */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            OrderWarehouseWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.table_rows_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              if (FFAppState().navOpen == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'i1pfz7zq' /* Order warehouse */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            Warehouse2Widget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.assignment_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              if (FFAppState().navOpen == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'et4sokhi' /* Warehouse 2 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            CalendarWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              if (FFAppState().navOpen == true)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'wywtkc0i' /* Calendar */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (FFAppState().navOpen == true)
                                        Container(
                                          width: 24.0,
                                          height: 14.0,
                                          decoration: BoxDecoration(),
                                        ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '18763ku5' /* Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      if (FFAppState().navOpen == true)
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 14.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (reportsUsersRowList
                                          .where((e) => e.id == currentUserUid)
                                          .toList()
                                          .firstOrNull
                                          ?.userType ==
                                      'superadmin')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context
                                              .pushNamed(UsersWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                if (FFAppState().navOpen ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e9bl6o82' /* Users */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (reportsUsersRowList
                                          .where((e) => e.id == currentUserUid)
                                          .toList()
                                          .firstOrNull
                                          ?.userType ==
                                      'superadmin')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ExploreWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.wifi_tethering_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                if (FFAppState().navOpen ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'atnu4jxq' /* Explore */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Container(
                                      width: 50.0,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  if (FFAppState().navOpen == true)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowLanguageSelector(
                                        width: 200.0,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        borderColor: Colors.transparent,
                                        dropdownIconColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 12.0,
                                        textStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13.0,
                                        ),
                                        hideFlags: false,
                                        flagSize: 24.0,
                                        flagTextGap: 16.0,
                                        currentLanguage:
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        languages: FFLocalizations.languages(),
                                        onChanged: (lang) =>
                                            setAppLanguage(context, lang),
                                      ),
                                    ),
                                  if (FFAppState().navOpen == true)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.lightModeModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LightModeWidget(),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                            Divider(
                              height: 12.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            wrapWithModel(
                              model: _model.userDetailsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: UserDetailsWidget(
                                userDetail: reportsUsersRowList
                                    .where((e) => e.id == currentUserUid)
                                    .toList()
                                    .firstOrNull!,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (FFAppState().navOpen == true)
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().navOpen == true) {
                                        FFAppState().navOpen = false;
                                        safeSetState(() {});
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      } else {
                                        FFAppState().navOpen = true;
                                        safeSetState(() {});
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .reverse();
                                        }
                                      }
                                    },
                                    child: Icon(
                                      Icons.menu_open_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation']!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if ((reportsUsersRowList
                              .where((e) => e.id == currentUserUid)
                              .toList()
                              .firstOrNull
                              ?.userType ==
                          'superadmin') ||
                      (reportsUsersRowList
                              .where((e) => e.id == currentUserUid)
                              .toList()
                              .firstOrNull
                              ?.userType ==
                          'administrator'))
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: FutureBuilder<List<OrderLevelRow>>(
                          future: OrderLevelTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'is_deleted',
                                  false,
                                )
                                .order('crono'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<OrderLevelRow> maxWidthOrderLevelRowList =
                                snapshot.data!;

                            return Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: double.infinity,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 2.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.home_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 22.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    12.0,
                                                                    4.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fcpvqdd4' /* Reports */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  28.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'xcnmxdqs' /* Reports */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.openSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'x6z5lxox' /* Here you have the general and ... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4nd2o6gw' /* Updates: */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.openSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .updates
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                36.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await _model
                                                                          .reportsFiltersAction(
                                                                              context);
                                                                      await action_blocks
                                                                          .orderWarehouseAction(
                                                                              context);
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'aiynpwsa' /* Search */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .search,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          28.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await action_blocks
                                                                          .startingPage(
                                                                              context);
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .flowDDValueController
                                                                            ?.reset();
                                                                        _model
                                                                            .improvementDDValueController
                                                                            ?.reset();
                                                                        _model
                                                                            .packagingDDValueController1
                                                                            ?.reset();
                                                                        _model
                                                                            .goodDDValueController1
                                                                            ?.reset();
                                                                        _model
                                                                            .loadingTypeDDValueController
                                                                            ?.reset();
                                                                        _model
                                                                            .manipulationsDDValueController
                                                                            ?.reset();
                                                                        _model
                                                                            .invStatusDDValueController
                                                                            ?.reset();
                                                                        _model
                                                                            .packagingDDValueController2
                                                                            ?.reset();
                                                                        _model
                                                                            .goodDDValueController2
                                                                            ?.reset();
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .q1TFTextController1
                                                                            ?.clear();
                                                                        _model
                                                                            .q2TFTextController1
                                                                            ?.clear();
                                                                        _model
                                                                            .w1TFTextController1
                                                                            ?.clear();
                                                                        _model
                                                                            .w2TFTextController1
                                                                            ?.clear();
                                                                        _model
                                                                            .q1TFTextController2
                                                                            ?.clear();
                                                                        _model
                                                                            .q2TFTextController2
                                                                            ?.clear();
                                                                        _model
                                                                            .w1TFTextController2
                                                                            ?.clear();
                                                                        _model
                                                                            .w2TFTextController2
                                                                            ?.clear();
                                                                        _model
                                                                            .licenceTFTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .containerNoTFTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .universalRefNumTFTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .fMSrefTFTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .loadRefDvhTFTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .containerNo2TFTextController
                                                                            ?.clear();
                                                                      });
                                                                      FFAppState()
                                                                              .goodDescriptionApiB =
                                                                          false;
                                                                      FFAppState()
                                                                              .clientApiB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .clearSnackBars();
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Filters updated.',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 12.0,
                                                                              height: 0.25,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'a6w8pdi9' /* Reset filters */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .restart_alt,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          28.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 48.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              constraints: BoxConstraints(
                                                maxWidth: double.infinity,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                    unselectedLabelStyle:
                                                        TextStyle(),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    indicatorWeight: 4.0,
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'h90z5128' /* General report */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'lk2foi05' /* Stock report */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {
                                                          await action_blocks
                                                              .startingPage(
                                                                  context);
                                                          safeSetState(() {
                                                            _model
                                                                .flowDDValueController
                                                                ?.reset();
                                                            _model
                                                                .improvementDDValueController
                                                                ?.reset();
                                                            _model
                                                                .packagingDDValueController1
                                                                ?.reset();
                                                            _model
                                                                .goodDDValueController1
                                                                ?.reset();
                                                            _model
                                                                .loadingTypeDDValueController
                                                                ?.reset();
                                                            _model
                                                                .manipulationsDDValueController
                                                                ?.reset();
                                                            _model
                                                                .invStatusDDValueController
                                                                ?.reset();
                                                            _model
                                                                .packagingDDValueController2
                                                                ?.reset();
                                                            _model
                                                                .goodDDValueController2
                                                                ?.reset();
                                                          });
                                                          safeSetState(() {
                                                            _model
                                                                .q1TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .q2TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .w1TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .w2TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .q1TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .q2TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .w1TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .w2TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .licenceTFTextController
                                                                ?.clear();
                                                            _model
                                                                .containerNoTFTextController
                                                                ?.clear();
                                                            _model
                                                                .universalRefNumTFTextController
                                                                ?.clear();
                                                            _model
                                                                .fMSrefTFTextController
                                                                ?.clear();
                                                            _model
                                                                .loadRefDvhTFTextController
                                                                ?.clear();
                                                            _model
                                                                .containerNo2TFTextController
                                                                ?.clear();
                                                          });
                                                          FFAppState()
                                                                  .goodDescriptionApiB =
                                                              false;
                                                          FFAppState()
                                                                  .clientApiB =
                                                              false;
                                                          safeSetState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Filters updated.',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      12.0,
                                                                  height: 0.25,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        },
                                                        () async {
                                                          await action_blocks
                                                              .startingPage(
                                                                  context);
                                                          safeSetState(() {
                                                            _model
                                                                .flowDDValueController
                                                                ?.reset();
                                                            _model
                                                                .improvementDDValueController
                                                                ?.reset();
                                                            _model
                                                                .packagingDDValueController1
                                                                ?.reset();
                                                            _model
                                                                .goodDDValueController1
                                                                ?.reset();
                                                            _model
                                                                .loadingTypeDDValueController
                                                                ?.reset();
                                                            _model
                                                                .manipulationsDDValueController
                                                                ?.reset();
                                                            _model
                                                                .invStatusDDValueController
                                                                ?.reset();
                                                            _model
                                                                .packagingDDValueController2
                                                                ?.reset();
                                                            _model
                                                                .goodDDValueController2
                                                                ?.reset();
                                                          });
                                                          safeSetState(() {
                                                            _model
                                                                .q1TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .q2TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .w1TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .w2TFTextController1
                                                                ?.clear();
                                                            _model
                                                                .q1TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .q2TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .w1TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .w2TFTextController2
                                                                ?.clear();
                                                            _model
                                                                .containerNoTFTextController
                                                                ?.clear();
                                                            _model
                                                                .universalRefNumTFTextController
                                                                ?.clear();
                                                            _model
                                                                .fMSrefTFTextController
                                                                ?.clear();
                                                            _model
                                                                .loadRefDvhTFTextController
                                                                ?.clear();
                                                            _model
                                                                .licenceTFTextController
                                                                ?.clear();
                                                            _model
                                                                .containerNo2TFTextController
                                                                ?.clear();
                                                          });
                                                          FFAppState()
                                                                  .goodDescriptionApiB =
                                                              false;
                                                          FFAppState()
                                                                  .clientApiB =
                                                              false;
                                                          safeSetState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Filters updated.',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      12.0,
                                                                  height: 0.25,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              150.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                _model.clientB,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 150.0,
                                                                                      height: 48.0,
                                                                                      child: custom_widgets.ClientTFDD(
                                                                                        width: 150.0,
                                                                                        height: 48.0,
                                                                                        clientList: FFAppState().clientList,
                                                                                        action: () async {
                                                                                          FFAppState().clientApiB = true;
                                                                                          safeSetState(() {});
                                                                                          await action_blocks.clientApiAction(context);
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        resetAction: () async {
                                                                                          FFAppState().clientApiB = false;
                                                                                          FFAppState().clientApiId = '';
                                                                                          FFAppState().clientApiV = '';
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().clientApiB = false;
                                                                                        FFAppState().clientApiV = '';
                                                                                        FFAppState().clientApiId = '';
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.restart_alt,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.dateArrivalB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final _datePicked1Date = await showDatePicker(
                                                                                                    context: context,
                                                                                                    initialDate: getCurrentTimestamp,
                                                                                                    firstDate: DateTime(1900),
                                                                                                    lastDate: DateTime(2050),
                                                                                                    builder: (context, child) {
                                                                                                      return wrapInMaterialDatePickerTheme(
                                                                                                        context,
                                                                                                        child!,
                                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                              font: GoogleFonts.openSans(
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 32.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                            ),
                                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        iconSize: 24.0,
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  if (_datePicked1Date != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked1 = DateTime(
                                                                                                        _datePicked1Date.year,
                                                                                                        _datePicked1Date.month,
                                                                                                        _datePicked1Date.day,
                                                                                                      );
                                                                                                    });
                                                                                                  } else if (_model.datePicked1 != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked1 = getCurrentTimestamp;
                                                                                                    });
                                                                                                  }
                                                                                                  _model.dateArrival1 = _model.datePicked1 != null ? _model.datePicked1 : functions.stringToDate('01/01/01', 0);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Text(
                                                                                                  _model.datePicked1 != null
                                                                                                      ? dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          _model.datePicked1,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )
                                                                                                      : dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          functions.stringToDate('01/01/01', 0),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'puejuiye' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final _datePicked2Date = await showDatePicker(
                                                                                                    context: context,
                                                                                                    initialDate: getCurrentTimestamp,
                                                                                                    firstDate: DateTime(1900),
                                                                                                    lastDate: DateTime(2050),
                                                                                                    builder: (context, child) {
                                                                                                      return wrapInMaterialDatePickerTheme(
                                                                                                        context,
                                                                                                        child!,
                                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                              font: GoogleFonts.openSans(
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 32.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                            ),
                                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        iconSize: 24.0,
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  if (_datePicked2Date != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked2 = DateTime(
                                                                                                        _datePicked2Date.year,
                                                                                                        _datePicked2Date.month,
                                                                                                        _datePicked2Date.day,
                                                                                                      );
                                                                                                    });
                                                                                                  } else if (_model.datePicked2 != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked2 = getCurrentTimestamp;
                                                                                                    });
                                                                                                  }
                                                                                                  _model.dateArrival1 = _model.datePicked2 != null ? _model.datePicked2 : functions.stringToDate('31/12/40', 1);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Text(
                                                                                                  _model.datePicked2 != null
                                                                                                      ? dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          _model.datePicked2,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )
                                                                                                      : dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          functions.stringToDate('31/12/40', 1),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              22.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.flowB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.flowDDValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'coftigh0' /* in */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '52sq369l' /* out */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'v0wukty2' /* / */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.flowDDValue = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '3ho1b072' /* Flow... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.flowDDValueController?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              62.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.licenceB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.licenceTFTextController,
                                                                                          focusNode: _model.licenceTFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'w8jpzl3k' /* Licence */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.licenceTFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.licenceTFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              42.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.improvementB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.improvementDDValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'i2kiwnp4' /* kont.-20" */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'v5wy8v7m' /* kont.-40" */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'qol0zt3l' /* kont.-45" */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'u8wiw2t0' /* cerada */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'b7iw65ay' /* hladilnik */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'uznf7vm0' /* silos */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'epe6jf3c' /* / */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.improvementDDValue = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '91d01uq3' /* Improvement... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'tjcjineb' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.improvementDDValueController?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              52.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.containerNoB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.containerNoTFTextController,
                                                                                          focusNode: _model.containerNoTFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'y9dw69hr' /* Container no */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.containerNoTFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.containerNoTFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              62.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.universalRefNumB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.universalRefNumTFTextController,
                                                                                          focusNode: _model.universalRefNumTFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'bqccp7da' /* Universal ref num */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.universalRefNumTFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.universalRefNumTFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              32.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.fmsRefB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.fMSrefTFTextController,
                                                                                          focusNode: _model.fMSrefTFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              '7gyenvii' /* FMS ref */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.fMSrefTFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.fMSrefTFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              32.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.loadRefDvhB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.loadRefDvhTFTextController,
                                                                                          focusNode: _model.loadRefDvhTFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'lsw1s220' /* Load ref dvh */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.loadRefDvhTFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.loadRefDvhTFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              48.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.quantityB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.q1TFTextController1,
                                                                                                      focusNode: _model.q1TFFocusNode1,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          '0ok7j8mg' /* Q1 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.q1TFTextController1Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '74ggfe4h' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.q2TFTextController1,
                                                                                                      focusNode: _model.q2TFFocusNode1,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          'ver4j0jq' /* Q2 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.q2TFTextController1Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              52.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.packagingB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.packagingDDValueController1 ??= FormFieldController<String>(null),
                                                                                        options: FFAppState().packagingList,
                                                                                        onChanged: (val) => safeSetState(() => _model.packagingDDValue1 = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'pjyrwgzx' /* Packaging... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'rt8sxze5' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.packagingDDValueController1?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              38.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.weightB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.w1TFTextController1,
                                                                                                      focusNode: _model.w1TFFocusNode1,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          'luhd4lxr' /* W1 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.w1TFTextController1Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'dg3ae4rg' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.w2TFTextController1,
                                                                                                      focusNode: _model.w2TFFocusNode1,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          'shhnnobf' /* W2 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.w2TFTextController1Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              34.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.goodB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.goodDDValueController1 ??= FormFieldController<String>(null),
                                                                                        options: FFAppState().goodsList,
                                                                                        onChanged: (val) => safeSetState(() => _model.goodDDValue1 = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'zysgo73l' /* Good */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'zf14esit' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.goodDDValueController1?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.goodDescriptionB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 150.0,
                                                                                        height: 48.0,
                                                                                        child: custom_widgets.GoodDescriptionTFDD(
                                                                                          width: 150.0,
                                                                                          height: 48.0,
                                                                                          goodDescriptionList: FFAppState().goodDescriptionList,
                                                                                          action: () async {
                                                                                            FFAppState().goodDescriptionApiB = true;
                                                                                            safeSetState(() {});
                                                                                            await action_blocks.goodDescriptionApiAction(context);
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          resetAction: () async {
                                                                                            FFAppState().goodDescriptionApiB = false;
                                                                                            safeSetState(() {});
                                                                                            FFAppState().goodDescriptionApiV = '';
                                                                                            FFAppState().goodDescriptionApiId = '';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().goodDescriptionApiV = '';
                                                                                          FFAppState().goodDescriptionApiId = '';
                                                                                          FFAppState().goodDescriptionApiB = false;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.loadingTypeB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.loadingTypeDDValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '81cshm22' /* viličar */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '369hdv0h' /* ročno */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'mfj7h4z3' /* / */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.loadingTypeDDValue = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'r88txs3j' /* Loading type... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'jyn280dv' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.loadingTypeDDValueController?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.manipulationB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.manipulationsDDValueController ??= FormFieldController<String>(null),
                                                                                        options: FFAppState().manipulationList,
                                                                                        onChanged: (val) => safeSetState(() => _model.manipulationsDDValue = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'ir1knbgr' /* Manipulations... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'duvs6owd' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.manipulationsDDValueController?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                            (_model.orderNoB == true) || (_model.clientB == true) || (_model.flowB == true) || _model.invStatusB || (_model.warehouseB == true) || (_model.orderStatusB == true) || (_model.licenceB == true) || (_model.improvementB == true) || (_model.palletPositionB == true) || (_model.universalRefNumB == true) || (_model.fmsRefB == true) || (_model.loadRefDvhB == true) || (_model.customB == true) || (_model.goodB == true) || (_model.goodDescriptionB == true) || (_model.assistant1B == true) || _model.assistant2B || _model.assistant3B || _model.assistant4B || _model.assistant5B || _model.assistant6B || _model.adminB || _model.barcodeB || _model.intCustomB || _model.containerNoB || _model.dateArrivalB || _model.packagingB
                                                                                ? (MediaQuery.sizeOf(context).height - 252)
                                                                                : (MediaQuery.sizeOf(context).height - 178),
                                                                            588.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final reportsV = FFAppState().orderWarehouseAS.toList();

                                                                              return FlutterFlowDataTable<OrderWarehouseRowStruct>(
                                                                                controller: _model.generalDTController,
                                                                                data: reportsV,
                                                                                columnsBuilder: (onSortChanged) => [
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'hkjhkokq' /* Client */,
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        minFontSize: 1.0,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.clientB) {
                                                                                                      _model.clientB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.clientB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.clientB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'kekfc6eg' /* Arrival Date */,
                                                                                              ),
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.dateArrivalB) {
                                                                                                _model.dateArrivalB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.dateArrivalB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.dateArrivalB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'j0b3b1bh' /* Flow */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      if (_model.flowB) {
                                                                                                        _model.flowB = false;
                                                                                                        safeSetState(() {});
                                                                                                      } else {
                                                                                                        _model.flowB = true;
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.filter_list,
                                                                                                      color: _model.flowB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'bbk1ht3g' /* Licence */,
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        minFontSize: 1.0,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.licenceB) {
                                                                                                      _model.licenceB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.licenceB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.licenceB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 180.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'utyttd0v' /* Improvement */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.improvementB) {
                                                                                                      _model.improvementB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.improvementB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.improvementB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'zqzx7dla' /* Container No. */,
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        minFontSize: 1.0,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.containerNoB) {
                                                                                                      _model.containerNoB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.containerNoB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.containerNoB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 180.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'xq8wlt0n' /* Universal ref num */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.universalRefNumB) {
                                                                                                      _model.universalRefNumB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.universalRefNumB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.universalRefNumB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 140.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'm8ahl3iw' /* FMS ref */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.fmsRefB) {
                                                                                                      _model.fmsRefB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.fmsRefB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.fmsRefB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'ef41n9x0' /* Load ref dvh */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.loadRefDvhB) {
                                                                                                      _model.loadRefDvhB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.loadRefDvhB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.loadRefDvhB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 140.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              'Quantity (${(valueOrDefault<int>(
                                                                                                    functions.sumList(reportsV.where((e) => e.flow == 'in').toList().map((e) => e.quantity).toList()),
                                                                                                    0,
                                                                                                  ) - valueOrDefault<int>(
                                                                                                    functions.sumList(reportsV.where((e) => e.flow == 'out').toList().map((e) => e.quantity).toList()),
                                                                                                    0,
                                                                                                  )).toString()})',
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.quantityB) {
                                                                                                _model.quantityB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.quantityB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.quantityB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 160.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'jrxcwct7' /* Packaging */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.packagingB) {
                                                                                                _model.packagingB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.packagingB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.packagingB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 140.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'e3pmrlnn' /* Weight */,
                                                                                              ),
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.weightB) {
                                                                                                _model.weightB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.weightB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.weightB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 140.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '2pr0riml' /* Good */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.goodB) {
                                                                                                      _model.goodB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.goodB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.goodB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '4j8frg1g' /* Good description */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.goodDescriptionB) {
                                                                                                      _model.goodDescriptionB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.goodDescriptionB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.goodDescriptionB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'ze84nx05' /* Type of un/upload */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.loadingTypeB) {
                                                                                                _model.loadingTypeB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.loadingTypeB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.loadingTypeB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'k4802oaz' /* Other manipulations */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.manipulationB) {
                                                                                                _model.manipulationB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.manipulationB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.manipulationB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3pty1hz6' /* Documents */,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ro3l2d4w' /* Order N° */,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ocbbo07c' /* Custom */,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ahljt63q' /* Int custom */,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            FFAppState().rowList = [];
                                                                                            safeSetState(() {});
                                                                                            _model.counter = 0;
                                                                                            safeSetState(() {});
                                                                                            FFAppState().addToRowList(SupabaseRowListStruct(
                                                                                              supabaseRowList: [
                                                                                                'STRANKA',
                                                                                                'DATUM',
                                                                                                'IN/OUT',
                                                                                                'REG. ŠTEVILKA',
                                                                                                'NADGRAD.',
                                                                                                'ŠT.KONTEJNER',
                                                                                                'REF.1',
                                                                                                'REF.2',
                                                                                                'REF.3',
                                                                                                'KOLIČINA',
                                                                                                'EMB.',
                                                                                                'TEŽA KG',
                                                                                                'BLAGO',
                                                                                                'OPIS BLAGA',
                                                                                                'DELO Z',
                                                                                                'MANIPULACIJA'
                                                                                              ],
                                                                                            ));
                                                                                            safeSetState(() {});
                                                                                            while (_model.counter <
                                                                                                valueOrDefault<int>(
                                                                                                  reportsV.length,
                                                                                                  0,
                                                                                                )) {
                                                                                              FFAppState().rowListOfList = [];
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.clientName,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                            dateTimeFormat(
                                                                                                              "yMMMd",
                                                                                                              functions.parsePostgresTimestamp(valueOrDefault<String>(
                                                                                                                reportsV.elementAtOrNull(_model.counter)?.etaDate2,
                                                                                                                '/',
                                                                                                              )),
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ),
                                                                                                            '/',
                                                                                                          ) !=
                                                                                                          ''
                                                                                                  ? valueOrDefault<String>(
                                                                                                      dateTimeFormat(
                                                                                                        "yMMMd",
                                                                                                        functions.parsePostgresTimestamp(valueOrDefault<String>(
                                                                                                          reportsV.elementAtOrNull(_model.counter)?.etaDate2,
                                                                                                          '/',
                                                                                                        )),
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      '/',
                                                                                                    )
                                                                                                  : '/');
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.flow,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.licencePlate,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.improvement,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.containerNo,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.universalRefNo,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.fmsRef,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.loadRefDvh,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.quantity.toString(),
                                                                                                '0',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.packagingName,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.weight.toString(),
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.item,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.opisBlaga,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.loadingType,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.otherManipulation,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.orderNo,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.customName,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV.elementAtOrNull(_model.counter)?.internalRefCustom,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowList(SupabaseRowListStruct(
                                                                                                supabaseRowList: FFAppState().rowListOfList,
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              _model.counter = _model.counter + 1;
                                                                                              safeSetState(() {});
                                                                                            }
                                                                                            await actions.getCsv(
                                                                                              FFAppState().rowList.toList(),
                                                                                            );
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.save_alt_rounded,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 36.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 40.0,
                                                                                  ),
                                                                                ],
                                                                                dataRowBuilder: (reportsVItem, reportsVIndex, selected, onSelectChanged) => DataRow(
                                                                                  color: WidgetStateProperty.all(
                                                                                    reportsVIndex % 2 == 0 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).accent4,
                                                                                  ),
                                                                                  cells: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.clientName,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 12,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "yMMMd",
                                                                                              functions.parsePostgresTimestamp(valueOrDefault<String>(
                                                                                                reportsVItem.etaDate2,
                                                                                                '/',
                                                                                              )),
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.flow,
                                                                                                '/',
                                                                                              ),
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.licencePlate,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 24,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.licencePlate,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.improvement,
                                                                                                '/',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onDoubleTap: () async {
                                                                                                _model.selectedIndex = reportsVIndex;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  reportsVItem.containerNo,
                                                                                                  '/',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 24,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                maxLines: 2,
                                                                                                minFontSize: 1.0,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.containerNo,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.universalRefNo,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 10,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.universalRefNo,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.fmsRef,
                                                                                            '/',
                                                                                          ).maybeHandleOverflow(
                                                                                            maxChars: 10,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.loadRefDvh,
                                                                                            '/',
                                                                                          ).maybeHandleOverflow(
                                                                                            maxChars: 10,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.flow == 'out'
                                                                                                ? '-${reportsVItem.quantity.toString()}'
                                                                                                : valueOrDefault<String>(
                                                                                                    reportsVItem.quantity.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.packagingName,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 72.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onDoubleTap: () async {
                                                                                                  _model.selectedIndex = reportsVIndex;
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: AutoSizeText(
                                                                                                  valueOrDefault<String>(
                                                                                                    reportsVItem.weight.toString(),
                                                                                                    '-1',
                                                                                                  ).maybeHandleOverflow(
                                                                                                    maxChars: 10,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  maxLines: 2,
                                                                                                  minFontSize: 1.0,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.weight.toString(),
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.item,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 15,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.item,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsVIndex;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsVItem.opisBlaga,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 15,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsVItem.goodDescription,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.loadingType,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.otherManipulation,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Builder(
                                                                                            builder: (context) => InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: GestureDetector(
                                                                                                        onTap: () {
                                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                        },
                                                                                                        child: DocumentsWidget(
                                                                                                          orderId: reportsVItem.id,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.picture_as_pdf_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              reportsVItem.documents.length.toString(),
                                                                                              '/',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.orderNo,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.customName,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsVIndex;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsVItem.internalRefCustom,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 1.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsVIndex == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(),
                                                                                  ].map((c) => DataCell(c)).toList(),
                                                                                ),
                                                                                paginated: true,
                                                                                selectable: false,
                                                                                hidePaginator: false,
                                                                                showFirstLastButtons: true,
                                                                                width: 2800.0,
                                                                                headingRowHeight: 56.0,
                                                                                dataRowHeight: 24.0,
                                                                                columnSpacing: 8.0,
                                                                                headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                addHorizontalDivider: true,
                                                                                addTopAndBottomDivider: false,
                                                                                hideDefaultHorizontalDivider: false,
                                                                                horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                horizontalDividerThickness: 1.0,
                                                                                addVerticalDivider: true,
                                                                                verticalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                verticalDividerThickness: 1.0,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.clientB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 150.0,
                                                                                        height: 48.0,
                                                                                        child: custom_widgets.ClientTFDD(
                                                                                          width: 150.0,
                                                                                          height: 48.0,
                                                                                          clientList: FFAppState().clientList,
                                                                                          action: () async {
                                                                                            FFAppState().clientApiB = true;
                                                                                            safeSetState(() {});
                                                                                            await action_blocks.clientApiAction(context);
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          resetAction: () async {
                                                                                            FFAppState().clientApiB = false;
                                                                                            FFAppState().clientApiId = '';
                                                                                            FFAppState().clientApiV = '';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().clientApiB = false;
                                                                                          FFAppState().clientApiV = '';
                                                                                          FFAppState().clientApiId = '';
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              48.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.dateArrivalB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final _datePicked3Date = await showDatePicker(
                                                                                                    context: context,
                                                                                                    initialDate: getCurrentTimestamp,
                                                                                                    firstDate: DateTime(1900),
                                                                                                    lastDate: DateTime(2050),
                                                                                                    builder: (context, child) {
                                                                                                      return wrapInMaterialDatePickerTheme(
                                                                                                        context,
                                                                                                        child!,
                                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                              font: GoogleFonts.openSans(
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 32.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                            ),
                                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        iconSize: 24.0,
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  if (_datePicked3Date != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked3 = DateTime(
                                                                                                        _datePicked3Date.year,
                                                                                                        _datePicked3Date.month,
                                                                                                        _datePicked3Date.day,
                                                                                                      );
                                                                                                    });
                                                                                                  } else if (_model.datePicked3 != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked3 = getCurrentTimestamp;
                                                                                                    });
                                                                                                  }
                                                                                                  _model.dateArrival1 = _model.datePicked3 != null ? _model.datePicked3 : functions.stringToDate('01/01/01', 0);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Text(
                                                                                                  _model.datePicked3 != null
                                                                                                      ? dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          _model.datePicked3,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )
                                                                                                      : dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          functions.stringToDate('01/01/01', 0),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'q5ory8gd' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  final _datePicked4Date = await showDatePicker(
                                                                                                    context: context,
                                                                                                    initialDate: getCurrentTimestamp,
                                                                                                    firstDate: DateTime(1900),
                                                                                                    lastDate: DateTime(2050),
                                                                                                    builder: (context, child) {
                                                                                                      return wrapInMaterialDatePickerTheme(
                                                                                                        context,
                                                                                                        child!,
                                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                              font: GoogleFonts.openSans(
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 32.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                            ),
                                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        iconSize: 24.0,
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  if (_datePicked4Date != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked4 = DateTime(
                                                                                                        _datePicked4Date.year,
                                                                                                        _datePicked4Date.month,
                                                                                                        _datePicked4Date.day,
                                                                                                      );
                                                                                                    });
                                                                                                  } else if (_model.datePicked4 != null) {
                                                                                                    safeSetState(() {
                                                                                                      _model.datePicked4 = getCurrentTimestamp;
                                                                                                    });
                                                                                                  }
                                                                                                  _model.dateArrival1 = _model.datePicked4 != null ? _model.datePicked4 : functions.stringToDate('31/12/40', 1);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Text(
                                                                                                  _model.datePicked4 != null
                                                                                                      ? dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          _model.datePicked4,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )
                                                                                                      : dateTimeFormat(
                                                                                                          "d/M",
                                                                                                          functions.stringToDate('31/12/40', 1),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              48.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.invStatusB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.invStatusDDValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'kwg0eqpl' /* najava */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'k3fvsjs7' /* obdelava */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'zt64rnsl' /* izdano */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '1q3pfu3e' /* zaloga */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'i5rk28c5' /* brez izbire */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.invStatusDDValue = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'x6cbapn0' /* Inv status... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.invStatusDDValueController?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              64.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.containerNoB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.containerNo2TFTextController,
                                                                                          focusNode: _model.containerNo2TFFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              '7sc0jxmd' /* Container no */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          validator: _model.containerNo2TFTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.containerNo2TFTextController?.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              72.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.quantityB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.q1TFTextController2,
                                                                                                      focusNode: _model.q1TFFocusNode2,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          '0f6mofkd' /* Q1 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.q1TFTextController2Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '4opjt5wr' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.q2TFTextController2,
                                                                                                      focusNode: _model.q2TFFocusNode2,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          '9s1g0w05' /* Q2 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.q2TFTextController2Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              62.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.packagingB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.packagingDDValueController2 ??= FormFieldController<String>(null),
                                                                                        options: FFAppState().packagingList,
                                                                                        onChanged: (val) => safeSetState(() => _model.packagingDDValue2 = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '2o3540tf' /* Packaging... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'tizjlouh' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.packagingDDValueController2?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              38.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.weightB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.w1TFTextController2,
                                                                                                      focusNode: _model.w1TFFocusNode2,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          '4x0gzgsb' /* W1 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.w1TFTextController2Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'zcp0084v' /*  :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 30.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.w2TFTextController2,
                                                                                                      focusNode: _model.w2TFFocusNode2,
                                                                                                      autofocus: false,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          '9nsgzlio' /* W2 */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        enabledBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        errorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: UnderlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      validator: _model.w2TFTextController2Validator.asValidator(context),
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_double_arrow_down,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              40.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.goodB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.goodDDValueController2 ??= FormFieldController<String>(null),
                                                                                        options: FFAppState().goodsList,
                                                                                        onChanged: (val) => safeSetState(() => _model.goodDDValue2 = val),
                                                                                        width: 100.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              fontSize: 11.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '7shgtldo' /* Good... */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'vgwp3mus' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          safeSetState(() {
                                                                                            _model.goodDDValueController2?.reset();
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              34.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.goodDescriptionB,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 150.0,
                                                                                        height: 48.0,
                                                                                        child: custom_widgets.GoodDescriptionTFDD(
                                                                                          width: 150.0,
                                                                                          height: 48.0,
                                                                                          goodDescriptionList: FFAppState().goodDescriptionList,
                                                                                          action: () async {
                                                                                            FFAppState().goodDescriptionApiB = true;
                                                                                            safeSetState(() {});
                                                                                            await action_blocks.goodDescriptionApiAction(context);
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          resetAction: () async {
                                                                                            FFAppState().goodDescriptionApiB = false;
                                                                                            safeSetState(() {});
                                                                                            FFAppState().goodDescriptionApiV = '';
                                                                                            FFAppState().goodDescriptionApiId = '';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().goodDescriptionApiV = '';
                                                                                          FFAppState().goodDescriptionApiId = '';
                                                                                          FFAppState().goodDescriptionApiB = false;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.restart_alt,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                            (_model.orderNoB == true) || (_model.clientB == true) || (_model.flowB == true) || _model.invStatusB || (_model.warehouseB == true) || (_model.orderStatusB == true) || (_model.licenceB == true) || (_model.improvementB == true) || (_model.palletPositionB == true) || (_model.universalRefNumB == true) || (_model.fmsRefB == true) || (_model.loadRefDvhB == true) || (_model.customB == true) || (_model.goodB == true) || (_model.goodDescriptionB == true) || (_model.assistant1B == true) || _model.assistant2B || _model.assistant3B || _model.assistant4B || _model.assistant5B || _model.assistant6B || _model.adminB || _model.barcodeB || _model.intCustomB || _model.containerNoB || _model.dateArrivalB
                                                                                ? (MediaQuery.sizeOf(context).height - 252)
                                                                                : (MediaQuery.sizeOf(context).height - 178),
                                                                            588.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final reportsV2 = FFAppState().orderWarehouseAS.toList();

                                                                              return FlutterFlowDataTable<OrderWarehouseRowStruct>(
                                                                                controller: _model.stockDTController,
                                                                                data: reportsV2,
                                                                                columnsBuilder: (onSortChanged) => [
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'w9uulmsc' /* Client */,
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        minFontSize: 1.0,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.clientB) {
                                                                                                      _model.clientB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.clientB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.clientB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'gaco1k8c' /* Arrival Date */,
                                                                                              ),
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.dateArrivalB) {
                                                                                                _model.dateArrivalB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.dateArrivalB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.dateArrivalB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'jkhm5g0t' /* Inventory status */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      if (_model.flowB) {
                                                                                                        _model.flowB = false;
                                                                                                        safeSetState(() {});
                                                                                                      } else {
                                                                                                        _model.flowB = true;
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.filter_list,
                                                                                                      color: _model.invStatusB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'pvaiwwpu' /* Container No. */,
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        minFontSize: 1.0,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.containerNoB) {
                                                                                                      _model.containerNoB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.containerNoB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.containerNoB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 200.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              'Quantity (${(valueOrDefault<int>(
                                                                                                    functions.sumList(reportsV2.where((e) => e.flow == 'in').toList().map((e) => e.quantity).toList()),
                                                                                                    0,
                                                                                                  ) - valueOrDefault<int>(
                                                                                                    functions.sumList(reportsV2.where((e) => e.flow == 'out').toList().map((e) => e.quantity).toList()),
                                                                                                    0,
                                                                                                  )).toString()})',
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.quantityB) {
                                                                                                _model.quantityB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.quantityB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.quantityB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '3qgnc5hv' /* Packaging */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.packagingB) {
                                                                                                _model.packagingB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.packagingB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.packagingB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 180.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'gc8z373e' /* Weight */,
                                                                                              ),
                                                                                              maxLines: 2,
                                                                                              minFontSize: 1.0,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (_model.weightB) {
                                                                                                _model.weightB = false;
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                _model.weightB = true;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.filter_list,
                                                                                              color: _model.weightB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '93m8rdj0' /* Good */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.goodB) {
                                                                                                      _model.goodB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.goodB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.goodB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: AutoSizeText(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'yrl7zpbo' /* Good description */,
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          minFontSize: 1.0,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (_model.goodDescriptionB) {
                                                                                                      _model.goodDescriptionB = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      _model.goodDescriptionB = true;
                                                                                                      safeSetState(() {});
                                                                                                    }
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.filter_list,
                                                                                                    color: _model.goodDescriptionB ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 140.0,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '8f9l2oap' /* Documents */,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: DefaultTextStyle.merge(
                                                                                      softWrap: true,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            FFAppState().rowList = [];
                                                                                            safeSetState(() {});
                                                                                            _model.counter = 0;
                                                                                            safeSetState(() {});
                                                                                            FFAppState().addToRowList(SupabaseRowListStruct(
                                                                                              supabaseRowList: [
                                                                                                'STRANKA',
                                                                                                'DATUM',
                                                                                                'STAT.BLAGA',
                                                                                                'ŠT.KONTEJNER',
                                                                                                'KOLIČINA',
                                                                                                'EMB.',
                                                                                                'TEŽA KG',
                                                                                                'BLAGO',
                                                                                                'OPIS BLAGA'
                                                                                              ],
                                                                                            ));
                                                                                            safeSetState(() {});
                                                                                            while (_model.counter <
                                                                                                valueOrDefault<int>(
                                                                                                  reportsV2.length,
                                                                                                  0,
                                                                                                )) {
                                                                                              FFAppState().rowListOfList = [];
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.clientName,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                dateTimeFormat(
                                                                                                  "d/M/y",
                                                                                                  functions.parsePostgresTimestamp(valueOrDefault<String>(
                                                                                                    reportsV2.elementAtOrNull(_model.counter)?.etaDate2,
                                                                                                    '/',
                                                                                                  )),
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.invStatus,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.containerNo,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.quantity.toString(),
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.packagingName,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.weight.toString(),
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.item,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowListOfList(valueOrDefault<String>(
                                                                                                reportsV2.elementAtOrNull(_model.counter)?.opisBlaga,
                                                                                                '/',
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              FFAppState().addToRowList(SupabaseRowListStruct(
                                                                                                supabaseRowList: FFAppState().rowListOfList,
                                                                                              ));
                                                                                              safeSetState(() {});
                                                                                              _model.counter = _model.counter + 1;
                                                                                              safeSetState(() {});
                                                                                            }
                                                                                            await actions.getCsv(
                                                                                              FFAppState().rowList.toList(),
                                                                                            );
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.save_alt_rounded,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 36.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    fixedWidth: 40.0,
                                                                                  ),
                                                                                ],
                                                                                dataRowBuilder: (reportsV2Item, reportsV2Index, selected, onSelectChanged) => DataRow(
                                                                                  color: WidgetStateProperty.all(
                                                                                    reportsV2Index % 2 == 0 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).accent4,
                                                                                  ),
                                                                                  cells: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsV2Index;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsV2Item.clientName,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 12,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsV2Index;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "yMMMd",
                                                                                              functions.parsePostgresTimestamp(valueOrDefault<String>(
                                                                                                reportsV2Item.etaDate2,
                                                                                                '/',
                                                                                              )),
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsV2Index;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsV2Item.invStatus,
                                                                                                '/',
                                                                                              ),
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onDoubleTap: () async {
                                                                                                _model.selectedIndex = reportsV2Index;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  reportsV2Item.containerNo,
                                                                                                  '/',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 24,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                maxLines: 2,
                                                                                                minFontSize: 1.0,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Roboto',
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsV2Item.containerNo,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsV2Index;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsV2Item.flow == 'out'
                                                                                                ? '-${valueOrDefault<String>(
                                                                                                    reportsV2Item.quantity.toString(),
                                                                                                    '/',
                                                                                                  )}'
                                                                                                : valueOrDefault<String>(
                                                                                                    reportsV2Item.quantity.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 2,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onDoubleTap: () async {
                                                                                          _model.selectedIndex = reportsV2Index;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: AutoSizeText(
                                                                                          valueOrDefault<String>(
                                                                                            reportsV2Item.packagingName,
                                                                                            '/',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          minFontSize: 6.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: valueOrDefault<Color>(
                                                                                                  reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 72.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onDoubleTap: () async {
                                                                                                  _model.selectedIndex = reportsV2Index;
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: AutoSizeText(
                                                                                                  valueOrDefault<String>(
                                                                                                    reportsV2Item.weight.toString(),
                                                                                                    '-1',
                                                                                                  ).maybeHandleOverflow(
                                                                                                    maxChars: 10,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  maxLines: 2,
                                                                                                  minFontSize: 1.0,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsV2Item.weight.toString(),
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsV2Index;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsV2Item.item,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 15,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsV2Item.item,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onDoubleTap: () async {
                                                                                              _model.selectedIndex = reportsV2Index;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                reportsV2Item.opisBlaga,
                                                                                                '/',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 15,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              minFontSize: 6.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Clipboard.setData(ClipboardData(
                                                                                                  text: valueOrDefault<String>(
                                                                                                reportsV2Item.opisBlaga,
                                                                                                '/',
                                                                                              )));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.content_copy,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Builder(
                                                                                            builder: (context) => InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: GestureDetector(
                                                                                                        onTap: () {
                                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                        },
                                                                                                        child: DocumentsWidget(
                                                                                                          orderId: reportsV2Item.id,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.picture_as_pdf_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              reportsV2Item.documents.length.toString(),
                                                                                              '/',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    reportsV2Index == _model.selectedIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(),
                                                                                  ].map((c) => DataCell(c)).toList(),
                                                                                ),
                                                                                paginated: true,
                                                                                selectable: false,
                                                                                hidePaginator: false,
                                                                                showFirstLastButtons: true,
                                                                                width: 1600.0,
                                                                                headingRowHeight: 56.0,
                                                                                dataRowHeight: 24.0,
                                                                                columnSpacing: 8.0,
                                                                                headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                addHorizontalDivider: true,
                                                                                addTopAndBottomDivider: false,
                                                                                hideDefaultHorizontalDivider: false,
                                                                                horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                horizontalDividerThickness: 1.0,
                                                                                addVerticalDivider: true,
                                                                                verticalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                verticalDividerThickness: 1.0,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

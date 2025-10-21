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
import '/pages/floating/associate_query/associate_query_widget.dart';
import '/pages/floating/create_record/create_record_widget.dart';
import '/pages/floating/details/details_widget.dart';
import '/pages/floating/documents/documents_widget.dart';
import '/pages/floating/forms/forms_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'warehouse2_model.dart';
export 'warehouse2_model.dart';

class Warehouse2Widget extends StatefulWidget {
  const Warehouse2Widget({
    super.key,
    String? warehouse2TablesKey,
  }) : this.warehouse2TablesKey =
            warehouse2TablesKey ?? 'warehouse2TablesDefKey';

  final String warehouse2TablesKey;

  static String routeName = 'warehouse2';
  static String routePath = '/warehouse2';

  @override
  State<Warehouse2Widget> createState() => _Warehouse2WidgetState();
}

class _Warehouse2WidgetState extends State<Warehouse2Widget>
    with TickerProviderStateMixin {
  late Warehouse2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Warehouse2Model());

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
              await action_blocks.orderWarehouseAction(context);
              FFAppState().updates = FFAppState().updates + 1;
              safeSetState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'New change!',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      height: 0.25,
                    ),
                  ),
                  duration: Duration(milliseconds: 500),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            },
          );
        }),
        Future(() async {
          FFAppState().orderWarehouseApiV = 'is_deleted=eq.false';
          safeSetState(() {});
          FFAppState().orderWarehouseApiV = (String var1) {
            return var1 + '&order=eta_date.desc.nullslast&limit=50';
          }(FFAppState().orderWarehouseApiV);
          await action_blocks.orderWarehouseAction(context);
          safeSetState(() {});
        }),
      ]);
    });

    _model.orderNoTFTextController ??= TextEditingController();
    _model.orderNoTFFocusNode ??= FocusNode();

    _model.licenceTFTextController ??= TextEditingController();
    _model.licenceTFFocusNode ??= FocusNode();

    _model.containerNoTFTextController ??= TextEditingController();
    _model.containerNoTFFocusNode ??= FocusNode();

    _model.rampaTFTextController ??= TextEditingController();
    _model.rampaTFFocusNode ??= FocusNode();

    _model.loadRefDvhTFTextController ??= TextEditingController();
    _model.loadRefDvhTFFocusNode ??= FocusNode();

    _model.q1TFTextController ??= TextEditingController();
    _model.q1TFFocusNode ??= FocusNode();

    _model.q2TFTextController ??= TextEditingController();
    _model.q2TFFocusNode ??= FocusNode();

    _model.intCustomTFTextController ??= TextEditingController();
    _model.intCustomTFFocusNode ??= FocusNode();

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
          widget.warehouse2TablesKey,
          'warehouse2UsersDefKey',
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
        List<UsersRow> warehouse2UsersRowList = snapshot.data!;

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
                                          'c79jd9mp' /* Trampuž */,
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
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed(ReportsWidget.routeName);
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
                                                Icons.space_dashboard,
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
                                                      'herxqh9m' /* Reports */,
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
                                                      'q3z2kzhq' /* Order warehouse */,
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
                                                Icons.assignment_outlined,
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
                                                      '9xz0x26y' /* Warehouse 2 */,
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
                                                        'abhnwadp' /* Calendar */,
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
                                          'onsxf48i' /* Settings */,
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
                                  if (warehouse2UsersRowList
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
                                                        'r8wv2y24' /* Users */,
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
                                  if (warehouse2UsersRowList
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
                                                        '5vf7vs5q' /* Explore */,
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
                                userDetail: warehouse2UsersRowList
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
                  if ((warehouse2UsersRowList
                              .where((e) => e.id == currentUserUid)
                              .toList()
                              .firstOrNull
                              ?.userType ==
                          'superadmin') ||
                      (warehouse2UsersRowList
                              .where((e) => e.id == currentUserUid)
                              .toList()
                              .firstOrNull
                              ?.userType ==
                          'administrator'))
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 2.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.home_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 16.0, 8.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'uqmisslm' /* Warehouse 2 */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gewq9u1w' /* Movements */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .openSans(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'pkwucw9j' /* Below are the details of your ... */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lzzntp6o' /* Updates: */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .openSans(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        FFAppState()
                                                            .updates
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 36.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .warehouse2FilterAction(
                                                              context);
                                                      safeSetState(() {});
                                                      await action_blocks
                                                          .orderWarehouseAction(
                                                              context);
                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '4btj9d1k' /* Search */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.search,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 28.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await action_blocks
                                                          .startingPage(
                                                              context);
                                                      safeSetState(() {
                                                        _model
                                                            .warehouseDDValueController
                                                            ?.reset();
                                                        _model
                                                            .orderStatusDDValueController
                                                            ?.reset();
                                                        _model
                                                            .flowDDValueController
                                                            ?.reset();
                                                        _model
                                                            .improvementDDValueController
                                                            ?.reset();
                                                        _model
                                                            .packagingDDValueController
                                                            ?.reset();
                                                        _model
                                                            .customDDValueController
                                                            ?.reset();
                                                      });
                                                      safeSetState(() {
                                                        _model
                                                            .orderNoTFTextController
                                                            ?.clear();
                                                        _model
                                                            .containerNoTFTextController
                                                            ?.clear();
                                                        _model
                                                            .intCustomTFTextController
                                                            ?.clear();
                                                        _model
                                                            .licenceTFTextController
                                                            ?.clear();
                                                        _model
                                                            .q1TFTextController
                                                            ?.clear();
                                                        _model
                                                            .q2TFTextController
                                                            ?.clear();
                                                        _model
                                                            .loadRefDvhTFTextController
                                                            ?.clear();
                                                      });
                                                      FFAppState()
                                                              .goodDescriptionApiB =
                                                          false;
                                                      FFAppState().clientApiB =
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
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12.0,
                                                              height: 0.25,
                                                            ),
                                                            textAlign: TextAlign
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
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '91itryis' /* Reset filters */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.restart_alt,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 28.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final fixedColumnsVar =
                                                        _model.fixedColumns
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Container(
                                                        width: 300.0,
                                                        height: 68.0,
                                                        child: DataTable2(
                                                          columns: [
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'fpybr0sz' /* Inventory status */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 2,
                                                                    minFontSize:
                                                                        1.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '793l94ba' /* Order No. */,
                                                                    ),
                                                                    maxLines: 2,
                                                                    minFontSize:
                                                                        1.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ragnfncj' /* Client */,
                                                                    ),
                                                                    maxLines: 2,
                                                                    minFontSize:
                                                                        1.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          rows: fixedColumnsVar
                                                              .mapIndexed((fixedColumnsVarIndex,
                                                                      fixedColumnsVarItem) =>
                                                                  [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          fixedColumnsVarItem
                                                                              .invStatus,
                                                                          '/',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          fixedColumnsVarItem
                                                                              .orderNo,
                                                                          '/',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          fixedColumnsVarItem
                                                                              .client,
                                                                          '/',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              20,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .map((c) =>
                                                                          DataCell(
                                                                              c))
                                                                      .toList())
                                                              .map((e) =>
                                                                  DataRow(
                                                                      cells: e))
                                                              .toList(),
                                                          headingRowColor:
                                                              WidgetStateProperty
                                                                  .all(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                          ),
                                                          headingRowHeight:
                                                              40.0,
                                                          dataRowColor:
                                                              WidgetStateProperty
                                                                  .all(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          dataRowHeight: 28.0,
                                                          border: TableBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          dividerThickness: 2.0,
                                                          columnSpacing: 0.0,
                                                          showBottomBorder:
                                                              true,
                                                          minWidth: 49.0,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 210.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.warehouseB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .warehouseDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: FFAppState()
                                                                  .warehouseList,
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.warehouseDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'z6kin5ny' /* Warehouse... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .warehouseDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.orderNoB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .orderNoTFTextController,
                                                                focusNode: _model
                                                                    .orderNoTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    't14hhudl' /* Order no */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .orderNoTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .orderNoTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 150.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.clientB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 150.0,
                                                              height: 48.0,
                                                              child:
                                                                  custom_widgets
                                                                      .ClientTFDD(
                                                                width: 150.0,
                                                                height: 48.0,
                                                                clientList:
                                                                    FFAppState()
                                                                        .clientList,
                                                                action:
                                                                    () async {
                                                                  FFAppState()
                                                                          .clientApiB =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  await action_blocks
                                                                      .clientApiAction(
                                                                          context);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                resetAction:
                                                                    () async {
                                                                  FFAppState()
                                                                          .clientApiB =
                                                                      false;
                                                                  FFAppState()
                                                                      .clientApiId = '';
                                                                  FFAppState()
                                                                      .clientApiV = '';
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                        .clientApiB =
                                                                    false;
                                                                FFAppState()
                                                                    .clientApiV = '';
                                                                FFAppState()
                                                                    .clientApiId = '';
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        _model.orderStatusB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .orderStatusDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'bro4fnz4' /* novo naročilo */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qvrflcba' /* priprava */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '1j4tlqvy' /* izvajanje */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'e8oggj7g' /* zaključeno */,
                                                                )
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.orderStatusDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '8nsyuubu' /* Order status... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .orderStatusDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        160.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.flowB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .flowDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9k268aaj' /* in */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'atultzrw' /* out */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '6sa5yw3i' /* / */,
                                                                )
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.flowDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'mhbe33km' /* Flow... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .flowDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        _model.dateArrivalB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final _datePicked1Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              DateTime(1900),
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                          builder:
                                                                              (context, child) {
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

                                                                        if (_datePicked1Date !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                DateTime(
                                                                              _datePicked1Date.year,
                                                                              _datePicked1Date.month,
                                                                              _datePicked1Date.day,
                                                                            );
                                                                          });
                                                                        } else if (_model.datePicked1 !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                getCurrentTimestamp;
                                                                          });
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            _model.datePicked1 != null
                                                                                ? valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "d/M",
                                                                                      _model.datePicked1,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    'd1',
                                                                                  )
                                                                                : 'd1',
                                                                            'd1',
                                                                          ),
                                                                          minFontSize:
                                                                              6.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'oz83wu3b' /*  :  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final _datePicked2Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              DateTime(1900),
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                          builder:
                                                                              (context, child) {
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

                                                                        if (_datePicked2Date !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked2 =
                                                                                DateTime(
                                                                              _datePicked2Date.year,
                                                                              _datePicked2Date.month,
                                                                              _datePicked2Date.day,
                                                                            );
                                                                          });
                                                                        } else if (_model.datePicked2 !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked2 =
                                                                                getCurrentTimestamp;
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            _model.datePicked2 != null
                                                                                ? valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "d/M",
                                                                                      _model.datePicked2,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    'd2',
                                                                                  )
                                                                                : 'd2',
                                                                            'd2',
                                                                          ),
                                                                          minFontSize:
                                                                              6.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.restart_alt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        182.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.licenceB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .licenceTFTextController,
                                                                focusNode: _model
                                                                    .licenceTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '31a0tduz' /* Licence */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .licenceTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .licenceTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        56.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        _model.improvementB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .improvementDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '1wf426a5' /* kont.-20" */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'c3pssq17' /* kont.-40" */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '35njsoh5' /* kont.-45" */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '4sekid6j' /* cerada */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  't9hc0b5f' /* hladilnik */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3sxi518z' /* silos */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vlchl4eg' /* / */,
                                                                )
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.improvementDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7e6fh3im' /* Improvement */,
                                                              ),
                                                              searchHintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '2gkrhee6' /* Search for an item... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .improvementDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        40.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.containerB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .containerNoTFTextController,
                                                                focusNode: _model
                                                                    .containerNoTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'esgnf4ug' /* Container no */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .containerNoTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .containerNoTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        150.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.rampaB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .rampaTFTextController,
                                                                focusNode: _model
                                                                    .rampaTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'b78itnx2' /* Ramp */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .rampaTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .rampaTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        120.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.loadRefDvhB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .loadRefDvhTFTextController,
                                                                focusNode: _model
                                                                    .loadRefDvhTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'crv76qym' /* Load ref dvh */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .loadRefDvhTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .loadRefDvhTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.quantityB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.q1TFTextController,
                                                                            focusNode:
                                                                                _model.q1TFFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '13ksyjsf' /* Q1 */,
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
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            validator:
                                                                                _model.q1TFTextControllerValidator.asValidator(context),
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow(RegExp('^-?\\d+\$'))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'v66fmowi' /*  :  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.q2TFTextController,
                                                                            focusNode:
                                                                                _model.q2TFFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                'u0a99ktw' /* Q2 */,
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
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            validator:
                                                                                _model.q2TFTextControllerValidator.asValidator(context),
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
                                                              Icons
                                                                  .keyboard_double_arrow_down,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.packagingB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .packagingDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: FFAppState()
                                                                  .packagingList,
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.packagingDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '6xzvhd5f' /* Packaging... */,
                                                              ),
                                                              searchHintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7ob2a9ss' /* Search for an item... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .packagingDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        148.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.customB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .customDDValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options:
                                                                  FFAppState()
                                                                      .customList,
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.customDDValue =
                                                                          val),
                                                              width: 100.0,
                                                              height: 50.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'r4ttalz8' /* Custom... */,
                                                              ),
                                                              searchHintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '4pj365he' /* Search for an item... */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .customDDValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        360.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model.intCustomB,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .intCustomTFTextController,
                                                                focusNode: _model
                                                                    .intCustomTFFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'qvk5jx1r' /* Int custom */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .intCustomTFTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .intCustomTFTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .restart_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final warehouse2V = FFAppState()
                                                  .orderWarehouseAS
                                                  .toList();

                                              return FlutterFlowDataTable<
                                                  OrderWarehouseRowStruct>(
                                                controller: _model
                                                    .paginatedDataTableController,
                                                data: warehouse2V,
                                                columnsBuilder:
                                                    (onSortChanged) => [
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3yqz4p50' /* Edit */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 40.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'nz9524ak' /* Copy */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 40.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0epfhvwi' /* Print */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 40.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ekjkfh1o' /* Details */,
                                                          ),
                                                          maxLines: 1,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 56.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'hkhvwlax' /* Warehouse */,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .warehouseB) {
                                                                      _model.warehouseB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.warehouseB =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: _model.warehouseB
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'tqt0eper' /* Order No. */,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .orderNoB) {
                                                                      _model.orderNoB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.orderNoB =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: _model.orderNoB
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'd44sn4k3' /* Client */,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .clientB) {
                                                                      _model.clientB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.clientB =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: _model.clientB
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'c65fsm2p' /* Order status */,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .orderStatusB) {
                                                                      _model.orderStatusB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.orderStatusB =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: _model.orderStatusB
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '95c1guqt' /* Accept */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 50.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xh8akft5' /* Pre-Check */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 50.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'u4cf73iv' /* Check */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 40.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '300djcxc' /* Flow */,
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                          minFontSize:
                                                                              1.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .flowB) {
                                                                        _model.flowB =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.flowB =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .filter_list,
                                                                      color: _model.flowB
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      size:
                                                                          16.0,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '0d2sas7m' /* Arrival date */,
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                          minFontSize:
                                                                              1.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                          .dateArrivalB) {
                                                                        _model.dateArrivalB =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.dateArrivalB =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .filter_list,
                                                                      color: _model.dateArrivalB
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      size:
                                                                          16.0,
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
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5ysxyora' /* Time (Approx.) */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 150.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'agwkrr0h' /* Licence */,
                                                              ),
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .licenceB) {
                                                                _model.licenceB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.licenceB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .licenceB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    fixedWidth: 160.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'tuc8rkmb' /* Improvement */,
                                                              ),
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .improvementB) {
                                                                _model.improvementB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.improvementB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .improvementB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    fixedWidth: 150.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vb1ea58a' /* Container No. */,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            1.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (_model
                                                                        .containerB) {
                                                                      _model.containerB =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.containerB =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: _model.containerB
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 160.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fjjmh97p' /* Arrival */,
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'me92z6p6' /* Loading Gate */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .rampaB) {
                                                                _model.rampaB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.rampaB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .rampaB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xhhb6x3t' /* Load sequence */,
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '8z5e1rsa' /* Load ref dvh */,
                                                              ),
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .loadRefDvhB) {
                                                                _model.loadRefDvhB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.loadRefDvhB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .loadRefDvhB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              'Quantity (${(valueOrDefault<int>(
                                                                    functions.sumList(warehouse2V
                                                                        .where((e) =>
                                                                            e.flow ==
                                                                            'in')
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.quantity)
                                                                        .toList()),
                                                                    0,
                                                                  ) - valueOrDefault<int>(
                                                                    functions.sumList(warehouse2V
                                                                        .where((e) =>
                                                                            e.flow ==
                                                                            'out')
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.quantity)
                                                                        .toList()),
                                                                    0,
                                                                  )).toString()})',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .quantityB) {
                                                                _model.quantityB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.quantityB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .quantityB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    fixedWidth: 140.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ip3vuyir' /* Packaging */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .packagingB) {
                                                                _model.packagingB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.packagingB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .packagingB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '9fz16ucw' /* Weight */,
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    fixedWidth: 140.0,
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dlz0f15v' /* Custom */,
                                                              ),
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .customB) {
                                                                _model.customB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.customB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .customB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rfp36rji' /* Comment */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zfam4qo2' /* Documents */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '55h6r8x9' /* Admin */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'xz4dl6v2' /* Int custom */,
                                                              ),
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .intCustomB) {
                                                                _model.intCustomB =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.intCustomB =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.filter_list,
                                                              color: _model
                                                                      .intCustomB
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                dataRowBuilder:
                                                    (warehouse2VItem,
                                                            warehouse2VIndex,
                                                            selected,
                                                            onSelectChanged) =>
                                                        DataRow(
                                                  color:
                                                      WidgetStateProperty.all(
                                                    warehouse2VIndex % 2 == 0
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                  ),
                                                  cells: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .goodDescriptionList = [];
                                                            FFAppState()
                                                                .clientList = [];
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .clientApiB =
                                                                false;
                                                            FFAppState()
                                                                    .clientApiId =
                                                                warehouse2VItem
                                                                    .client;
                                                            FFAppState()
                                                                    .goodDescriptionApiId =
                                                                warehouse2VItem
                                                                    .goodDescription;
                                                            FFAppState()
                                                                    .goodDescriptionApiV =
                                                                warehouse2VItem
                                                                    .opisBlaga;
                                                            FFAppState()
                                                                    .clientApiV =
                                                                warehouse2VItem
                                                                    .clientName;
                                                            FFAppState()
                                                                .addToGoodDescriptionList(
                                                                    GoodDescriptionRowStruct(
                                                              id: warehouse2VItem
                                                                  .goodDescription,
                                                              opisBlaga:
                                                                  warehouse2VItem
                                                                      .opisBlaga,
                                                            ));
                                                            FFAppState()
                                                                .addToClientList(
                                                                    ClientRowStruct(
                                                              id: warehouse2VItem
                                                                  .client,
                                                              client:
                                                                  warehouse2VItem
                                                                      .clientName,
                                                            ));
                                                            safeSetState(() {});
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        FormsWidget(
                                                                      orderId:
                                                                          warehouse2VItem
                                                                              .id,
                                                                      associatedOrder:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        warehouse2VItem
                                                                            .associatedOrder,
                                                                        '/',
                                                                      ),
                                                                      flow: warehouse2VItem
                                                                          .flow,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.edit_square,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        AssociateQueryWidget(
                                                                      yesP:
                                                                          () async {
                                                                        _model.insertedW2Row =
                                                                            await OrderLevelTable().insert({
                                                                          'order_no':
                                                                              valueOrDefault<String>(
                                                                            warehouse2VItem.orderNo.substring(0,
                                                                                warehouse2VItem.orderNo.length - 3),
                                                                            '/',
                                                                          ),
                                                                          'quantity':
                                                                              1,
                                                                          'pallet_position':
                                                                              warehouse2VItem.palletPosition,
                                                                          'unit':
                                                                              warehouse2VItem.details,
                                                                          'weight':
                                                                              warehouse2VItem.weight,
                                                                          'good':
                                                                              warehouse2VItem.good,
                                                                          'good_description':
                                                                              warehouse2VItem.goodDescription,
                                                                          'packaging':
                                                                              warehouse2VItem.packaging,
                                                                          'barcodes':
                                                                              FFAppState().emptyList,
                                                                          'no_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'received_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'repeated_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'container_no':
                                                                              warehouse2VItem.containerNo,
                                                                          'client':
                                                                              warehouse2VItem.client,
                                                                          'inv_status':
                                                                              'najava',
                                                                          'order_status':
                                                                              'novo naročilo',
                                                                          'admin':
                                                                              currentUserUid,
                                                                          'warehouse':
                                                                              warehouse2VItem.warehouse,
                                                                          'fms_ref':
                                                                              warehouse2VItem.fmsRef,
                                                                          'load_ref_dvh':
                                                                              warehouse2VItem.loadRefDvh,
                                                                          'universal_ref_no':
                                                                              warehouse2VItem.universalRefNo,
                                                                          'documents':
                                                                              FFAppState().emptyList,
                                                                          'flow':
                                                                              'out',
                                                                          'eta_i':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'eta_f':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'arrival':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'start':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'stop':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'custom':
                                                                              warehouse2VItem.custom,
                                                                          'associated_order':
                                                                              warehouse2VItem.id,
                                                                          'internal_ref_custom':
                                                                              '',
                                                                          'init_cost':
                                                                              0.0,
                                                                          'customs_percentage':
                                                                              0.0,
                                                                          'exchange_rate_used':
                                                                              0.0,
                                                                          'exchanged_cost':
                                                                              0.0,
                                                                          'value_per_unit':
                                                                              0.0,
                                                                          'custom_percentage_per_cost':
                                                                              0.0,
                                                                          'acumulated_customs_percentages':
                                                                              0.0,
                                                                          'current_customs_warranty':
                                                                              0.0,
                                                                          'remaining_customs_threshold':
                                                                              0.0,
                                                                          'dolars':
                                                                              0.0,
                                                                          'euros':
                                                                              0.0,
                                                                          'weight_balance':
                                                                              0.0,
                                                                        });
                                                                        _model.refreshRowW2OP = await TablesGroup
                                                                            .refreshOrderLevelCalculatedColumnsCall
                                                                            .call(
                                                                          rowId: _model
                                                                              .insertedW2Row
                                                                              ?.id,
                                                                          userToken:
                                                                              currentJwtToken,
                                                                        );

                                                                        if (!(_model.refreshRowW2OP?.succeeded ??
                                                                            true)) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Refresh row error.',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                      noP:
                                                                          () async {
                                                                        _model.insertedRowW22OP =
                                                                            await OrderLevelTable().insert({
                                                                          'order_no':
                                                                              valueOrDefault<String>(
                                                                            warehouse2VItem.orderNo.substring(0,
                                                                                warehouse2VItem.orderNo.length - 3),
                                                                            '/',
                                                                          ),
                                                                          'quantity':
                                                                              1,
                                                                          'pallet_position':
                                                                              warehouse2VItem.palletPosition,
                                                                          'unit':
                                                                              warehouse2VItem.details,
                                                                          'weight':
                                                                              warehouse2VItem.weight,
                                                                          'good':
                                                                              warehouse2VItem.good,
                                                                          'good_description':
                                                                              warehouse2VItem.goodDescription,
                                                                          'packaging':
                                                                              warehouse2VItem.packaging,
                                                                          'barcodes':
                                                                              FFAppState().emptyList,
                                                                          'no_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'received_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'repeated_barcodes':
                                                                              FFAppState().emptyList,
                                                                          'container_no':
                                                                              warehouse2VItem.containerNo,
                                                                          'client':
                                                                              warehouse2VItem.client,
                                                                          'inv_status':
                                                                              'najava',
                                                                          'order_status':
                                                                              'novo naročilo',
                                                                          'admin':
                                                                              currentUserUid,
                                                                          'warehouse':
                                                                              warehouse2VItem.warehouse,
                                                                          'fms_ref':
                                                                              warehouse2VItem.fmsRef,
                                                                          'load_ref_dvh':
                                                                              warehouse2VItem.loadRefDvh,
                                                                          'universal_ref_no':
                                                                              warehouse2VItem.universalRefNo,
                                                                          'documents':
                                                                              FFAppState().emptyList,
                                                                          'flow':
                                                                              'out',
                                                                          'eta_i':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'eta_f':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'arrival':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'start':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'stop':
                                                                              supaSerialize<PostgresTime>(PostgresTime(functions.stringToDateTime('00:00'))),
                                                                          'custom':
                                                                              warehouse2VItem.custom,
                                                                          'associated_order':
                                                                              '0e0c37f1-96bc-4cc2-a3f6-094e5e8f059b',
                                                                          'internal_ref_custom':
                                                                              '',
                                                                          'init_cost':
                                                                              0.0,
                                                                          'customs_percentage':
                                                                              0.0,
                                                                          'exchanged_cost':
                                                                              0.0,
                                                                          'exchange_rate_used':
                                                                              0.0,
                                                                          'value_per_unit':
                                                                              0.0,
                                                                          'custom_percentage_per_cost':
                                                                              0.0,
                                                                          'acumulated_customs_percentages':
                                                                              0.0,
                                                                          'current_customs_warranty':
                                                                              0.0,
                                                                          'remaining_customs_threshold':
                                                                              0.0,
                                                                          'dolars':
                                                                              0.0,
                                                                          'euros':
                                                                              0.0,
                                                                          'weight_balance':
                                                                              0.0,
                                                                        });
                                                                        _model.refreshRowW22OP = await TablesGroup
                                                                            .refreshOrderLevelCalculatedColumnsCall
                                                                            .call(
                                                                          rowId: _model
                                                                              .insertedRowW22OP
                                                                              ?.id,
                                                                          userToken:
                                                                              currentJwtToken,
                                                                        );

                                                                        if (!(_model.refreshRowW22OP?.succeeded ??
                                                                            true)) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Refresh row error.',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .content_copy_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FutureBuilder<
                                                          List<DetailsViewRow>>(
                                                        future:
                                                            DetailsViewTable()
                                                                .querySingleRow(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'order_id',
                                                            valueOrDefault<
                                                                String>(
                                                              warehouse2VItem
                                                                  .id,
                                                              '/',
                                                            ),
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<DetailsViewRow>
                                                              iconDetailsViewRowList =
                                                              snapshot.data!;

                                                          final iconDetailsViewRow =
                                                              iconDetailsViewRowList
                                                                      .isNotEmpty
                                                                  ? iconDetailsViewRowList
                                                                      .first
                                                                  : null;

                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await actions
                                                                  .createPdf(
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .warehouseName,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .flow,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .licencePlate,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .containerNo,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .item,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .opisBlaga,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .palletPosition
                                                                      .toString(),
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .weight
                                                                      .toString(),
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .universalRefNo,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .fmsRef,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .loadRefDvh,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .customName,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .damageMark,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .comment,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .loadingType,
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${valueOrDefault<String>(
                                                                    warehouse2VItem
                                                                        .responsibleName,
                                                                    '/',
                                                                  )} ${valueOrDefault<String>(
                                                                    warehouse2VItem
                                                                        .responsibleLastName,
                                                                    '/',
                                                                  )}',
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${valueOrDefault<String>(
                                                                    warehouse2VItem
                                                                        .assistant1Name,
                                                                    '/',
                                                                  )} ${valueOrDefault<String>(
                                                                    warehouse2VItem
                                                                        .assistant1LastName,
                                                                    '/',
                                                                  )}',
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .otherManipulation,
                                                                  '/',
                                                                ),
                                                                dateTimeFormat(
                                                                  "yMMMd",
                                                                  functions.parsePostgresTimestamp(
                                                                      warehouse2VItem
                                                                          .etaDate2),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .quantity
                                                                      .toString(),
                                                                  '/',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  iconDetailsViewRow
                                                                      ?.warehousePositionName,
                                                                  '/',
                                                                ),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .picture_as_pdf_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .clearDetailsViewCache();
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          DetailsWidget(
                                                                        orderId:
                                                                            valueOrDefault<String>(
                                                                          warehouse2VItem
                                                                              .id,
                                                                          '/',
                                                                        ),
                                                                        orderNo:
                                                                            valueOrDefault<String>(
                                                                          warehouse2VItem
                                                                              .orderNo,
                                                                          '/',
                                                                        ),
                                                                        warehouseIdDetails:
                                                                            valueOrDefault<String>(
                                                                          warehouse2VItem
                                                                              .warehouse,
                                                                          '/',
                                                                        ),
                                                                        flow: valueOrDefault<
                                                                            String>(
                                                                          warehouse2VItem
                                                                              .flow,
                                                                          '/',
                                                                        ),
                                                                        associatedOrder:
                                                                            valueOrDefault<String>(
                                                                          warehouse2VItem
                                                                              .associatedOrder,
                                                                          '/',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.more_vert,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: (warehouse2VItem
                                                                        .noBarcodes
                                                                        .length >
                                                                    0) ||
                                                                (warehouse2VItem
                                                                        .repeatedBarcodes
                                                                        .length >
                                                                    0),
                                                            child: Icon(
                                                              Icons
                                                                  .warning_rounded,
                                                              color: Color(
                                                                  0xFFF79705),
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .warehouseName,
                                                                '/',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              minFontSize: 6.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .orderNo,
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 12,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              minFontSize: 6.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: warehouse2VItem
                                                                          .orderNo));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .clientName,
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 12,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              minFontSize: 6.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .orderStatus,
                                                                '/',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          if (!warehouse2VItem
                                                              .acepted)
                                                            Icon(
                                                              Icons
                                                                  .close_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (warehouse2VItem
                                                              .acepted)
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          if (!warehouse2VItem
                                                              .precheck)
                                                            Icon(
                                                              Icons
                                                                  .close_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (warehouse2VItem
                                                              .precheck)
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          if (!warehouse2VItem
                                                              .checked)
                                                            Icon(
                                                              Icons
                                                                  .close_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (warehouse2VItem
                                                              .checked)
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .flow,
                                                                '/',
                                                              ),
                                                              minFontSize: 6.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "yMMMd",
                                                              functions.parsePostgresTimestamp(
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .etaDate2,
                                                                '/',
                                                              )),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '/',
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            '${valueOrDefault<String>(
                                                              dateTimeFormat(
                                                                "Hm",
                                                                functions.parsePostgresTimestamp(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .etaI2,
                                                                  '/',
                                                                )),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              '/',
                                                            )} - ${valueOrDefault<String>(
                                                              dateTimeFormat(
                                                                "Hm",
                                                                functions.parsePostgresTimestamp(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .etaF2,
                                                                  '/',
                                                                )),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              '/',
                                                            )}',
                                                            '/',
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .licencePlate,
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 20,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 6.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .licencePlate,
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            warehouse2VItem
                                                                .improvement,
                                                            '/',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onDoubleTap:
                                                                  () async {
                                                                _model.fixedColumns =
                                                                    [];
                                                                safeSetState(
                                                                    () {});
                                                                _model.selectedIndexID =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .id,
                                                                  '0',
                                                                );
                                                                _model.addToFixedColumns(
                                                                    FixedColumnsStruct(
                                                                  invStatus:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    warehouse2VItem
                                                                        .invStatus,
                                                                    '/',
                                                                  ),
                                                                  orderNo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    warehouse2VItem
                                                                        .orderNo,
                                                                    '/',
                                                                  ),
                                                                  client:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    warehouse2VItem
                                                                        .clientName,
                                                                    '/',
                                                                  ),
                                                                ));
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  warehouse2VItem
                                                                      .containerNo,
                                                                  '/',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 20,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 2,
                                                                minFontSize:
                                                                    1.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        warehouse2VItem.id ==
                                                                                _model.selectedIndexID
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .containerNo,
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              functions.parsePostgresTimestamp(
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .arrival2,
                                                                '/',
                                                              )),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '/',
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onDoubleTap: () async {
                                                        _model.fixedColumns =
                                                            [];
                                                        safeSetState(() {});
                                                        _model.selectedIndexID =
                                                            valueOrDefault<
                                                                String>(
                                                          warehouse2VItem.id,
                                                          '0',
                                                        );
                                                        _model.addToFixedColumns(
                                                            FixedColumnsStruct(
                                                          invStatus:
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem
                                                                .invStatus,
                                                            '/',
                                                          ),
                                                          orderNo:
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem
                                                                .orderNo,
                                                            '/',
                                                          ),
                                                          client:
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem
                                                                .clientName,
                                                            '/',
                                                          ),
                                                        ));
                                                        safeSetState(() {});
                                                      },
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          warehouse2VItem
                                                              .loadingGateRamp,
                                                          '/',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        minFontSize: 1.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    warehouse2VItem.id ==
                                                                            _model
                                                                                .selectedIndexID
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .loadingSequence
                                                                    .toString(),
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 10,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .loadingSequence
                                                                    .toString(),
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .loadRefDvh,
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 10,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .loadRefDvh,
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            warehouse2VItem
                                                                        .flow ==
                                                                    'out'
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    '-${warehouse2VItem.quantity.toString()}',
                                                                    '0',
                                                                  )
                                                                : valueOrDefault<
                                                                    String>(
                                                                    warehouse2VItem
                                                                        .quantity
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                            '/',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            warehouse2VItem
                                                                .packagingName,
                                                            '/',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 72.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onDoubleTap:
                                                                    () async {
                                                                  _model.fixedColumns =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.selectedIndexID =
                                                                      valueOrDefault<
                                                                          String>(
                                                                    warehouse2VItem
                                                                        .id,
                                                                    '0',
                                                                  );
                                                                  _model.addToFixedColumns(
                                                                      FixedColumnsStruct(
                                                                    invStatus:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      warehouse2VItem
                                                                          .invStatus,
                                                                      '/',
                                                                    ),
                                                                    orderNo:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      warehouse2VItem
                                                                          .orderNo,
                                                                      '/',
                                                                    ),
                                                                    client: valueOrDefault<
                                                                        String>(
                                                                      warehouse2VItem
                                                                          .clientName,
                                                                      '/',
                                                                    ),
                                                                  ));
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    warehouse2VItem
                                                                        .weight
                                                                        .toString(),
                                                                    '-1',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        10,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  maxLines: 2,
                                                                  minFontSize:
                                                                      1.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          warehouse2VItem.id == _model.selectedIndexID
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .weight
                                                                    .toString(),
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            warehouse2VItem
                                                                .customName,
                                                            '/',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 10,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          minFontSize: 1.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              _model.fixedColumns =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedIndexID =
                                                                  valueOrDefault<
                                                                      String>(
                                                                warehouse2VItem
                                                                    .id,
                                                                '0',
                                                              );
                                                              _model.addToFixedColumns(
                                                                  FixedColumnsStruct(
                                                                invStatus:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .invStatus,
                                                                  '/',
                                                                ),
                                                                orderNo:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .orderNo,
                                                                  '/',
                                                                ),
                                                                client:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  warehouse2VItem
                                                                      .clientName,
                                                                  '/',
                                                                ),
                                                              ));
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                warehouse2VItem
                                                                    .comment,
                                                                '/',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 10,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 1.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      warehouse2VItem.id ==
                                                                              _model
                                                                                  .selectedIndexID
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                warehouse2VItem
                                                                    .comment,
                                                                '/',
                                                              )));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            DocumentsWidget(
                                                                          orderId:
                                                                              valueOrDefault<String>(
                                                                            warehouse2VItem.id,
                                                                            '/',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .picture_as_pdf_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              warehouse2VItem
                                                                  .documents
                                                                  .length
                                                                  .toString(),
                                                              '/',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    warehouse2VItem.id ==
                                                                            _model
                                                                                .selectedIndexID
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            '${valueOrDefault<String>(
                                                              warehouse2VItem
                                                                  .adminName,
                                                              '/',
                                                            )} ${valueOrDefault<String>(
                                                              warehouse2VItem
                                                                  .adminLastName,
                                                              '/',
                                                            )}',
                                                            '/',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          minFontSize: 6.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onDoubleTap: () async {
                                                          _model.fixedColumns =
                                                              [];
                                                          safeSetState(() {});
                                                          _model.selectedIndexID =
                                                              valueOrDefault<
                                                                  String>(
                                                            warehouse2VItem.id,
                                                            '0',
                                                          );
                                                          _model.addToFixedColumns(
                                                              FixedColumnsStruct(
                                                            invStatus:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .invStatus,
                                                              '/',
                                                            ),
                                                            orderNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .orderNo,
                                                              '/',
                                                            ),
                                                            client:
                                                                valueOrDefault<
                                                                    String>(
                                                              warehouse2VItem
                                                                  .clientName,
                                                              '/',
                                                            ),
                                                          ));
                                                          safeSetState(() {});
                                                        },
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            warehouse2VItem
                                                                .internalRefCustom,
                                                            '/',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 12,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  warehouse2VItem
                                                                              .id ==
                                                                          _model
                                                                              .selectedIndexID
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                      .map((c) => DataCell(c))
                                                      .toList(),
                                                ),
                                                paginated: true,
                                                selectable: false,
                                                hidePaginator: false,
                                                showFirstLastButtons: true,
                                                width: 3100.0,
                                                height: _model.warehouseB ||
                                                        _model.orderNoB ||
                                                        _model.clientB ||
                                                        _model.orderStatusB ||
                                                        _model.flowB ||
                                                        _model.containerB ||
                                                        _model.dateArrivalB ||
                                                        _model.intCustomB ||
                                                        _model.licenceB ||
                                                        _model.improvementB ||
                                                        _model.loadRefDvhB ||
                                                        _model.quantityB ||
                                                        _model.customB ||
                                                        _model.rampaB
                                                    ? (MediaQuery.sizeOf(
                                                                context)
                                                            .height -
                                                        260)
                                                    : (MediaQuery.sizeOf(
                                                                context)
                                                            .height -
                                                        222),
                                                headingRowHeight: 56.0,
                                                dataRowHeight: 24.0,
                                                columnSpacing: 8.0,
                                                headingRowColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                addHorizontalDivider: true,
                                                addTopAndBottomDivider: false,
                                                hideDefaultHorizontalDivider:
                                                    false,
                                                horizontalDividerColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                horizontalDividerThickness: 1.0,
                                                addVerticalDivider: true,
                                                verticalDividerColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                verticalDividerThickness: 1.0,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 28.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                      children: [
                                        if (_model.rowPerPageB)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 24.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model
                                                    .paginatedDataTableController
                                                    .paginatorController
                                                    .setRowsPerPage(25);
                                                _model.rowPerPageB = false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/twenty-five.png',
                                                  width: 36.0,
                                                  height: 36.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (!_model.rowPerPageB)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 24.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model
                                                    .paginatedDataTableController
                                                    .paginatorController
                                                    .setRowsPerPage(10);
                                                _model.rowPerPageB = true;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/number-10.png',
                                                  width: 36.0,
                                                  height: 36.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().goodDescriptionList = [];
                                          FFAppState().goodDescriptionApiV = '';
                                          FFAppState().goodDescriptionApiId =
                                              '';
                                          FFAppState().clientList = [];
                                          FFAppState().clientApiId = '';
                                          FFAppState().clientApiV = '';
                                          safeSetState(() {});
                                          FFAppState().addToGoodDescriptionList(
                                              GoodDescriptionRowStruct(
                                            id: '53a4144c-c413-4cb4-a951-b9c90ac94481',
                                            opisBlaga: '/',
                                          ));
                                          FFAppState()
                                              .addToClientList(ClientRowStruct(
                                            id: '6f75cdd4-2581-48bb-b97e-443d506bfb63',
                                            client: '/',
                                          ));
                                          FFAppState().goodDescriptionApiV =
                                              '/';
                                          FFAppState().goodDescriptionApiId =
                                              '53a4144c-c413-4cb4-a951-b9c90ac94481';
                                          FFAppState().clientApiV = '/';
                                          FFAppState().clientApiId =
                                              '6f75cdd4-2581-48bb-b97e-443d506bfb63';
                                          safeSetState(() {});
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: CreateRecordWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3ndo5buw' /* Create new record */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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

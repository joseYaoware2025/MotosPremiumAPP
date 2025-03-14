import '';
import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'detalles_cuenta_model.dart';
export 'detalles_cuenta_model.dart';

class DetallesCuentaWidget extends StatefulWidget {
  const DetallesCuentaWidget({super.key});

  static String routeName = 'DetallesCuenta';
  static String routePath = '/detallesCuenta';

  @override
  State<DetallesCuentaWidget> createState() => _DetallesCuentaWidgetState();
}

class _DetallesCuentaWidgetState extends State<DetallesCuentaWidget> {
  late DetallesCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesCuentaModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFC82D2D)),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.white,
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(
                CuentaWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Stack(
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future:
                              WooCommerceAPIGroup.obtenerDatosCustomerCall.call(
                            idCustomer: FFAppState().idCustomerTemporal,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: SpinKitFadingGrid(
                                    color: Color(0xFF29ABE2),
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }
                            final columnObtenerDatosCustomerResponse =
                                snapshot.data!;

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Detalles de la cuenta',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 10.0),
                                    child: wrapWithModel(
                                      model: _model.divisorModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: DivisorWidget(
                                        fondo: 'blanco',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Nombre',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController1 ??=
                                            TextEditingController(
                                          text: WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .nombre(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .nombre(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      ''
                                              ? WooCommerceAPIGroup
                                                  .obtenerDatosCustomerCall
                                                  .nombre(
                                                  columnObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                )
                                              : '',
                                        ),
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Apellidos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController2 ??=
                                            TextEditingController(
                                          text: WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .apellidos(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .apellidos(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      ''
                                              ? WooCommerceAPIGroup
                                                  .obtenerDatosCustomerCall
                                                  .apellidos(
                                                  columnObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                )
                                              : '',
                                        ),
                                        focusNode: _model.textFieldFocusNode2,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController2Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Dirección de correo electrónico',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController3 ??=
                                            TextEditingController(
                                          text: WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .email(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  WooCommerceAPIGroup
                                                          .obtenerDatosCustomerCall
                                                          .email(
                                                        columnObtenerDatosCustomerResponse
                                                            .jsonBody,
                                                      ) !=
                                                      ''
                                              ? WooCommerceAPIGroup
                                                  .obtenerDatosCustomerCall
                                                  .email(
                                                  columnObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                )
                                              : '',
                                        ),
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.correoInvalido ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.correoInvalido ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.correoInvalido ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.correoInvalido ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController3Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (_model.correoInvalido == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Correo electrónico no valido',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFFF0000),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Contraseña actual',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController4,
                                        focusNode: _model.textFieldFocusNode4,
                                        autofocus: false,
                                        obscureText:
                                            !_model.passwordVisibility1,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.validarContrasea ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.validarContrasea ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.validarContrasea ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.validarContrasea ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          suffixIcon: InkWell(
                                            onTap: () => safeSetState(
                                              () => _model.passwordVisibility1 =
                                                  !_model.passwordVisibility1,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility1
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController4Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (_model.validarContrasea == false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Contraseña no valida',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFFF0000),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Nueva contraseña',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController5,
                                        focusNode: _model.textFieldFocusNode5,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController5',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.contrasenaValida = functions
                                                .validarContrasea(
                                                    _model.textController5.text)
                                                .toList()
                                                .cast<bool>();
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText:
                                            !_model.passwordVisibility2,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          suffixIcon: InkWell(
                                            onTap: () => safeSetState(
                                              () => _model.passwordVisibility2 =
                                                  !_model.passwordVisibility2,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility2
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController5Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (_model.textController5.text != '')
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Mínimo 8 caracteres',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: _model
                                                                    .contrasenaValida
                                                                    .elementAtOrNull(
                                                                        0) ==
                                                                true
                                                            ? Color(0xFF52D742)
                                                            : Color(0xFFFF0000),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Contiene mayúsculas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: _model
                                                                    .contrasenaValida
                                                                    .elementAtOrNull(
                                                                        1) ==
                                                                true
                                                            ? Color(0xFF52D742)
                                                            : Color(0xFFFF0000),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Contiene minúsculas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: _model
                                                                    .contrasenaValida
                                                                    .elementAtOrNull(
                                                                        2) ==
                                                                true
                                                            ? Color(0xFF52D742)
                                                            : Color(0xFFFF0000),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Contiene números',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: _model
                                                                    .contrasenaValida
                                                                    .elementAtOrNull(
                                                                        3) ==
                                                                true
                                                            ? Color(0xFF52D742)
                                                            : Color(0xFFFF0000),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Confirmar nueva contraseña',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController6,
                                        focusNode: _model.textFieldFocusNode6,
                                        autofocus: false,
                                        obscureText:
                                            !_model.passwordVisibility3,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  _model.verificarContraseas ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  _model.verificarContraseas ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          suffixIcon: InkWell(
                                            onTap: () => safeSetState(
                                              () => _model.passwordVisibility3 =
                                                  !_model.passwordVisibility3,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility3
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        validator: _model
                                            .textController6Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (_model.verificarContraseas == false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 0.0, 70.0),
                                      child: Text(
                                        'La nueva contraseña no coincide',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFFF0000),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.textController4.text != '') {
                                  if (_model.textController4.text ==
                                      FFAppState().passwordAutenticacion) {
                                    _model.validarContrasea = true;
                                    safeSetState(() {});
                                    if ((_model.contrasenaValida
                                                .elementAtOrNull(0) ==
                                            true) &&
                                        (_model.contrasenaValida
                                                .elementAtOrNull(1) ==
                                            true) &&
                                        (_model.contrasenaValida
                                                .elementAtOrNull(2) ==
                                            true) &&
                                        (_model.contrasenaValida
                                                .elementAtOrNull(3) ==
                                            true)) {
                                      if (_model.textController5.text ==
                                          _model.textController6.text) {
                                        _model.verificarContraseas = true;
                                        safeSetState(() {});
                                        _model.apiResultpzw =
                                            await WooCommerceAPIGroup
                                                .cambioContraseaCustomerCall
                                                .call(
                                          idCustomer: FFAppState()
                                              .idCustomerTemporal
                                              .toString(),
                                          contrasea:
                                              _model.textController5.text,
                                        );

                                        FFAppState().passwordAutenticacion =
                                            _model.textController5.text;
                                        safeSetState(() {});
                                        _model.apiResultz9e =
                                            await WooCommerceAPIGroup
                                                .modificarDatosCustomerCuentaCall
                                                .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                          nombre: _model.textController1.text,
                                          apellidos:
                                              _model.textController2.text,
                                        );

                                        _model.editarDireccionCorreo =
                                            await WooCommerceAPIGroup
                                                .editarDireccionCorreoCall
                                                .call(
                                          idCustomer: FFAppState()
                                              .idCustomerTemporal
                                              .toString(),
                                          email: _model.textController3.text,
                                        );

                                        if (WooCommerceAPIGroup
                                                .editarDireccionCorreoCall
                                                .mensaje(
                                              (_model.editarDireccionCorreo
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            'Email address is invalid.') {
                                          _model.correoInvalido = true;
                                          safeSetState(() {});
                                        } else if (WooCommerceAPIGroup
                                                .editarDireccionCorreoCall
                                                .mensaje(
                                              (_model.editarDireccionCorreo
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            'Parámetro(s) no válido(s): email') {
                                          _model.correoInvalido = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.correoInvalido = false;
                                          safeSetState(() {});

                                          context.pushNamed(
                                            CuentaWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );
                                        }
                                      } else {
                                        _model.verificarContraseas = false;
                                        safeSetState(() {});
                                      }
                                    }
                                  } else {
                                    _model.validarContrasea = false;
                                    safeSetState(() {});
                                  }
                                } else {
                                  await Future.wait([
                                    Future(() async {
                                      _model.actualizarDatosUsuario =
                                          await WooCommerceAPIGroup
                                              .modificarDatosCustomerCuentaCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                        nombre: _model.textController1.text,
                                        apellidos: _model.textController2.text,
                                      );
                                    }),
                                    Future(() async {
                                      _model.updateDireccionCorreo =
                                          await WooCommerceAPIGroup
                                              .editarDireccionCorreoCall
                                              .call(
                                        idCustomer: FFAppState()
                                            .idCustomerTemporal
                                            .toString(),
                                        email: _model.textController3.text,
                                      );

                                      if (WooCommerceAPIGroup
                                              .editarDireccionCorreoCall
                                              .mensaje(
                                            (_model.updateDireccionCorreo
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Email address is invalid.') {
                                        _model.correoInvalido = true;
                                        safeSetState(() {});
                                      } else if (WooCommerceAPIGroup
                                              .editarDireccionCorreoCall
                                              .mensaje(
                                            (_model.updateDireccionCorreo
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Parámetro(s) no válido(s): email') {
                                        _model.correoInvalido = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.correoInvalido = false;
                                        safeSetState(() {});

                                        context.pushNamed(
                                          CuentaWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      }
                                    }),
                                  ]);
                                }

                                safeSetState(() {});
                              },
                              text: 'Guardar cambios',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF29ABE2),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    pagina: 'cuenta',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

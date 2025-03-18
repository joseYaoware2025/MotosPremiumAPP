import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'inicio_sesion_model.dart';
export 'inicio_sesion_model.dart';

class InicioSesionWidget extends StatefulWidget {
  const InicioSesionWidget({super.key});

  static String routeName = 'InicioSesion';
  static String routePath = '/inicioSesion';

  @override
  State<InicioSesionWidget> createState() => _InicioSesionWidgetState();
}

class _InicioSesionWidgetState extends State<InicioSesionWidget> {
  late InicioSesionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioSesionModel());

    _model.textController1 ??= TextEditingController(
        text: FFAppState().usuarioAutenticacion != null &&
                FFAppState().usuarioAutenticacion != ''
            ? FFAppState().usuarioAutenticacion
            : '');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: FFAppState().estadoRecordarContrasea == true
            ? FFAppState().passwordAutenticacion
            : '');
    _model.textFieldFocusNode2 ??= FocusNode();
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
        backgroundColor: Colors.white,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/images.jpg',
                    width: valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 150.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 150.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 200.0;
                        } else {
                          return 200.0;
                        }
                      }(),
                      50.0,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Acceder',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Nombre de usuario o correo',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _model.errorUsuario == true
                                    ? Color(0xFFFF0000)
                                    : Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _model.errorUsuario == true
                                    ? Color(0xFFFF0000)
                                    : Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (_model.errorUsuario == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          'Usuario incorrecto',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFFF0000),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Contraseña',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          autofocus: false,
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _model.errorContrase == true
                                    ? Color(0xFFFF0000)
                                    : Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _model.errorContrase == true
                                    ? Color(0xFFFF0000)
                                    : Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            suffixIcon: InkWell(
                              onTap: () => safeSetState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.black,
                                size: 15.0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: Colors.black,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (_model.errorContrase == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          'Contraseña incorrecta',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFFF0000),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Colors.black,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue ??=
                                FFAppState().estadoRecordarContrasea == true,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                        ),
                        Text(
                          'Recordar contraseña',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.conexionInternet =
                            await ConexionInternetCall.call();

                        if ((_model.conexionInternet?.statusCode ?? 200) ==
                            200) {
                          if ((_model.textController1.text != null &&
                                  _model.textController1.text != '') &&
                              (_model.textController2.text != null &&
                                  _model.textController2.text != '')) {
                            if (FFAppState().token != null &&
                                FFAppState().token != '') {
                              _model.apiResult1mc = await JsonWebTokenAPIsGroup
                                  .obtenerTokenCall
                                  .call(
                                nombreUsuario: _model.textController1.text,
                                contrasea: _model.textController2.text,
                              );

                              if (functions.datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] invalid_username') {
                                _model.errorUsuario = true;
                                _model.errorContrase = false;
                                safeSetState(() {});
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] incorrect_password') {
                                _model.errorContrase = true;
                                _model.errorUsuario = false;
                                safeSetState(() {});
                              } else if ((functions
                                          .datosJsonaString(getJsonField(
                                        (_model.apiResult1mc?.jsonBody ?? ''),
                                        r'''$.code''',
                                      )) ==
                                      '[jwt_auth] invalid_username') &&
                                  (functions.datosJsonaString(getJsonField(
                                        (_model.apiResult1mc?.jsonBody ?? ''),
                                        r'''$.code''',
                                      )) ==
                                      '[jwt_auth] incorrect_password')) {
                                _model.errorUsuario = true;
                                _model.errorContrase = true;
                                safeSetState(() {});
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  'wp_die') {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: MensajeAlertaWidget(
                                            mensaje:
                                                'Ups! hubo un error, intentalo mas tarde',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] invalid_email') {
                                _model.errorUsuario = true;
                                _model.errorContrase = false;
                                safeSetState(() {});
                              } else {
                                if (functions.obtenerIdT(JsonWebTokenAPIsGroup
                                        .obtenerTokenCall
                                        .token(
                                      (_model.apiResult1mc?.jsonBody ?? ''),
                                    )!) ==
                                    FFAppState().idCustomerTemporal) {
                                  if (functions.verificarValidezToken(
                                      FFAppState().token)) {
                                    await Future.wait([
                                      Future(() async {
                                        FFAppState().usuarioAutenticacion =
                                            _model.textController1.text;
                                        FFAppState().passwordAutenticacion =
                                            _model.textController2.text;
                                        FFAppState().estadoRecordarContrasea =
                                            _model.checkboxValue!;
                                        FFAppState().idCustomerTemporal =
                                            functions
                                                .obtenerIdT(FFAppState().token);
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .estadoRecordarContrasea !=
                                            true) {
                                          FFAppState().passwordAutenticacion =
                                              '';
                                          safeSetState(() {});
                                        }
                                      }),
                                      Future(() async {
                                        _model.carritoInicio1 =
                                            await EndpointCustomGroup
                                                .obtenerCarritoCall
                                                .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                        );

                                        FFAppState().carrito =
                                            (_model.carritoInicio1?.jsonBody ??
                                                '');
                                        safeSetState(() {});
                                      }),
                                    ]);

                                    context.pushNamed(
                                      InicioWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.scale,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                      },
                                    );
                                  } else {
                                    await Future.wait([
                                      Future(() async {
                                        _model.jsonToken2 =
                                            await JsonWebTokenAPIsGroup
                                                .obtenerTokenCall
                                                .call(
                                          nombreUsuario:
                                              _model.textController1.text,
                                          contrasea:
                                              _model.textController2.text,
                                        );

                                        FFAppState().usuarioAutenticacion =
                                            _model.textController1.text;
                                        FFAppState().passwordAutenticacion =
                                            _model.textController2.text;
                                        FFAppState().estadoRecordarContrasea =
                                            _model.checkboxValue!;
                                        FFAppState().token = getJsonField(
                                          (_model.jsonToken2?.jsonBody ?? ''),
                                          r'''$.token''',
                                        ).toString();
                                        safeSetState(() {});
                                        FFAppState().idCustomerTemporal =
                                            functions
                                                .obtenerIdT(FFAppState().token);
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .estadoRecordarContrasea !=
                                            true) {
                                          FFAppState().passwordAutenticacion =
                                              '';
                                          safeSetState(() {});
                                        }
                                      }),
                                      Future(() async {
                                        _model.carritoInicio2 =
                                            await EndpointCustomGroup
                                                .obtenerCarritoCall
                                                .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                        );

                                        FFAppState().carrito =
                                            (_model.carritoInicio2?.jsonBody ??
                                                '');
                                        safeSetState(() {});
                                      }),
                                    ]);

                                    context.pushNamed(
                                      InicioWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.scale,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                      },
                                    );
                                  }
                                } else {
                                  await Future.wait([
                                    Future(() async {
                                      _model.jsonToken3 =
                                          await JsonWebTokenAPIsGroup
                                              .obtenerTokenCall
                                              .call(
                                        nombreUsuario:
                                            _model.textController1.text,
                                        contrasea: _model.textController2.text,
                                      );

                                      FFAppState().usuarioAutenticacion =
                                          _model.textController1.text;
                                      FFAppState().passwordAutenticacion =
                                          _model.textController2.text;
                                      FFAppState().estadoRecordarContrasea =
                                          _model.checkboxValue!;
                                      FFAppState().token = getJsonField(
                                        (_model.jsonToken3?.jsonBody ?? ''),
                                        r'''$.token''',
                                      ).toString();
                                      FFAppState()
                                              .validarLecturaAvisoPrivacidad =
                                          false;
                                      FFAppState()
                                              .validarLecturaPoliticasDevolucion =
                                          false;
                                      safeSetState(() {});
                                      FFAppState().idCustomerTemporal =
                                          functions
                                              .obtenerIdT(FFAppState().token);
                                      safeSetState(() {});
                                      if (FFAppState()
                                              .estadoRecordarContrasea !=
                                          true) {
                                        FFAppState().passwordAutenticacion = '';
                                        safeSetState(() {});
                                      }
                                    }),
                                    Future(() async {
                                      _model.carritoInicio3 =
                                          await EndpointCustomGroup
                                              .obtenerCarritoCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                      );

                                      FFAppState().carrito =
                                          (_model.carritoInicio3?.jsonBody ??
                                              '');
                                      safeSetState(() {});
                                    }),
                                  ]);

                                  context.pushNamed(
                                    InicioWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    },
                                  );
                                }
                              }
                            } else {
                              _model.jsonToken4 = await JsonWebTokenAPIsGroup
                                  .obtenerTokenCall
                                  .call(
                                nombreUsuario: _model.textController1.text,
                                contrasea: _model.textController2.text,
                              );

                              if (functions.datosJsonaString(getJsonField(
                                    (_model.jsonToken4?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] invalid_username') {
                                _model.errorUsuario = true;
                                _model.errorContrase = false;
                                safeSetState(() {});
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.jsonToken4?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] incorrect_password') {
                                _model.errorContrase = true;
                                _model.errorUsuario = false;
                                safeSetState(() {});
                              } else if ((functions
                                          .datosJsonaString(getJsonField(
                                        (_model.jsonToken4?.jsonBody ?? ''),
                                        r'''$.code''',
                                      )) ==
                                      '[jwt_auth] invalid_username') &&
                                  (functions.datosJsonaString(getJsonField(
                                        (_model.jsonToken4?.jsonBody ?? ''),
                                        r'''$.code''',
                                      )) ==
                                      '[jwt_auth] incorrect_password')) {
                                _model.errorUsuario = true;
                                _model.errorContrase = true;
                                safeSetState(() {});
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  'wp_die') {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: MensajeAlertaWidget(
                                            mensaje:
                                                'Ups! hubo un error, intentalo mas tarde',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (functions
                                      .datosJsonaString(getJsonField(
                                    (_model.apiResult1mc?.jsonBody ?? ''),
                                    r'''$.code''',
                                  )) ==
                                  '[jwt_auth] invalid_email') {
                                _model.errorUsuario = true;
                                _model.errorContrase = false;
                                safeSetState(() {});
                              } else {
                                await Future.wait([
                                  Future(() async {
                                    FFAppState().usuarioAutenticacion =
                                        _model.textController1.text;
                                    FFAppState().passwordAutenticacion =
                                        _model.textController2.text;
                                    FFAppState().estadoRecordarContrasea =
                                        _model.checkboxValue!;
                                    FFAppState().token = getJsonField(
                                      (_model.jsonToken4?.jsonBody ?? ''),
                                      r'''$.token''',
                                    ).toString();
                                    FFAppState().validarLecturaAvisoPrivacidad =
                                        false;
                                    FFAppState()
                                            .validarLecturaPoliticasDevolucion =
                                        false;
                                    safeSetState(() {});
                                    FFAppState().idCustomerTemporal = functions
                                        .obtenerIdT(FFAppState().token);
                                    safeSetState(() {});
                                    if (FFAppState().estadoRecordarContrasea !=
                                        true) {
                                      FFAppState().passwordAutenticacion = '';
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.carritoInicio4 =
                                        await EndpointCustomGroup
                                            .obtenerCarritoCall
                                            .call(
                                      idCustomer:
                                          FFAppState().idCustomerTemporal,
                                    );

                                    FFAppState().carrito =
                                        (_model.carritoInicio4?.jsonBody ?? '');
                                    safeSetState(() {});
                                  }),
                                ]);

                                context.pushNamed(
                                  InicioWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  },
                                );
                              }
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: MensajeAlertaWidget(
                                        mensaje:
                                            'Ingresa tu nombre de usuario y contraseña',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: MensajeAlertaWidget(
                                      mensaje:
                                          'Ups! parece que no hay internet, verifica tu conexión',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Iniciar Sesión',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 45.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFFFA100),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 1.0,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        RecuperarPasswordWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                    child: Text(
                      '¿Olvidaste la contraseña?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Text(
                          '¿Eres nuevo?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            RegistrarseWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        },
                        child: Text(
                          'Registrarse',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF29ABE2),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
    );
  }
}

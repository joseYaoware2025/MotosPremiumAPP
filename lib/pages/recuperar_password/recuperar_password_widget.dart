import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'recuperar_password_model.dart';
export 'recuperar_password_model.dart';

class RecuperarPasswordWidget extends StatefulWidget {
  const RecuperarPasswordWidget({super.key});

  static String routeName = 'RecuperarPassword';
  static String routePath = '/recuperarPassword';

  @override
  State<RecuperarPasswordWidget> createState() =>
      _RecuperarPasswordWidgetState();
}

class _RecuperarPasswordWidgetState extends State<RecuperarPasswordWidget> {
  late RecuperarPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecuperarPasswordModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
                InicioSesionWidget.routeName,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                child: Text(
                  '¿Perdiste tu contraseña? Por favor, introduce tu correo electrónico. Recibirás un enlace para crear una contraseña nueva por correo electrónico.',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Correo electrónico',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 30.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.correoElectronicoInvalido == false
                              ? FlutterFlowTheme.of(context).tertiary
                              : Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.correoElectronicoInvalido == false
                              ? FlutterFlowTheme.of(context).tertiary
                              : Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.correoElectronicoInvalido == false
                              ? FlutterFlowTheme.of(context).tertiary
                              : Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.correoElectronicoInvalido == false
                              ? FlutterFlowTheme.of(context).tertiary
                              : Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    cursorColor: Colors.black,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              if (_model.correoElectronicoInvalido == true)
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 0.0, 0.0),
                    child: Text(
                      'El correo electrónico no esta registrado',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFFF0000),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              if (_model.direccionEmailValida == false)
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 0.0, 0.0),
                    child: Text(
                      'Dirección de  correo electrónico no valida',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFFF0000),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.textController.text != null &&
                          _model.textController.text != '') {
                        if (functions.validarDireccionEmail(
                            _model.textController.text)) {
                          _model.verifiacacionCorreo = await WooCommerceAPIGroup
                              .verificarExistenciaCorreoCall
                              .call(
                            email: _model.textController.text,
                          );

                          _model.correoVeri =
                              (_model.verifiacacionCorreo?.jsonBody ?? '')
                                  .toList()
                                  .cast<dynamic>();
                          safeSetState(() {});
                          if (_model.correoVeri.length != 0) {
                            _model.correoElectronicoInvalido = false;
                            safeSetState(() {});
                            _model.respuestEnvioCorreo = await actions.envioE(
                              _model.textController.text,
                              'Recuperar contraseña',
                              valueOrDefault<String>(
                                WooCommerceAPIGroup
                                    .verificarExistenciaCorreoCall
                                    .nombre(
                                      (_model.verifiacacionCorreo?.jsonBody ??
                                          ''),
                                    )
                                    ?.firstOrNull,
                                'Usuario',
                              ),
                              valueOrDefault<String>(
                                WooCommerceAPIGroup
                                    .verificarExistenciaCorreoCall
                                    .username(
                                  (_model.verifiacacionCorreo?.jsonBody ?? ''),
                                ),
                                'Username',
                              ),
                            );
                            _model.emailEnviado = true;
                            safeSetState(() {});
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
                                            'Se ha enviado un correo electrónico de restablecimiento de contraseña a la dirección de correo electrónico de tu cuenta.',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                            context.pushNamed(
                              InicioSesionWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                ),
                              },
                            );
                          } else {
                            _model.correoElectronicoInvalido = true;
                            safeSetState(() {});
                          }
                        } else {
                          _model.direccionEmailValida = false;
                          safeSetState(() {});
                        }
                      }

                      safeSetState(() {});
                    },
                    text: 'Reestablecer contraseña',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 45.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
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
              if (_model.emailEnviado == true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Correo electrónico de restablecimiento de contraseña enviado.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
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
    );
  }
}

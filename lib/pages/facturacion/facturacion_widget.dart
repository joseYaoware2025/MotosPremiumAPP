import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'facturacion_model.dart';
export 'facturacion_model.dart';

class FacturacionWidget extends StatefulWidget {
  const FacturacionWidget({
    super.key,
    required this.idOrden,
  });

  final int? idOrden;

  static String routeName = 'Facturacion';
  static String routePath = '/facturacion';

  @override
  State<FacturacionWidget> createState() => _FacturacionWidgetState();
}

class _FacturacionWidgetState extends State<FacturacionWidget> {
  late FacturacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacturacionModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.white,
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(
                CheckoutDatosFacturacionWidget.routeName,
                queryParameters: {
                  'idOrden': serializeParam(
                    widget!.idOrden,
                    ParamType.int,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
          ),
          actions: [],
          centerTitle: false,
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
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Nombre o razón social de la persona o empresa',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.nombreVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.nombreVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.nombreVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.nombreVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'RFC (Registro Federal de Contribuyentes)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.rfcVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.rfcVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.rfcVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.rfcVacio == false
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0xFFFF0000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Uso del CFDI',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController1 ??=
                                FormFieldController<String>(null),
                            options: FFAppConstants.usodelCFDI,
                            onChanged: (val) =>
                                safeSetState(() => _model.dropDownValue1 = val),
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            hintText: 'Seleccionar',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: _model.cfdiVacio == false
                                ? FlutterFlowTheme.of(context).tertiary
                                : Color(0xFFFF0000),
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Régimen Fiscal',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        FlutterFlowRadioButton(
                          options:
                              ['Personas fisicas', 'Personas morales'].toList(),
                          onChanged: (val) async {
                            safeSetState(() {});
                            safeSetState(() {
                              _model.dropDownValueController2?.reset();
                            });
                            if (_model.radioButtonValue == 'Personas fisicas') {
                              _model.pf = true;
                              _model.pm = false;
                              _model.seleccion = FFAppConstants.regimenFiscalPF
                                  .toList()
                                  .cast<String>();
                              safeSetState(() {});
                            } else {
                              if (_model.radioButtonValue ==
                                  'Personas morales') {
                                _model.pf = false;
                                _model.pm = true;
                                _model.seleccion = FFAppConstants
                                    .regimenFiscalPM
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
                              }
                            }
                          },
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).secondary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondary,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(null),
                                options: _model.seleccion,
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue2 = val),
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Seleccionar',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if ((_model.textController1.text != null &&
                                        _model.textController1.text != '') &&
                                    (_model.textController2.text != null &&
                                        _model.textController2.text != '') &&
                                    (_model.dropDownValue1 != null &&
                                        _model.dropDownValue1 != '')) {
                                  _model.nombreVacio = false;
                                  _model.rfcVacio = false;
                                  _model.cfdiVacio = false;
                                  safeSetState(() {});
                                  if (_model.radioButtonValue != null &&
                                      _model.radioButtonValue != '') {
                                    if (_model.radioButtonValue ==
                                        'Personas fisicas') {
                                      if (functions.rfcValidar(
                                              functions.stringToMayusculas(
                                                  _model.textController2.text),
                                              'fisica') ==
                                          true) {
                                        if (_model.dropDownValue2 != null &&
                                            _model.dropDownValue2 != '') {
                                          _model.rfcVacio = false;
                                          safeSetState(() {});
                                          _model.datosFacturacionFisica =
                                              await WooCommerceAPIGroup
                                                  .agregarDatosDeFacturacionCall
                                                  .call(
                                            idOrden:
                                                widget!.idOrden?.toString(),
                                            nombre: _model.textController1.text,
                                            rfc: functions.stringToMayusculas(
                                                _model.textController2.text),
                                            cfdi: _model.dropDownValue1,
                                            regimenFiscal:
                                                _model.dropDownValue2,
                                          );

                                          context.pushNamed(
                                            CheckMedioDePagosWidget.routeName,
                                            queryParameters: {
                                              'idOrden': serializeParam(
                                                widget!.idOrden,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        } else {
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
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: MensajeAlertaWidget(
                                                      mensaje:
                                                          'Selecciona tu regimen fiscal',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        _model.rfcVacio = true;
                                        safeSetState(() {});
                                      }
                                    } else if (_model.radioButtonValue ==
                                        'Personas morales') {
                                      if (functions.rfcValidar(
                                              functions.stringToMayusculas(
                                                  _model.textController2.text),
                                              'moral') ==
                                          true) {
                                        if (_model.dropDownValue2 != null &&
                                            _model.dropDownValue2 != '') {
                                          _model.rfcVacio = false;
                                          safeSetState(() {});
                                          _model.datosFacturacionMoral =
                                              await WooCommerceAPIGroup
                                                  .agregarDatosDeFacturacionCall
                                                  .call(
                                            idOrden:
                                                widget!.idOrden?.toString(),
                                            nombre: _model.textController1.text,
                                            rfc: functions.stringToMayusculas(
                                                _model.textController2.text),
                                            cfdi: _model.dropDownValue1,
                                            regimenFiscal:
                                                _model.dropDownValue2,
                                          );

                                          context.pushNamed(
                                            CheckMedioDePagosWidget.routeName,
                                            queryParameters: {
                                              'idOrden': serializeParam(
                                                widget!.idOrden,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        } else {
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
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: MensajeAlertaWidget(
                                                      mensaje:
                                                          'Selecciona tu regimen fiscal',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        _model.rfcVacio = true;
                                        safeSetState(() {});
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
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: MensajeAlertaWidget(
                                                mensaje:
                                                    'Selecciona tu regimen fiscal',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  if (_model.textController1.text == null ||
                                      _model.textController1.text == '') {
                                    _model.nombreVacio = true;
                                    _model.rfcVacio = false;
                                    _model.cfdiVacio = false;
                                    safeSetState(() {});
                                  } else if (_model.textController2.text ==
                                          null ||
                                      _model.textController2.text == '') {
                                    _model.nombreVacio = false;
                                    _model.rfcVacio = true;
                                    _model.cfdiVacio = false;
                                    safeSetState(() {});
                                  } else {
                                    _model.nombreVacio = false;
                                    _model.rfcVacio = false;
                                    _model.cfdiVacio = true;
                                    safeSetState(() {});
                                  }
                                }

                                safeSetState(() {});
                              },
                              text: 'Continuar',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
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
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    pagina: 'carrito',
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

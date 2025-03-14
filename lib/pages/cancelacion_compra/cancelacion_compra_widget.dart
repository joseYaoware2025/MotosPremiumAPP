import '';
import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'cancelacion_compra_model.dart';
export 'cancelacion_compra_model.dart';

class CancelacionCompraWidget extends StatefulWidget {
  const CancelacionCompraWidget({
    super.key,
    required this.datosOrden,
    int? idTabBar,
  }) : this.idTabBar = idTabBar ?? 0;

  final dynamic datosOrden;
  final int idTabBar;

  static String routeName = 'CancelacionCompra';
  static String routePath = '/cancelacionCompra';

  @override
  State<CancelacionCompraWidget> createState() =>
      _CancelacionCompraWidgetState();
}

class _CancelacionCompraWidgetState extends State<CancelacionCompraWidget> {
  late CancelacionCompraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelacionCompraModel());

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
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(
                PedidoWidget.routeName,
                queryParameters: {
                  'datosPedido': serializeParam(
                    widget.datosOrden,
                    ParamType.JSON,
                  ),
                  'idTabBar': serializeParam(
                    widget.idTabBar,
                    ParamType.int,
                  ),
                }.withoutNulls,
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '¿Por qué quieres solicitar la cancelación?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 0.0),
                          child: FlutterFlowRadioButton(
                            options: [
                              'Me arrepentí de la compra',
                              'No puedo esperar a que llegue',
                              'No puedo recibir la compra en la dirección que informé',
                              'Yo no hice esta compra',
                              'Otro motivo'
                            ].toList(),
                            onChanged: (val) async {
                              safeSetState(() {});
                              _model.motivoCancelacion =
                                  _model.radioButtonValue;
                              safeSetState(() {});
                            },
                            controller: _model.radioButtonValueController ??=
                                FormFieldController<String>(null),
                            optionHeight: 32.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.vertical,
                            radioButtonColor:
                                FlutterFlowTheme.of(context).secondary,
                            inactiveRadioButtonColor: Colors.black,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ),
                        if (_model.radioButtonValue == 'Otro motivo')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: 5,
                                maxLength: 150,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.radioButtonValue != null &&
                                  _model.radioButtonValue != '') {
                                if (_model.radioButtonValue != 'Otro motivo') {
                                  await Future.wait([
                                    Future(() async {
                                      _model.actualizarStatusOrden =
                                          await WooCommerceAPIGroup
                                              .actualizarStatusOrdenCall
                                              .call(
                                        idOrden: getJsonField(
                                          widget.datosOrden,
                                          r'''$.id''',
                                        ),
                                        statusOrden: 'cancelled',
                                      );
                                    }),
                                    Future(() async {
                                      _model.addMotivoCancelacion =
                                          await WooCommerceAPIGroup
                                              .motivoCancelacionCompraCall
                                              .call(
                                        razonCancelacion:
                                            _model.motivoCancelacion,
                                        idOrden: getJsonField(
                                          widget.datosOrden,
                                          r'''$.id''',
                                        ),
                                      );
                                    }),
                                  ]);

                                  context.pushNamed(
                                    SeguimientoPedidosWidget.routeName,
                                    queryParameters: {
                                      'idTabBar': serializeParam(
                                        widget.idTabBar,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                      ),
                                    },
                                  );
                                } else {
                                  if ((_model.radioButtonValue ==
                                          'Otro motivo') &&
                                      (_model.textController.text != '')) {
                                    _model.motivoCancelacion =
                                        _model.textController.text;
                                    safeSetState(() {});
                                    await Future.wait([
                                      Future(() async {
                                        _model.updateStatusOrden =
                                            await WooCommerceAPIGroup
                                                .actualizarStatusOrdenCall
                                                .call(
                                          idOrden: getJsonField(
                                            widget.datosOrden,
                                            r'''$.id''',
                                          ),
                                          statusOrden: 'cancelled',
                                        );
                                      }),
                                      Future(() async {
                                        _model.aniadirMotivoCancelacion =
                                            await WooCommerceAPIGroup
                                                .motivoCancelacionCompraCall
                                                .call(
                                          razonCancelacion:
                                              _model.motivoCancelacion,
                                          idOrden: getJsonField(
                                            widget.datosOrden,
                                            r'''$.id''',
                                          ),
                                        );
                                      }),
                                    ]);

                                    context.pushNamed(
                                      SeguimientoPedidosWidget.routeName,
                                      queryParameters: {
                                        'idTabBar': serializeParam(
                                          widget.idTabBar,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  }
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Cancelar compra',
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

import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navegacion_fuera_carrito_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'check_medio_de_pagos_model.dart';
export 'check_medio_de_pagos_model.dart';

class CheckMedioDePagosWidget extends StatefulWidget {
  const CheckMedioDePagosWidget({
    super.key,
    required this.idOrden,
  });

  final int? idOrden;

  static String routeName = 'CheckMedioDePagos';
  static String routePath = '/checkMedioDePagos';

  @override
  State<CheckMedioDePagosWidget> createState() =>
      _CheckMedioDePagosWidgetState();
}

class _CheckMedioDePagosWidgetState extends State<CheckMedioDePagosWidget> {
  late CheckMedioDePagosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckMedioDePagosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.idOrden == null) {
        context.pushNamed(
          InicioWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        _model.datosCustomer =
            await WooCommerceAPIGroup.obtenerDatosCustomerCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
        );

        _model.idCustomerMP = await actions.obteneridCustomerMP(
          getJsonField(
            (_model.datosCustomer?.jsonBody ?? ''),
            r'''$.meta_data''',
            true,
          )!,
        );
      }
    });
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
                CheckoutDatosFacturacionWidget.routeName,
                queryParameters: {
                  'idOrden': serializeParam(
                    widget.idOrden,
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
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.white,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.remove_shopping_cart_sharp,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  onPressed: () async {
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
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: NavegacionFueraCarritoWidget(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Cómo quieres pagar?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: FlutterFlowRadioButton(
                              options: ['Mercado Pago'].toList(),
                              onChanged: (val) => safeSetState(() {}),
                              controller: _model.radioButtonValueController ??=
                                  FormFieldController<String>(null),
                              optionHeight: 40.0,
                              optionWidth:
                                  MediaQuery.sizeOf(context).width * 0.8,
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 40.0),
                          child: Text(
                            'IMPORTANTE: Motos Premium NO guarda ni comparte los datos de tu tarjeta.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.radioButtonValue == 'Mercado Pago') {
                              if (_model.datosCustomer != null) {
                                if (_model.idCustomerMP == 'null') {
                                  _model.creacionCustomerMP1 =
                                      await MercadoPagoGroup.crearClienteCall
                                          .call(
                                    email: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.email''',
                                    ).toString(),
                                    firstName: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.first_name''',
                                    ).toString(),
                                    lastName: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.last_name''',
                                    ).toString(),
                                  );

                                  await Future.wait([
                                    Future(() async {
                                      _model.saveIdCustomerMP1 =
                                          await WooCommerceAPIGroup
                                              .guardarIdCustomerMPCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                        idCustomerMP: MercadoPagoGroup
                                            .crearClienteCall
                                            .idCustomerMP(
                                          (_model.creacionCustomerMP1
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                      );
                                    }),
                                    Future(() async {
                                      _model.addMetodoPagoOrden1 =
                                          await WooCommerceAPIGroup
                                              .agregarMetodoPagoOrdenCall
                                              .call(
                                        idOrden: widget.idOrden,
                                        metodoPago: 'woo-mercado-pago-basic',
                                        metodoPagoOrden: 'Mercado Pago',
                                      );
                                    }),
                                  ]);

                                  context.pushNamed(
                                    DatosTarjetaWidget.routeName,
                                    queryParameters: {
                                      'idOrden': serializeParam(
                                        widget.idOrden,
                                        ParamType.int,
                                      ),
                                      'idCustomerMP': serializeParam(
                                        MercadoPagoGroup.crearClienteCall
                                            .idCustomerMP(
                                          (_model.creacionCustomerMP1
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                } else if (_model.idCustomerMP ==
                                    'No se encontró el customer_id de Mercado Pago') {
                                  _model.creacionCustomerMP2 =
                                      await MercadoPagoGroup.crearClienteCall
                                          .call(
                                    email: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.email''',
                                    ).toString(),
                                    firstName: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.first_name''',
                                    ).toString(),
                                    lastName: getJsonField(
                                      (_model.datosCustomer?.jsonBody ?? ''),
                                      r'''$.billing.last_name''',
                                    ).toString(),
                                  );

                                  await Future.wait([
                                    Future(() async {
                                      _model.saveIdCustomerMP2 =
                                          await WooCommerceAPIGroup
                                              .guardarIdCustomerMPCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                        idCustomerMP: MercadoPagoGroup
                                            .crearClienteCall
                                            .idCustomerMP(
                                          (_model.creacionCustomerMP2
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                      );
                                    }),
                                    Future(() async {
                                      _model.addMetodoPagoOrden2 =
                                          await WooCommerceAPIGroup
                                              .agregarMetodoPagoOrdenCall
                                              .call(
                                        idOrden: widget.idOrden,
                                        metodoPago: 'woo-mercado-pago-basic',
                                        metodoPagoOrden: 'Mercado Pago',
                                      );
                                    }),
                                  ]);

                                  context.pushNamed(
                                    DatosTarjetaWidget.routeName,
                                    queryParameters: {
                                      'idOrden': serializeParam(
                                        widget.idOrden,
                                        ParamType.int,
                                      ),
                                      'idCustomerMP': serializeParam(
                                        MercadoPagoGroup.crearClienteCall
                                            .idCustomerMP(
                                          (_model.creacionCustomerMP2
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                } else {
                                  _model.addMedioPagoOrden =
                                      await WooCommerceAPIGroup
                                          .agregarMetodoPagoOrdenCall
                                          .call(
                                    idOrden: widget.idOrden,
                                    metodoPago: 'woo-mercado-pago-basic',
                                    metodoPagoOrden: 'Mercado Pago',
                                  );

                                  context.pushNamed(
                                    PasarelaTajetasMPWidget.routeName,
                                    queryParameters: {
                                      'idOrden': serializeParam(
                                        widget.idOrden,
                                        ParamType.int,
                                      ),
                                      'idCustomerMP': serializeParam(
                                        _model.idCustomerMP,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                }
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
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(50.0),
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

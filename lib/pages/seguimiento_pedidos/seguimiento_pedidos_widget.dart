import '';
import '/backend/api_requests/api_calls.dart';
import '/components/card_orden/card_orden_widget.dart';
import '/components/eliminar_orden_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'seguimiento_pedidos_model.dart';
export 'seguimiento_pedidos_model.dart';

class SeguimientoPedidosWidget extends StatefulWidget {
  const SeguimientoPedidosWidget({
    super.key,
    int? idTabBar,
  }) : this.idTabBar = idTabBar ?? 0;

  final int idTabBar;

  static String routeName = 'SeguimientoPedidos';
  static String routePath = '/seguimientoPedidos';

  @override
  State<SeguimientoPedidosWidget> createState() =>
      _SeguimientoPedidosWidgetState();
}

class _SeguimientoPedidosWidgetState extends State<SeguimientoPedidosWidget>
    with TickerProviderStateMixin {
  late SeguimientoPedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeguimientoPedidosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.tabBarCurrentIndex == 0) {
        _model.cargatab1 = await WooCommerceAPIGroup.pedidosStatusCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
          status: 'pending',
        );

        _model.tab1 =
            (_model.cargatab1?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else if (_model.tabBarCurrentIndex == 1) {
        _model.recargartab2 = await WooCommerceAPIGroup.pedidosStatusCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
          status: 'processing',
        );

        _model.tab2 =
            (_model.recargartab2?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else if (_model.tabBarCurrentIndex == 2) {
        _model.recargartab3 = await WooCommerceAPIGroup.pedidosStatusCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
          status: 'processing',
        );

        _model.tab3 =
            (_model.recargartab3?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else if (_model.tabBarCurrentIndex == 3) {
        _model.recargartab4 = await WooCommerceAPIGroup.pedidosStatusCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
          status: 'completed',
        );

        _model.tab4 =
            (_model.recargartab4?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.recargartab5 =
            await WooCommerceAPIGroup.historialDepedidosCall.call(
          idCustomer: FFAppState().idCustomerTemporal.toString(),
        );

        _model.tab5 =
            (_model.recargartab5?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            widget!.idTabBar,
            0,
          ),
          4),
    )..addListener(() => safeSetState(() {}));
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
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            elevation: 0.0,
                            buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            tabs: [
                              Tab(
                                text: 'En\nProceso',
                              ),
                              Tab(
                                text: 'Por Enviar',
                              ),
                              Tab(
                                text: 'Enviado',
                              ),
                              Tab(
                                text: 'Entregado',
                              ),
                              Tab(
                                text: 'Todo',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {
                                  _model.recargartab1 =
                                      await WooCommerceAPIGroup
                                          .pedidosStatusCall
                                          .call(
                                    idCustomer: FFAppState().idCustomerTemporal,
                                    status: 'pending',
                                  );

                                  _model.tab1 =
                                      (_model.recargartab1?.jsonBody ?? '')
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.recargartab22 =
                                      await WooCommerceAPIGroup
                                          .pedidosStatusCall
                                          .call(
                                    idCustomer: FFAppState().idCustomerTemporal,
                                    status: 'processing',
                                  );

                                  _model.tab2 =
                                      (_model.recargartab22?.jsonBody ?? '')
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.recargartab32 =
                                      await WooCommerceAPIGroup
                                          .pedidosStatusCall
                                          .call(
                                    idCustomer: FFAppState().idCustomerTemporal,
                                    status: 'processing',
                                  );

                                  _model.tab3 =
                                      (_model.recargartab32?.jsonBody ?? '')
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.recargartab42 =
                                      await WooCommerceAPIGroup
                                          .pedidosStatusCall
                                          .call(
                                    idCustomer: FFAppState().idCustomerTemporal,
                                    status: 'completed',
                                  );

                                  _model.tab4 =
                                      (_model.recargartab42?.jsonBody ?? '')
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.recargartab52 =
                                      await WooCommerceAPIGroup
                                          .historialDepedidosCall
                                          .call(
                                    idCustomer: FFAppState()
                                        .idCustomerTemporal
                                        .toString(),
                                  );

                                  _model.tab5 =
                                      (_model.recargartab52?.jsonBody ?? '')
                                          .toList()
                                          .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                }
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Visibility(
                                visible: _model.tab1.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaPedidosEnProceso =
                                          _model.tab1.toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            pasarelaPedidosEnProceso.length,
                                        itemBuilder: (context,
                                            pasarelaPedidosEnProcesoIndex) {
                                          final pasarelaPedidosEnProcesoItem =
                                              pasarelaPedidosEnProceso[
                                                  pasarelaPedidosEnProcesoIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                        .idOrdenCarritoCreada =
                                                    getJsonField(
                                                  pasarelaPedidosEnProcesoItem,
                                                  r'''$.id''',
                                                );
                                                safeSetState(() {});

                                                context.pushNamed(
                                                  CarritoWidget.routeName,
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
                                              },
                                              child: Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '\$',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    pasarelaPedidosEnProcesoItem,
                                                                    r'''$.total''',
                                                                  )?.toString(),
                                                                  '0.00',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                "y/M/d h:mm a",
                                                                functions
                                                                    .convertirFormatoFecha(
                                                                        getJsonField(
                                                                  pasarelaPedidosEnProcesoItem,
                                                                  r'''$.date_created''',
                                                                )),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              'Fecha Pedido',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'No. artículos:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions
                                                                        .obtenerDimencionArregloJSON(
                                                                            getJsonField(
                                                                          pasarelaPedidosEnProcesoItem,
                                                                          r'''$.line_items''',
                                                                          true,
                                                                        )!)
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF352525),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              () {
                                                                if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'completed') {
                                                                  return 'Entregado';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'cancelled') {
                                                                  return 'Cancelado';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'processing') {
                                                                  return 'Por llegar';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'pending') {
                                                                  return 'Por pagar';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'on-hold') {
                                                                  return 'En espera';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'refunded') {
                                                                  return 'Reembolsado';
                                                                } else if (functions
                                                                        .datosJsonaString(
                                                                            getJsonField(
                                                                      pasarelaPedidosEnProcesoItem,
                                                                      r'''$.status''',
                                                                    )) ==
                                                                    'failed') {
                                                                  return 'Fallido';
                                                                } else {
                                                                  return 'Status';
                                                                }
                                                              }(),
                                                              'Status',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: () {
                                                                    if (functions.datosJsonaString(
                                                                            getJsonField(
                                                                          pasarelaPedidosEnProcesoItem,
                                                                          r'''$.status''',
                                                                        )) ==
                                                                        'cancelled') {
                                                                      return Color(
                                                                          0xFFFF0000);
                                                                    } else if (functions.datosJsonaString(
                                                                            getJsonField(
                                                                          pasarelaPedidosEnProcesoItem,
                                                                          r'''$.status''',
                                                                        )) ==
                                                                        'completed') {
                                                                      return Color(
                                                                          0xFF51B62F);
                                                                    } else if (functions
                                                                            .datosJsonaString(getJsonField(
                                                                          pasarelaPedidosEnProcesoItem,
                                                                          r'''$.status''',
                                                                        )) ==
                                                                        'pending') {
                                                                      return Color(
                                                                          0xFFFADA67);
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    }
                                                                  }(),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          if (functions
                                                                  .datosJsonaString(
                                                                      getJsonField(
                                                                pasarelaPedidosEnProcesoItem,
                                                                r'''$.status''',
                                                              )) ==
                                                              'pending')
                                                            Builder(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    Colors
                                                                        .white,
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                icon: Icon(
                                                                  Icons.cancel,
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                EliminarOrdenWidget(
                                                                              datosOrden: getJsonField(
                                                                                pasarelaPedidosEnProcesoItem,
                                                                                r'''$.id''',
                                                                              ),
                                                                              idTabBar: widget!.idTabBar,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _model.tab2.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaPedidosPorEnviar =
                                          _model.tab2.toList();

                                      return RefreshIndicator(
                                        color: Color(0xFF29ABE2),
                                        backgroundColor: Color(0xFF6E6E6E),
                                        onRefresh: () async {},
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              pasarelaPedidosPorEnviar.length,
                                          itemBuilder: (context,
                                              pasarelaPedidosPorEnviarIndex) {
                                            final pasarelaPedidosPorEnviarItem =
                                                pasarelaPedidosPorEnviar[
                                                    pasarelaPedidosPorEnviarIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PedidoWidget.routeName,
                                                  queryParameters: {
                                                    'datosPedido':
                                                        serializeParam(
                                                      pasarelaPedidosPorEnviarItem,
                                                      ParamType.JSON,
                                                    ),
                                                    'idTabBar': serializeParam(
                                                      _model.tabBarCurrentIndex,
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
                                              },
                                              child: wrapWithModel(
                                                model: _model.cardOrdenModels1
                                                    .getModel(
                                                  'CardPedidoP',
                                                  pasarelaPedidosPorEnviarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CardOrdenWidget(
                                                  key: Key(
                                                    'Key7co_${'CardPedidoP'}',
                                                  ),
                                                  datosOrden:
                                                      pasarelaPedidosPorEnviarItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _model.tab3.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaPedidosEnviados =
                                          _model.tab3.toList();

                                      return RefreshIndicator(
                                        color: Color(0xFF29ABE2),
                                        backgroundColor: Color(0xFF6E6E6E),
                                        onRefresh: () async {},
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              pasarelaPedidosEnviados.length,
                                          itemBuilder: (context,
                                              pasarelaPedidosEnviadosIndex) {
                                            final pasarelaPedidosEnviadosItem =
                                                pasarelaPedidosEnviados[
                                                    pasarelaPedidosEnviadosIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PedidoWidget.routeName,
                                                  queryParameters: {
                                                    'datosPedido':
                                                        serializeParam(
                                                      pasarelaPedidosEnviadosItem,
                                                      ParamType.JSON,
                                                    ),
                                                    'idTabBar': serializeParam(
                                                      _model.tabBarCurrentIndex,
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
                                              },
                                              child: wrapWithModel(
                                                model: _model.cardOrdenModels2
                                                    .getModel(
                                                  'CardPedidoC',
                                                  pasarelaPedidosEnviadosIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CardOrdenWidget(
                                                  key: Key(
                                                    'Keyujc_${'CardPedidoC'}',
                                                  ),
                                                  datosOrden:
                                                      pasarelaPedidosEnviadosItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _model.tab4.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaPedidosCompletados =
                                          _model.tab4.toList();

                                      return RefreshIndicator(
                                        color: Color(0xFF29ABE2),
                                        backgroundColor: Color(0xFF6E6E6E),
                                        onRefresh: () async {},
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              pasarelaPedidosCompletados.length,
                                          itemBuilder: (context,
                                              pasarelaPedidosCompletadosIndex) {
                                            final pasarelaPedidosCompletadosItem =
                                                pasarelaPedidosCompletados[
                                                    pasarelaPedidosCompletadosIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PedidoWidget.routeName,
                                                  queryParameters: {
                                                    'datosPedido':
                                                        serializeParam(
                                                      pasarelaPedidosCompletadosItem,
                                                      ParamType.JSON,
                                                    ),
                                                    'idTabBar': serializeParam(
                                                      _model.tabBarCurrentIndex,
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
                                              },
                                              child: wrapWithModel(
                                                model: _model.cardOrdenModels3
                                                    .getModel(
                                                  'CardPedidoH',
                                                  pasarelaPedidosCompletadosIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CardOrdenWidget(
                                                  key: Key(
                                                    'Keymb4_${'CardPedidoH'}',
                                                  ),
                                                  datosOrden:
                                                      pasarelaPedidosCompletadosItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _model.tab5.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaPedidosTodo =
                                          _model.tab5.toList();

                                      return RefreshIndicator(
                                        color: Color(0xFF29ABE2),
                                        backgroundColor: Color(0xFF6E6E6E),
                                        onRefresh: () async {},
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: pasarelaPedidosTodo.length,
                                          itemBuilder: (context,
                                              pasarelaPedidosTodoIndex) {
                                            final pasarelaPedidosTodoItem =
                                                pasarelaPedidosTodo[
                                                    pasarelaPedidosTodoIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PedidoWidget.routeName,
                                                  queryParameters: {
                                                    'datosPedido':
                                                        serializeParam(
                                                      pasarelaPedidosTodoItem,
                                                      ParamType.JSON,
                                                    ),
                                                    'idTabBar': serializeParam(
                                                      _model.tabBarCurrentIndex,
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
                                              },
                                              child: wrapWithModel(
                                                model: _model.cardOrdenModels4
                                                    .getModel(
                                                  'CardPedidoC',
                                                  pasarelaPedidosTodoIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CardOrdenWidget(
                                                  key: Key(
                                                    'Keypdd_${'CardPedidoC'}',
                                                  ),
                                                  datosOrden:
                                                      pasarelaPedidosTodoItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
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

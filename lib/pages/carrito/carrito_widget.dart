import '';
import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/components/mensaje_no_hay_productos/mensaje_no_hay_productos_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'carrito_model.dart';
export 'carrito_model.dart';

class CarritoWidget extends StatefulWidget {
  const CarritoWidget({super.key});

  static String routeName = 'Carrito';
  static String routePath = '/carrito';

  @override
  State<CarritoWidget> createState() => _CarritoWidgetState();
}

class _CarritoWidgetState extends State<CarritoWidget> {
  late CarritoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarritoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().idOrdenCarritoCreada == 0) {
        _model.carritoCrgaPagina =
            await EndpointCustomGroup.obtenerCarritoCall.call(
          idCustomer: FFAppState().idCustomerTemporal,
        );

        FFAppState().carrito = (_model.carritoCrgaPagina?.jsonBody ?? '');
        safeSetState(() {});
        _model.carritoFormatoR = functions
            .optimizeLineItems(getJsonField(
              FFAppState().carrito,
              r'''$.products''',
              true,
            )!)
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.carritoOrdenCreada =
            await WooCommerceAPIGroup.obtenerPedidoIDCall.call(
          idOrden: FFAppState().idOrdenCarritoCreada,
        );

        FFAppState().carrito = functions.formatoCarritoORdenCreada(getJsonField(
          (_model.carritoOrdenCreada?.jsonBody ?? ''),
          r'''$.line_items''',
          true,
        )!);
        safeSetState(() {});
      }
    });

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
          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Carrito',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 30.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
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
                        context.pushNamed(
                          InicioWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (functions
                                      .obtenerDimencionArregloJSON(getJsonField(
                                        FFAppState().carrito,
                                        r'''$.products''',
                                        true,
                                      )!)
                                      .toString() !=
                                  '0')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listaArticulos = getJsonField(
                                        FFAppState().carrito,
                                        r'''$.products''',
                                      ).toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listaArticulos.length,
                                        itemBuilder:
                                            (context, listaArticulosIndex) {
                                          final listaArticulosItem =
                                              listaArticulos[
                                                  listaArticulosIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x320E151B),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Hero(
                                                            tag: valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                listaArticulosItem,
                                                                r'''$.image_url''',
                                                              )?.toString(),
                                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN-C4hXvLPc8Nul2q-JgIWAH0-n0L6YfU6lQ&s' +
                                                                  '$listaArticulosIndex',
                                                            ),
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    listaArticulosItem,
                                                                    r'''$.image_url''',
                                                                  )?.toString(),
                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN-C4hXvLPc8Nul2q-JgIWAH0-n0L6YfU6lQ&s',
                                                                ),
                                                                width: 80.0,
                                                                height: 80.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listaArticulosItem,
                                                                            r'''$.name''',
                                                                          )?.toString(),
                                                                          'Producto',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: Colors.black,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '\$',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listaArticulosItem,
                                                                            r'''$.price''',
                                                                          )?.toString(),
                                                                          '0.00',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Cantidad:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            getJsonField(
                                                                              listaArticulosItem,
                                                                              r'''$.quantity''',
                                                                            )?.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
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
                                                    if (FFAppState()
                                                            .idOrdenCarritoCreada ==
                                                        0)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .delete_outline_rounded,
                                                          color:
                                                              Color(0xFFE86969),
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          await EndpointCustomGroup
                                                              .eliminarProductoCarritoCall
                                                              .call(
                                                            idCustomer: FFAppState()
                                                                .idCustomerTemporal,
                                                            idProducto:
                                                                getJsonField(
                                                              listaArticulosItem,
                                                              r'''$.product_id''',
                                                            ),
                                                          );

                                                          _model.carritoActualizado =
                                                              await EndpointCustomGroup
                                                                  .obtenerCarritoCall
                                                                  .call(
                                                            idCustomer: FFAppState()
                                                                .idCustomerTemporal,
                                                          );

                                                          FFAppState()
                                                              .carrito = (_model
                                                                  .carritoActualizado
                                                                  ?.jsonBody ??
                                                              '');
                                                          safeSetState(() {});

                                                          safeSetState(() {});
                                                        },
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
                              if (functions
                                      .obtenerDimencionArregloJSON(getJsonField(
                                        FFAppState().carrito,
                                        r'''$.products''',
                                        true,
                                      )!)
                                      .toString() !=
                                  '0')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 30.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.white,
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: Colors.white,
                                        icon: FaIcon(
                                          FontAwesomeIcons.trashAlt,
                                          color: Color(0xFFFF0000),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          if (FFAppState()
                                                  .idOrdenCarritoCreada ==
                                              0) {
                                            _model.carritoVaciado =
                                                await EndpointCustomGroup
                                                    .vaciarCarritoCall
                                                    .call(
                                              idCustomer: FFAppState()
                                                  .idCustomerTemporal,
                                            );

                                            _model.respuestaCarritoVaciado =
                                                await EndpointCustomGroup
                                                    .obtenerCarritoCall
                                                    .call(
                                              idCustomer: FFAppState()
                                                  .idCustomerTemporal,
                                            );

                                            await Future.wait([
                                              Future(() async {
                                                FFAppState().carrito = (_model
                                                        .respuestaCarritoVaciado
                                                        ?.jsonBody ??
                                                    '');
                                                safeSetState(() {});
                                              }),
                                              Future(() async {
                                                _model.validarEstadoCodigoDescuento =
                                                    false;
                                                _model.estadoCaducidadDescuento =
                                                    false;
                                                _model.activarBoton = false;
                                                _model.codigoDescuento = null;
                                                _model.invalidaPromocionCodigo =
                                                    false;
                                                _model.cuponUsado = false;
                                                safeSetState(() {});
                                              }),
                                              Future(() async {
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              }),
                                            ]);
                                          } else {
                                            _model.vaciarCarrito =
                                                await WooCommerceAPIGroup
                                                    .eliminarOrdenCall
                                                    .call(
                                              idOrden: FFAppState()
                                                  .idOrdenCarritoCreada,
                                            );

                                            _model.carritoClear =
                                                await EndpointCustomGroup
                                                    .obtenerCarritoCall
                                                    .call(
                                              idCustomer: FFAppState()
                                                  .idCustomerTemporal,
                                            );

                                            FFAppState().carrito = (_model
                                                    .carritoClear?.jsonBody ??
                                                '');
                                            FFAppState().idOrdenCarritoCreada =
                                                0;
                                            safeSetState(() {});
                                          }

                                          FFAppState()
                                              .productosRelacionadosCarrito = [];
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (functions
                                      .obtenerDimencionArregloJSON(getJsonField(
                                        FFAppState().carrito,
                                        r'''$.products''',
                                        true,
                                      )!)
                                      .toString() ==
                                  '0')
                                Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.mensajeNoHayProductosModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MensajeNoHayProductosWidget(),
                                  ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Código de descuento',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Builder(
                                              builder: (context) => Container(
                                                width: 150.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      _model.resultadoBusquedaCupon =
                                                          await WooCommerceAPIGroup
                                                              .buscarCuponesCall
                                                              .call(
                                                        codigoDescuento: _model
                                                            .textController
                                                            .text,
                                                      );

                                                      if (_model.textController
                                                                  .text ==
                                                              '') {
                                                        _model.validarEstadoCodigoDescuento =
                                                            false;
                                                        _model.estadoCaducidadDescuento =
                                                            false;
                                                        _model.activarBoton =
                                                            false;
                                                        _model.cuponUsado =
                                                            false;
                                                        _model.invalidaPromocionCodigo =
                                                            false;
                                                        safeSetState(() {});
                                                      }
                                                      if ((_model
                                                              .resultadoBusquedaCupon
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (WooCommerceAPIGroup
                                                                .buscarCuponesCall
                                                                .codigoDescuento(
                                                              (_model.resultadoBusquedaCupon
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) ==
                                                            _model
                                                                .textController
                                                                .text) {
                                                          if ((WooCommerceAPIGroup
                                                                      .buscarCuponesCall
                                                                      .fechaExpiracion(
                                                                    (_model.resultadoBusquedaCupon
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  '') &&
                                                              (WooCommerceAPIGroup
                                                                      .buscarCuponesCall
                                                                      .fechaExpiracion(
                                                                    (_model.resultadoBusquedaCupon
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  '')) {
                                                            if (functions.fechaValidacionCodigoDescuento(
                                                                WooCommerceAPIGroup
                                                                    .buscarCuponesCall
                                                                    .fechaExpiracion(
                                                              (_model.resultadoBusquedaCupon
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!)) {
                                                              _model.estadoCaducidadDescuento =
                                                                  false;
                                                              _model.validarEstadoCodigoDescuento =
                                                                  false;
                                                              _model.activarBoton =
                                                                  true;
                                                              _model.invalidaPromocionCodigo =
                                                                  false;
                                                              _model.cuponUsado =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.estadoCaducidadDescuento =
                                                                  true;
                                                              _model.validarEstadoCodigoDescuento =
                                                                  false;
                                                              _model.activarBoton =
                                                                  false;
                                                              _model.invalidaPromocionCodigo =
                                                                  false;
                                                              _model.cuponUsado =
                                                                  false;
                                                              _model.codigoDescuento =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
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
                                                                      WebViewAware(
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
                                                                          MensajeAlertaWidget(
                                                                        mensaje:
                                                                            'No es posible agregar el cupón',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }
                                                        } else {
                                                          _model.validarEstadoCodigoDescuento =
                                                              true;
                                                          _model.estadoCaducidadDescuento =
                                                              false;
                                                          _model.activarBoton =
                                                              false;
                                                          _model.invalidaPromocionCodigo =
                                                              false;
                                                          _model.cuponUsado =
                                                              false;
                                                          _model.codigoDescuento =
                                                              null;
                                                          safeSetState(() {});
                                                        }
                                                      } else {
                                                        _model.validarEstadoCodigoDescuento =
                                                            true;
                                                        _model.estadoCaducidadDescuento =
                                                            false;
                                                        _model.activarBoton =
                                                            false;
                                                        _model.invalidaPromocionCodigo =
                                                            false;
                                                        _model.cuponUsado =
                                                            false;
                                                        _model.codigoDescuento =
                                                            null;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  cursorColor: Colors.black,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.activarBoton == true) {
                                                if (functions.stringAdouble(
                                                        getJsonField(
                                                      FFAppState().carrito,
                                                      r'''$.total''',
                                                    ).toString()) >
                                                    functions.stringAdouble(
                                                        (WooCommerceAPIGroup
                                                            .buscarCuponesCall
                                                            .compraMinima(
                                                              (_model.resultadoBusquedaCupon
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .elementAtOrNull(
                                                                0))!)) {
                                                  if (functions
                                                      .verificarNumeroEnLista(
                                                          FFAppState()
                                                              .idCustomerTemporal
                                                              .toString(),
                                                          WooCommerceAPIGroup
                                                              .buscarCuponesCall
                                                              .usadoPor(
                                                                (_model.resultadoBusquedaCupon
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                              .map((e) =>
                                                                  e.toString())
                                                              .toList())) {
                                                    _model.cuponUsado = true;
                                                    _model.invalidaPromocionCodigo =
                                                        false;
                                                    _model.activarBoton = false;
                                                    _model.estadoCaducidadDescuento =
                                                        false;
                                                    _model.validarEstadoCodigoDescuento =
                                                        false;
                                                    _model.codigoDescuento =
                                                        null;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.codigoDescuento =
                                                        _model.textController
                                                            .text;
                                                    _model.invalidaPromocionCodigo =
                                                        false;
                                                    _model.cuponUsado = false;
                                                    safeSetState(() {});
                                                  }
                                                } else {
                                                  _model.invalidaPromocionCodigo =
                                                      true;
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                _model.codigoDescuento = null;
                                                safeSetState(() {});
                                              }
                                            },
                                            text: 'Validar',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 1.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          if (_model.codigoDescuento != null &&
                                              _model.codigoDescuento != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_model.validarEstadoCodigoDescuento ==
                                      true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'No se ha encontrado el cupón de descuento',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFF0000),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.cuponUsado == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Este cupón de descuento ya lo usaste',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFF0000),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.invalidaPromocionCodigo == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'La promoción no aplica para tu compra',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFF0000),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.estadoCaducidadDescuento == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'El cupón ya expiro',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFFF0000),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Costos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.divisorModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: DivisorWidget(
                                    fondo: 'gris',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0,
                                    4.0,
                                    24.0,
                                    valueOrDefault<double>(
                                      _model.codigoDescuento != null &&
                                              _model.codigoDescuento != ''
                                          ? 0.0
                                          : 70.0,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '\$',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              FFAppState().carrito,
                                              r'''$.total''',
                                            )?.toString(),
                                            '0.00',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (_model.codigoDescuento != null &&
                                  _model.codigoDescuento != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0,
                                      4.0,
                                      24.0,
                                      valueOrDefault<double>(
                                        FFAppState()
                                                    .productosRelacionadosCarrito
                                                    .length !=
                                                0
                                            ? 20.0
                                            : 100.0,
                                        0.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descuento cupón',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '-\$',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              WooCommerceAPIGroup
                                                  .buscarCuponesCall
                                                  .descuento(
                                                    (_model.resultadoBusquedaCupon
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.elementAtOrNull(0),
                                              '0.00',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              if (FFAppState()
                                      .productosRelacionadosCarrito
                                      .length !=
                                  0)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      'Artículos relacionados',
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              if (FFAppState()
                                      .productosRelacionadosCarrito
                                      .length !=
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 80.0),
                                  child: Builder(
                                    builder: (context) {
                                      final productosRelacionadosCarritoLista =
                                          FFAppState()
                                              .productosRelacionadosCarrito
                                              .toList();

                                      return Container(
                                        width: double.infinity,
                                        height: 200.0,
                                        child: CarouselSlider.builder(
                                          itemCount:
                                              productosRelacionadosCarritoLista
                                                  .length,
                                          itemBuilder: (context,
                                              productosRelacionadosCarritoListaIndex,
                                              _) {
                                            final productosRelacionadosCarritoListaItem =
                                                productosRelacionadosCarritoLista[
                                                    productosRelacionadosCarritoListaIndex];
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: WooCommerceAPIGroup
                                                  .productoIDbuscarCall
                                                  .call(
                                                idProducto: FFAppState()
                                                    .productosRelacionadosCarrito
                                                    .elementAtOrNull(
                                                        productosRelacionadosCarritoListaIndex)
                                                    ?.toString(),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      child: SpinKitFadingGrid(
                                                        color:
                                                            Color(0xFF29ABE2),
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerProductoIDbuscarResponse =
                                                    snapshot.data!;

                                                return Container(
                                                  width: 130.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                containerProductoIDbuscarResponse
                                                                    .jsonBody,
                                                                r'''$.images[0].src''',
                                                              )?.toString(),
                                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN-C4hXvLPc8Nul2q-JgIWAH0-n0L6YfU6lQ&s',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        containerProductoIDbuscarResponse
                                                                            .jsonBody,
                                                                        r'''$.name''',
                                                                      )?.toString(),
                                                                      'Producto',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Colors.black,
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
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                child: Row(
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
                                                                            color:
                                                                                Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          containerProductoIDbuscarResponse
                                                                              .jsonBody,
                                                                          r'''$.price''',
                                                                        )?.toString(),
                                                                        '0.00',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                  containerProductoIDbuscarResponse
                                                                      .jsonBody,
                                                                  r'''$.sku''',
                                                                )?.toString(),
                                                                'SKU',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (FFAppState()
                                                                          .idOrdenCarritoCreada ==
                                                                      0) {
                                                                    _model.addCarrito =
                                                                        await EndpointCustomGroup
                                                                            .agregarArticulosCarritoCall
                                                                            .call(
                                                                      idCustomer:
                                                                          FFAppState()
                                                                              .idCustomerTemporal,
                                                                      idProducto:
                                                                          getJsonField(
                                                                        containerProductoIDbuscarResponse
                                                                            .jsonBody,
                                                                        r'''$.id''',
                                                                      ),
                                                                      cantidad:
                                                                          1,
                                                                    );

                                                                    _model.nuevocarrito =
                                                                        await EndpointCustomGroup
                                                                            .obtenerCarritoCall
                                                                            .call(
                                                                      idCustomer:
                                                                          FFAppState()
                                                                              .idCustomerTemporal,
                                                                    );

                                                                    FFAppState()
                                                                        .carrito = (_model
                                                                            .nuevocarrito
                                                                            ?.jsonBody ??
                                                                        '');
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.ordenActualCreada =
                                                                        await WooCommerceAPIGroup
                                                                            .obtenerPedidoIDCall
                                                                            .call(
                                                                      idOrden:
                                                                          FFAppState()
                                                                              .idOrdenCarritoCreada,
                                                                    );

                                                                    _model.nuavosArticulosOrden =
                                                                        await WooCommerceAPIGroup
                                                                            .agregarArticulosOrdenExistenteCall
                                                                            .call(
                                                                      idOrden:
                                                                          FFAppState()
                                                                              .idOrdenCarritoCreada,
                                                                      productsJson: functions.agregarProductoOrdenExistente(
                                                                          getJsonField(
                                                                            (_model.ordenActualCreada?.jsonBody ??
                                                                                ''),
                                                                            r'''$.line_items''',
                                                                            true,
                                                                          )!,
                                                                          getJsonField(
                                                                            containerProductoIDbuscarResponse.jsonBody,
                                                                            r'''$.id''',
                                                                          ),
                                                                          1),
                                                                    );

                                                                    _model.carritoOrdenCreadaCopy =
                                                                        await WooCommerceAPIGroup
                                                                            .obtenerPedidoIDCall
                                                                            .call(
                                                                      idOrden:
                                                                          FFAppState()
                                                                              .idOrdenCarritoCreada,
                                                                    );

                                                                    FFAppState()
                                                                            .carrito =
                                                                        functions
                                                                            .formatoCarritoORdenCreada(getJsonField(
                                                                      (_model.carritoOrdenCreada
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.line_items''',
                                                                      true,
                                                                    )!);
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Agregar',
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_shopping_cart_rounded,
                                                                  size: 25.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    1,
                                                    productosRelacionadosCarritoLista
                                                            .length -
                                                        1)),
                                            viewportFraction: 0.5,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: false,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: false,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (functions.obtenerDimencionArregloJSON(
                                        getJsonField(
                                      FFAppState().carrito,
                                      r'''$.products''',
                                      true,
                                    )!) >
                                    0) {
                                  if (FFAppState().idOrdenCarritoCreada == 0) {
                                    await Future.wait([
                                      Future(() async {
                                        _model.orden = await WooCommerceAPIGroup
                                            .nuevaOrdenCustomerCall
                                            .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                          articulosJson: _model.carritoFormatoR,
                                        );

                                        if (_model.codigoDescuento != null &&
                                            _model.codigoDescuento != '') {
                                          _model.addCupon =
                                              await WooCommerceAPIGroup
                                                  .agregarCuponDescuentoCall
                                                  .call(
                                            idOrden: getJsonField(
                                              (_model.orden?.jsonBody ?? ''),
                                              r'''$.id''',
                                            ),
                                            cupon: _model.textController.text,
                                          );
                                        }
                                      }),
                                      Future(() async {
                                        _model.clearCarrito =
                                            await EndpointCustomGroup
                                                .vaciarCarritoCall
                                                .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                        );

                                        _model.actualizacionCrearOrden =
                                            await EndpointCustomGroup
                                                .obtenerCarritoCall
                                                .call(
                                          idCustomer:
                                              FFAppState().idCustomerTemporal,
                                        );

                                        FFAppState().carrito = (_model
                                                .actualizacionCrearOrden
                                                ?.jsonBody ??
                                            '');
                                        safeSetState(() {});
                                      }),
                                    ]);
                                    FFAppState().idOrdenCarritoCreada =
                                        getJsonField(
                                      (_model.orden?.jsonBody ?? ''),
                                      r'''$.id''',
                                    );
                                    safeSetState(() {});

                                    context.pushNamed(
                                      PreCheckoutWidget.routeName,
                                      queryParameters: {
                                        'idOrden': serializeParam(
                                          getJsonField(
                                            (_model.orden?.jsonBody ?? ''),
                                            r'''$.id''',
                                          ),
                                          ParamType.int,
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
                                    if (_model.codigoDescuento != null &&
                                        _model.codigoDescuento != '') {
                                      _model.addCuponOrdenCreada =
                                          await WooCommerceAPIGroup
                                              .agregarCuponDescuentoCall
                                              .call(
                                        idOrden:
                                            FFAppState().idOrdenCarritoCreada,
                                        cupon: _model.textController.text,
                                      );
                                    }

                                    context.pushNamed(
                                      PreCheckoutWidget.routeName,
                                      queryParameters: {
                                        'idOrden': serializeParam(
                                          FFAppState().idOrdenCarritoCreada,
                                          ParamType.int,
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

                                safeSetState(() {});
                              },
                              text: 'Comprar',
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

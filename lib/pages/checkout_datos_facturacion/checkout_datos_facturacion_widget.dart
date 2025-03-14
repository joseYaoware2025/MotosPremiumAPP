import '';
import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navegacion_fuera_carrito_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'checkout_datos_facturacion_model.dart';
export 'checkout_datos_facturacion_model.dart';

class CheckoutDatosFacturacionWidget extends StatefulWidget {
  const CheckoutDatosFacturacionWidget({
    super.key,
    required this.idOrden,
  });

  final int? idOrden;

  static String routeName = 'CheckoutDatosFacturacion';
  static String routePath = '/checkoutDatosFacturacion';

  @override
  State<CheckoutDatosFacturacionWidget> createState() =>
      _CheckoutDatosFacturacionWidgetState();
}

class _CheckoutDatosFacturacionWidgetState
    extends State<CheckoutDatosFacturacionWidget> {
  late CheckoutDatosFacturacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutDatosFacturacionModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: WooCommerceAPIGroup.obtenerDatosCustomerCall.call(
        idCustomer: FFAppState().idCustomerTemporal,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitFadingGrid(
                  color: Color(0xFF29ABE2),
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        final checkoutDatosFacturacionObtenerDatosCustomerResponse =
            snapshot.data!;

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
                    PreCheckoutWidget.routeName,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
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
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                '¿Deseas realizar una facturación?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.sinfactura = await WooCommerceAPIGroup
                                      .deseaFacturaCall
                                      .call(
                                    idOrden: widget.idOrden,
                                    validacion: false,
                                  );

                                  context.pushNamed(
                                    CheckMedioDePagosWidget.routeName,
                                    queryParameters: {
                                      'idOrden': serializeParam(
                                        widget.idOrden,
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

                                  safeSetState(() {});
                                },
                                text: 'Comprar sin facturación',
                                options: FFButtonOptions(
                                  width: 250.0,
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Text(
                                'Selecciona tu dirección de facturación',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.estadoSeleccion == false) {
                                    _model.estadoSeleccion = true;
                                    safeSetState(() {});
                                    await Future.wait([
                                      Future(() async {
                                        _model.editarDOrden =
                                            await WooCommerceAPIGroup
                                                .editarDireccionFacturacionOrdenCall
                                                .call(
                                          idOrden: widget.idOrden,
                                          nombres: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.first_name''',
                                          ).toString(),
                                          apellidos: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.last_name''',
                                          ).toString(),
                                          empresa: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.company''',
                                          ).toString(),
                                          direccion: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.address_1''',
                                          ).toString(),
                                          ciudad: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.city''',
                                          ).toString(),
                                          estado: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.state''',
                                          ).toString(),
                                          cp: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.postcode''',
                                          ).toString(),
                                          telefono: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.phone''',
                                          ).toString(),
                                          email: getJsonField(
                                            checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                .jsonBody,
                                            r'''$.billing.email''',
                                          ).toString(),
                                        );
                                      }),
                                      Future(() async {
                                        _model.conFactura1 =
                                            await WooCommerceAPIGroup
                                                .deseaFacturaCall
                                                .call(
                                          idOrden: widget.idOrden,
                                          validacion: true,
                                        );
                                      }),
                                    ]);

                                    context.pushNamed(
                                      FacturacionWidget.routeName,
                                      queryParameters: {
                                        'idOrden': serializeParam(
                                          widget.idOrden,
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

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD7D7D7),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Dirección por defecto',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                                    .jsonBody,
                                                                r'''$.billing.first_name''',
                                                              )?.toString(),
                                                              'Nombre',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                                  .jsonBody,
                                                              r'''$.billing.last_name''',
                                                            )?.toString(),
                                                            'Apellidos',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        getJsonField(
                                                          checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                              .jsonBody,
                                                          r'''$.billing.address_1''',
                                                        )?.toString(),
                                                        'Dirección',
                                                      )}, ${valueOrDefault<String>(
                                                        getJsonField(
                                                          checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                              .jsonBody,
                                                          r'''$.billing.city''',
                                                        )?.toString(),
                                                        'Ciudad',
                                                      )}, ${valueOrDefault<String>(
                                                        getJsonField(
                                                          checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                              .jsonBody,
                                                          r'''$.billing.state''',
                                                        )?.toString(),
                                                        'Estado',
                                                      )}, CP: ${valueOrDefault<String>(
                                                        getJsonField(
                                                          checkoutDatosFacturacionObtenerDatosCustomerResponse
                                                              .jsonBody,
                                                          r'''$.billing.postcode''',
                                                        )?.toString(),
                                                        'CP',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.mapMarkerAlt,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Colors.transparent,
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Color(0xFFFF0000),
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      EditarDireccionDeFacturacionWidget
                                                          .routeName,
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
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (functions
                                    .obtenerDimencionArregloJSON(getJsonField(
                                  functions.obtenerDireccionesFacturacion(
                                      getJsonField(
                                    checkoutDatosFacturacionObtenerDatosCustomerResponse
                                        .jsonBody,
                                    r'''$.meta_data''',
                                    true,
                                  )!),
                                  r'''$.billing_addresses''',
                                  true,
                                )!) >
                                0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Otras direcciones',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            if (functions
                                    .obtenerDimencionArregloJSON(getJsonField(
                                  functions.obtenerDireccionesFacturacion(
                                      getJsonField(
                                    checkoutDatosFacturacionObtenerDatosCustomerResponse
                                        .jsonBody,
                                    r'''$.meta_data''',
                                    true,
                                  )!),
                                  r'''$.billing_addresses''',
                                  true,
                                )!) >
                                0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final listaDireccionesAlternas =
                                        getJsonField(
                                      functions.obtenerDireccionesFacturacion(
                                          getJsonField(
                                        checkoutDatosFacturacionObtenerDatosCustomerResponse
                                            .jsonBody,
                                        r'''$.meta_data''',
                                        true,
                                      )!),
                                      r'''$.billing_addresses''',
                                    ).toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listaDireccionesAlternas.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context,
                                          listaDireccionesAlternasIndex) {
                                        final listaDireccionesAlternasItem =
                                            listaDireccionesAlternas[
                                                listaDireccionesAlternasIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.estadoSeleccion ==
                                                  false) {
                                                _model.estadoSeleccion = true;
                                                safeSetState(() {});
                                                await Future.wait([
                                                  Future(() async {
                                                    _model.edicionDireccionFacturacionOrden =
                                                        await WooCommerceAPIGroup
                                                            .editarDireccionFacturacionOrdenCall
                                                            .call(
                                                      idOrden: widget.idOrden,
                                                      nombres: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.first_name''',
                                                      ).toString(),
                                                      apellidos: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.last_name''',
                                                      ).toString(),
                                                      empresa: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.company''',
                                                      ).toString(),
                                                      direccion: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.address_1''',
                                                      ).toString(),
                                                      ciudad: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.city''',
                                                      ).toString(),
                                                      estado: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.state''',
                                                      ).toString(),
                                                      cp: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.postcode''',
                                                      ).toString(),
                                                      telefono: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.phone''',
                                                      ).toString(),
                                                      email: getJsonField(
                                                        listaDireccionesAlternasItem,
                                                        r'''$.email''',
                                                      ).toString(),
                                                    );
                                                  }),
                                                  Future(() async {
                                                    _model.conFactura2 =
                                                        await WooCommerceAPIGroup
                                                            .deseaFacturaCall
                                                            .call(
                                                      idOrden: widget.idOrden,
                                                      validacion: true,
                                                    );
                                                  }),
                                                ]);

                                                context.pushNamed(
                                                  FacturacionWidget.routeName,
                                                  queryParameters: {
                                                    'idOrden': serializeParam(
                                                      widget.idOrden,
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
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD7D7D7),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Dirección de facturación',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listaDireccionesAlternasItem,
                                                                            r'''$.first_name''',
                                                                          )?.toString(),
                                                                          'Nombre',
                                                                        ),
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
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          listaDireccionesAlternasItem,
                                                                          r'''$.last_name''',
                                                                        )?.toString(),
                                                                        'Apellidos',
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
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Text(
                                                                  '${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      listaDireccionesAlternasItem,
                                                                      r'''$.address_1''',
                                                                    )?.toString(),
                                                                    'Dirección',
                                                                  )}, ${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      listaDireccionesAlternasItem,
                                                                      r'''$.city''',
                                                                    )?.toString(),
                                                                    'Ciudad',
                                                                  )}, ${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      listaDireccionesAlternasItem,
                                                                      r'''$.state''',
                                                                    )?.toString(),
                                                                    'Estado',
                                                                  )}, CP: ${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      listaDireccionesAlternasItem,
                                                                      r'''$.postcode''',
                                                                    )?.toString(),
                                                                    'cp',
                                                                  )}',
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
                                                            ],
                                                          ),
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .mapMarkerAlt,
                                                          color: Colors.black,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
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
      },
    );
  }
}

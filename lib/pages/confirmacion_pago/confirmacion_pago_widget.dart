import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
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
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'confirmacion_pago_model.dart';
export 'confirmacion_pago_model.dart';

class ConfirmacionPagoWidget extends StatefulWidget {
  const ConfirmacionPagoWidget({
    super.key,
    required this.tokenTarjeta,
    required this.idOrden,
    this.idCustomerMP,
  });

  final String? tokenTarjeta;
  final int? idOrden;
  final String? idCustomerMP;

  static String routeName = 'ConfirmacionPago';
  static String routePath = '/confirmacionPago';

  @override
  State<ConfirmacionPagoWidget> createState() => _ConfirmacionPagoWidgetState();
}

class _ConfirmacionPagoWidgetState extends State<ConfirmacionPagoWidget> {
  late ConfirmacionPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmacionPagoModel());

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
      future: WooCommerceAPIGroup.obtenerPedidoIDCall.call(
        idOrden: widget.idOrden,
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
        final confirmacionPagoObtenerPedidoIDResponse = snapshot.data!;

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
                  context.safePop();
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.estadoPago == 0)
                                  Icon(
                                    Icons.credit_score_rounded,
                                    color: Color(0xFF78CD3E),
                                    size: 200.0,
                                  ),
                                if (_model.estadoPago == 1)
                                  Icon(
                                    Icons.check_circle_outlined,
                                    color: Color(0xFF78CD3E),
                                    size: 200.0,
                                  ),
                                if (_model.estadoPago == 2)
                                  Icon(
                                    Icons.pending_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 200.0,
                                  ),
                                if (_model.estadoPago == 3)
                                  Icon(
                                    Icons.cached_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 200.0,
                                  ),
                                if (_model.estadoPago == 4)
                                  Icon(
                                    Icons.credit_card_off_outlined,
                                    color: Color(0xFFFF0000),
                                    size: 200.0,
                                  ),
                                if (_model.estadoPago == 5)
                                  Icon(
                                    Icons.cancel_outlined,
                                    color: Color(0xFFFF0000),
                                    size: 200.0,
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.estadoPago == 1)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'El pago ha sido aprobado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                if (_model.estadoPago == 2)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'El pago está en espera',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                if (_model.estadoPago == 3)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'El pago está en espera',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                if (_model.estadoPago == 4)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'El pago ha sido rechazado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                if (_model.estadoPago == 5)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'El pago ha fallado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              'Confirmar compra por',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      confirmacionPagoObtenerPedidoIDResponse
                                          .jsonBody,
                                      r'''$.total''',
                                    )?.toString(),
                                    '0.00',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            if (_model.estadoPago == 0)
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.pago = await MercadoPagoGroup
                                          .crearPagoCall
                                          .call(
                                        tokenTarjeta: widget.tokenTarjeta,
                                        firstName: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.first_name''',
                                        )),
                                        lastName: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.last_name''',
                                        )),
                                        email: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.email''',
                                        )),
                                        transactionAmount:
                                            functions.stringAdouble(functions
                                                .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.total''',
                                        ))),
                                        identificationType: 'RFC',
                                        identificationNumber: 'MLM',
                                        cp: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.postcode''',
                                        )),
                                        calle: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.address_1''',
                                        )),
                                        colonia: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.address_2''',
                                        )),
                                        ciudad: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.city''',
                                        )),
                                        estado: functions
                                            .datosJsonaString(getJsonField(
                                          confirmacionPagoObtenerPedidoIDResponse
                                              .jsonBody,
                                          r'''$.billing.state''',
                                        )),
                                        idOrden: widget.idOrden?.toString(),
                                      );

                                      if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid card_token_id') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Hubo un error, intentalo nuevamente',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid transaction_amount') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Transacción no aprovada',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        context.pushNamed(
                                          InicioWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid card_number_validation') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Número de tarjeta no valido',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid security_code_length') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Código de seguridad no valido',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Cannot infer Payment Method') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Método de pago no identificado',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid card_number_length') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Número de tarjeta no valido',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (MercadoPagoGroup.crearPagoCall
                                              .mensajeError(
                                            (_model.pago?.jsonBody ?? ''),
                                          ) ==
                                          'Invalid card token') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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
                                                        'Verifica los datos de tu tarjeta para tu compra',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        if (MercadoPagoGroup.crearPagoCall
                                                .status(
                                              (_model.pago?.jsonBody ?? ''),
                                            ) ==
                                            'approved') {
                                          _model.estadoPago = 1;
                                          safeSetState(() {});
                                          _model.actulizarOrdenA =
                                              await WooCommerceAPIGroup
                                                  .actualizarPagoOrdenCall
                                                  .call(
                                            idOrden: widget.idOrden,
                                            statusPago: true,
                                            status: 'processing',
                                            idTransaccion: MercadoPagoGroup
                                                .crearPagoCall
                                                .idTransaccion(
                                                  (_model.pago?.jsonBody ?? ''),
                                                )
                                                ?.toString(),
                                          );

                                          _model.actualizacionCarrito =
                                              await EndpointCustomGroup
                                                  .obtenerCarritoCall
                                                  .call(
                                            idCustomer:
                                                FFAppState().idCustomerTemporal,
                                          );

                                          FFAppState().carrito = (_model
                                                  .actualizacionCarrito
                                                  ?.jsonBody ??
                                              '');
                                          FFAppState().idOrdenCarritoCreada = 0;
                                          safeSetState(() {});
                                        } else if (MercadoPagoGroup
                                                .crearPagoCall
                                                .status(
                                              (_model.pago?.jsonBody ?? ''),
                                            ) ==
                                            'pending') {
                                          _model.estadoPago = 2;
                                          safeSetState(() {});
                                          _model.actulizarOrdenP =
                                              await WooCommerceAPIGroup
                                                  .actualizarPagoOrdenCall
                                                  .call(
                                            idOrden: widget.idOrden,
                                            statusPago: false,
                                            status: 'pending',
                                            idTransaccion: MercadoPagoGroup
                                                .crearPagoCall
                                                .idTransaccion(
                                                  (_model.pago?.jsonBody ?? ''),
                                                )
                                                ?.toString(),
                                          );
                                        } else if (MercadoPagoGroup
                                                .crearPagoCall
                                                .status(
                                              (_model.pago?.jsonBody ?? ''),
                                            ) ==
                                            'in_process') {
                                          _model.estadoPago = 3;
                                          safeSetState(() {});
                                          _model.actulizarOrdenI =
                                              await WooCommerceAPIGroup
                                                  .actualizarPagoOrdenCall
                                                  .call(
                                            idOrden: widget.idOrden,
                                            statusPago: false,
                                            status: 'pending',
                                            idTransaccion: MercadoPagoGroup
                                                .crearPagoCall
                                                .idTransaccion(
                                                  (_model.pago?.jsonBody ?? ''),
                                                )
                                                ?.toString(),
                                          );
                                        } else if (MercadoPagoGroup
                                                .crearPagoCall
                                                .status(
                                              (_model.pago?.jsonBody ?? ''),
                                            ) ==
                                            'rejected') {
                                          _model.estadoPago = 4;
                                          safeSetState(() {});
                                          _model.actulizarOrdenR =
                                              await WooCommerceAPIGroup
                                                  .actualizarPagoOrdenCall
                                                  .call(
                                            idOrden: widget.idOrden,
                                            statusPago: false,
                                            status: 'pending',
                                            idTransaccion: '',
                                          );
                                        } else {
                                          _model.estadoPago = 5;
                                          safeSetState(() {});
                                          _model.actulizarOrdenO =
                                              await WooCommerceAPIGroup
                                                  .actualizarPagoOrdenCall
                                                  .call(
                                            idOrden: widget.idOrden,
                                            statusPago: false,
                                            status: 'pending',
                                            idTransaccion: '',
                                          );
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Confirmar compra',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                                ),
                              ),
                            if ((_model.estadoPago == 1) ||
                                (_model.estadoPago == 2) ||
                                (_model.estadoPago == 3))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      InicioWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Aceptar',
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                              ),
                            if ((_model.estadoPago == 4) ||
                                (_model.estadoPago == 5))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
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
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Reintentar pago',
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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

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
import 'package:flip_card/flip_card.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'datos_tarjeta_model.dart';
export 'datos_tarjeta_model.dart';

class DatosTarjetaWidget extends StatefulWidget {
  const DatosTarjetaWidget({
    super.key,
    required this.idOrden,
    required this.idCustomerMP,
  });

  final int? idOrden;
  final String? idCustomerMP;

  static String routeName = 'DatosTarjeta';
  static String routePath = '/datosTarjeta';

  @override
  State<DatosTarjetaWidget> createState() => _DatosTarjetaWidgetState();
}

class _DatosTarjetaWidgetState extends State<DatosTarjetaWidget> {
  late DatosTarjetaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosTarjetaModel());

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

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        final datosTarjetaObtenerPedidoIDResponse = snapshot.data!;

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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Número de pedido:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              datosTarjetaObtenerPedidoIDResponse
                                                  .jsonBody,
                                              r'''$.id''',
                                            )?.toString(),
                                            'Número',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Fecha:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "yMMMd",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'Fecha',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Total:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '\$',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    datosTarjetaObtenerPedidoIDResponse
                                                        .jsonBody,
                                                    r'''$.total''',
                                                  )?.toString(),
                                                  'Total',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Métodos de pago:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                datosTarjetaObtenerPedidoIDResponse
                                                    .jsonBody,
                                                r'''$.payment_method_title''',
                                              )?.toString(),
                                              'MP',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Tarjeta de crédito o débito',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              FlipCard(
                                fill: Fill.fillBack,
                                direction: FlipDirection.HORIZONTAL,
                                speed: 400,
                                front: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 350.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: Color(0x4B1A1F24),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                          Color(0xFF29ABE2)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.94, -1.0),
                                        end: AlignmentDirectional(-0.94, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.ccVisa,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                ),
                                                FaIcon(
                                                  FontAwesomeIcons.ccMastercard,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Cliente',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.nombre,
                                                      'Nombre',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.apellidos,
                                                    'Apellidos',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      _model.numeroTargeta,
                                                      '**** 0000',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Mes/Año',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto Mono',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model.cad,
                                                          '00/00',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto Mono',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                back: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 350.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          color: Color(0x4B1A1F24),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                          Color(0xFF29ABE2)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.94, -1.0),
                                        end: AlignmentDirectional(-0.94, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.ccVisa,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.ccMastercard,
                                                color: Colors.white,
                                                size: 30.0,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Text(
                                                  'cvv',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.cvv,
                                                      'CVV',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.black,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController1',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.numeroTargeta =
                                                _model.textController1.text;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Número',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          alignLabelWithHint: false,
                                          hintText: 'Número',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.numeroInvalido ==
                                                      true
                                                  ? Color(0xFFFF0000)
                                                  : FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.numeroInvalido ==
                                                      true
                                                  ? Color(0xFFFF0000)
                                                  : FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.numeroInvalido ==
                                                      true
                                                  ? Color(0xFFFF0000)
                                                  : FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.numeroInvalido ==
                                                      true
                                                  ? Color(0xFFFF0000)
                                                  : FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
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
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.black,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.textFieldMask1
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode2,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController2',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              _model.nombre =
                                                  _model.textController2.text;
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Nombre',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            hintText: 'Nombre',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
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
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
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
                                          cursorColor: Colors.black,
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController3',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              _model.apellidos =
                                                  _model.textController3.text;
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Apellidos',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            hintText: 'Apellidos',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
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
                                                    _model.fallaTitularTarjeta ==
                                                            true
                                                        ? Color(0xFFFF0000)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor: Colors.black,
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController4,
                                                  focusNode: _model
                                                      .textFieldFocusNode4,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController4',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      _model.cad = _model
                                                          .textController4.text;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Mes/Año',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintText: 'Mes/Año',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cadInvalida ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cadInvalida ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cadInvalida ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cadInvalida ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
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
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black,
                                                  validator: _model
                                                      .textController4Validator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.textFieldMask4
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController5,
                                                  focusNode: _model
                                                      .textFieldFocusNode5,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController5',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      _model.cvv = _model
                                                          .textController5.text;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'CVV',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintText: 'CVV',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cvvInvalido ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cvvInvalido ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cvvInvalido ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _model
                                                                    .cvvInvalido ==
                                                                true
                                                            ? Color(0xFFFF0000)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
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
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black,
                                                  validator: _model
                                                      .textController5Validator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.textFieldMask5
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.creditCard,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.datosIncompletos == true)
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.error_outline,
                                            color: Color(0xFFFF0000),
                                            size: 24.0,
                                          ),
                                          Text(
                                            'Ingresa correctamente los datos de la tarjeta',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((_model.textController1.text != '') &&
                                          (_model.textController2.text !=
                                                  '') &&
                                          (_model.textController3.text !=
                                                  '') &&
                                          (_model.textController4.text !=
                                                  '') &&
                                          (_model.textController5.text !=
                                                  '')) {
                                        _model.datosIncompletos = false;
                                        safeSetState(() {});
                                        await Future.wait([
                                          Future(() async {
                                            if (functions.validarSizeNumeros(
                                                _model.textController1.text,
                                                16)) {
                                              _model.numeroInvalido = false;
                                              safeSetState(() {});
                                            } else {
                                              _model.numeroInvalido = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (functions.validarSizeNumeros(
                                                _model.textController5.text,
                                                3)) {
                                              _model.cvvInvalido = false;
                                              safeSetState(() {});
                                            } else {
                                              _model.cvvInvalido = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (functions.validarSizeNumeros(
                                                _model.textController4.text,
                                                5)) {
                                              _model.cadInvalida = false;
                                              safeSetState(() {});
                                            } else {
                                              _model.cadInvalida = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                        ]);
                                        if ((_model.numeroInvalido == false) &&
                                            (_model.cvvInvalido == false) &&
                                            (_model.cadInvalida == false)) {
                                          _model.obtenerToken =
                                              await MercadoPagoGroup
                                                  .obtenerTokenCardCall
                                                  .call(
                                            publicKey:
                                                FFAppConstants.publicKeyMP,
                                            numTarjeta:
                                                _model.textController1.text,
                                            nombreTitularTarjeta:
                                                '${_model.textController2.text} ${_model.textController3.text}',
                                            codigoSeguridad:
                                                _model.textController5.text,
                                            mesExpiracion: functions
                                                .obtenerFechaExpiracionTarjeta(
                                                    _model.textController4.text)
                                                .elementAtOrNull(0),
                                            anioexpiracion:
                                                '20${functions.obtenerFechaExpiracionTarjeta(_model.textController4.text).elementAtOrNull(1)}',
                                          );

                                          if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'invalid card_number') {
                                            _model.numeroInvalido = true;
                                            _model.cvvInvalido = false;
                                            _model.cadInvalida = false;
                                            _model.fallaTitularTarjeta = false;
                                            _model.tokenTarjeta = null;
                                            safeSetState(() {});
                                          } else if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'invalid expiration_month') {
                                            _model.cadInvalida = true;
                                            _model.cvvInvalido = false;
                                            _model.numeroInvalido = false;
                                            _model.fallaTitularTarjeta = false;
                                            _model.tokenTarjeta = null;
                                            safeSetState(() {});
                                          } else if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'invalid expiration_year') {
                                            _model.cadInvalida = true;
                                            _model.cvvInvalido = false;
                                            _model.numeroInvalido = false;
                                            _model.fallaTitularTarjeta = false;
                                            _model.tokenTarjeta = null;
                                            safeSetState(() {});
                                          } else if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'invalid security_code') {
                                            _model.cvvInvalido = true;
                                            _model.cadInvalida = false;
                                            _model.numeroInvalido = false;
                                            _model.fallaTitularTarjeta = false;
                                            _model.tokenTarjeta = null;
                                            safeSetState(() {});
                                          } else if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'missing or invalid cardholder name') {
                                            _model.fallaTitularTarjeta = true;
                                            _model.tokenTarjeta = null;
                                            _model.cvvInvalido = false;
                                            _model.cadInvalida = false;
                                            _model.numeroInvalido = false;
                                            safeSetState(() {});
                                          } else if (functions.datosJsonaString(
                                                  getJsonField(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )) ==
                                              'request failed') {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          MensajeAlertaWidget(
                                                        mensaje:
                                                            'Ups! intentalo otra vez',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else if (MercadoPagoGroup
                                                      .obtenerTokenCardCall
                                                      .tokenTargeta(
                                                    (_model.obtenerToken
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              MercadoPagoGroup
                                                      .obtenerTokenCardCall
                                                      .tokenTargeta(
                                                    (_model.obtenerToken
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  '') {
                                            _model.cvvInvalido = false;
                                            _model.cadInvalida = false;
                                            _model.numeroInvalido = false;
                                            _model.fallaTitularTarjeta = false;
                                            _model.tokenTarjeta =
                                                MercadoPagoGroup
                                                    .obtenerTokenCardCall
                                                    .tokenTargeta(
                                              (_model.obtenerToken?.jsonBody ??
                                                  ''),
                                            );
                                            safeSetState(() {});
                                            _model.salidaAsociarTarjeta =
                                                await MercadoPagoGroup
                                                    .asociarTarjetaAClienteCall
                                                    .call(
                                              idCustomerMP:
                                                  widget.idCustomerMP,
                                              tokenTarjeta: MercadoPagoGroup
                                                  .obtenerTokenCardCall
                                                  .tokenTargeta(
                                                (_model.obtenerToken
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                            );

                                            context.pushNamed(
                                              ConfirmacionPagoWidget.routeName,
                                              queryParameters: {
                                                'tokenTarjeta': serializeParam(
                                                  MercadoPagoGroup
                                                      .obtenerTokenCardCall
                                                      .tokenTargeta(
                                                    (_model.obtenerToken
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  ParamType.String,
                                                ),
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
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          MensajeAlertaWidget(
                                                        mensaje:
                                                            'Algo salio mal, intentalo nuevamente',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }
                                      } else {
                                        _model.datosIncompletos = true;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Continuar',
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
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 1.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
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

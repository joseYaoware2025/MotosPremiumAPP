import '';
import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'producto_model.dart';
export 'producto_model.dart';

class ProductoWidget extends StatefulWidget {
  const ProductoWidget({
    super.key,
    required this.datosProducto,
  });

  final dynamic datosProducto;

  static String routeName = 'Producto';
  static String routePath = '/producto';

  @override
  State<ProductoWidget> createState() => _ProductoWidgetState();
}

class _ProductoWidgetState extends State<ProductoWidget> {
  late ProductoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.productosRelacionado = getJsonField(
        widget.datosProducto,
        r'''$.related_ids''',
        true,
      )!
          .toList()
          .cast<int>();
      _model.cantidad = functions.obtenerStockProducto(getJsonField(
        widget.datosProducto,
        r'''$.stock_quantity''',
      ));
      safeSetState(() {});
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
        body: Container(
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
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 500.0,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final imagenesProductos = getJsonField(
                                        widget.datosProducto,
                                        r'''$.images''',
                                      ).toList();

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: PageView.builder(
                                          controller:
                                              _model.pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              imagenesProductos
                                                                      .length -
                                                                  1))),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: imagenesProductos.length,
                                          itemBuilder: (context,
                                              imagenesProductosIndex) {
                                            final imagenesProductosItem =
                                                imagenesProductos[
                                                    imagenesProductosIndex];
                                            return Image.network(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  imagenesProductosItem,
                                                  r'''$.src''',
                                                )?.toString(),
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN-C4hXvLPc8Nul2q-JgIWAH0-n0L6YfU6lQ&s',
                                              ),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.85, -0.4),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0x7F0F1113),
                                                  icon: Icon(
                                                    Icons.chevron_left_rounded,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.safePop();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 7.0,
                                            sigmaY: 6.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x31000000),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          widget.datosProducto,
                                                          r'''$.name''',
                                                        )?.toString(),
                                                        'Nombre Producto',
                                                      ),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Lato',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 24.0,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            'SKU:',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 12.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 18.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      24.0,
                                                                      5.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                widget
                                                                    .datosProducto,
                                                                r'''$.sku''',
                                                              )?.toString(),
                                                              'SKU',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 12.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 18.0;
                                                                    } else {
                                                                      return 22.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      'Stock',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().stockMin ==
                                                    getJsonField(
                                                      widget.datosProducto,
                                                      r'''$.stock_quantity''',
                                                    )
                                                ? Color(0xFFFF0000)
                                                : Colors.black,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.datosProducto,
                                        r'''$.stock_quantity''',
                                      )?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FFAppState().stockMin ==
                                                  getJsonField(
                                                    widget.datosProducto,
                                                    r'''$.stock_quantity''',
                                                  )
                                              ? Color(0xFFFF0000)
                                              : Colors.black,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if ((functions.datosJsonaString(
                                                  getJsonField(
                                                widget.datosProducto,
                                                r'''$.regular_price''',
                                              )) !=
                                              '') &&
                                          (functions.datosJsonaString(
                                                  getJsonField(
                                                widget.datosProducto,
                                                r'''$.regular_price''',
                                              )) !=
                                              functions.datosJsonaString(
                                                  getJsonField(
                                                widget.datosProducto,
                                                r'''$.price''',
                                              ))))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '\$',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: Color(0xFFFFA100),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.datosProducto,
                                                  r'''$.regular_price''',
                                                )?.toString(),
                                                'Precio',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: Color(0xFFFFA100),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '\$',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.datosProducto,
                                                r'''$.price''',
                                              )?.toString(),
                                              'Precio',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 156.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? Colors.black
                                            : Color(0xFFA39F9F),
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? Colors.black
                                            : Color(0xFFA39F9F),
                                        size: 20.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      count: _model.countControllerValue ??= 1,
                                      updateCount: (count) async {
                                        safeSetState(() => _model
                                            .countControllerValue = count);
                                        if (_model.cantidad ==
                                            FFAppState().stockMin) {
                                          safeSetState(() {
                                            _model.countControllerValue = 0;
                                          });
                                        } else {
                                          if (_model.countControllerValue! >=
                                              _model.cantidad!) {
                                            safeSetState(() {
                                              _model.countControllerValue =
                                                  _model.cantidad!;
                                            });
                                          }
                                        }
                                      },
                                      stepSize: 1,
                                      minimum: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Descripción',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 5.0, 25.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.htmlToText(getJsonField(
                                    widget.datosProducto,
                                    r'''$.short_description''',
                                  ).toString()),
                                  'Descripción',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 25.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Categorías:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final categoriasP = getJsonField(
                                        widget.datosProducto,
                                        r'''$.categories''',
                                      ).toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            List.generate(categoriasP.length,
                                                (categoriasPIndex) {
                                          final categoriasPItem =
                                              categoriasP[categoriasPIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  categoriasPItem,
                                                  r'''$.name''',
                                                )?.toString(),
                                                'Cat',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'Productos relacionados',
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
                            if (getJsonField(
                                  widget.datosProducto,
                                  r'''$.related_ids''',
                                ) !=
                                null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 70.0),
                                child: Builder(
                                  builder: (context) {
                                    final productosRelacionados =
                                        _model.productosRelacionado.toList();

                                    return Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      child: CarouselSlider.builder(
                                        itemCount: productosRelacionados.length,
                                        itemBuilder: (context,
                                            productosRelacionadosIndex, _) {
                                          final productosRelacionadosItem =
                                              productosRelacionados[
                                                  productosRelacionadosIndex];
                                          return FutureBuilder<ApiCallResponse>(
                                            future: WooCommerceAPIGroup
                                                .productoIDbuscarCall
                                                .call(
                                              idProducto: _model
                                                  .productosRelacionado
                                                  .elementAtOrNull(
                                                      productosRelacionadosIndex)
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
                                                      color: Color(0xFF29ABE2),
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerProductoIDbuscarResponse =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ProductoWidget.routeName,
                                                    queryParameters: {
                                                      'datosProducto':
                                                          serializeParam(
                                                        containerProductoIDbuscarResponse
                                                            .jsonBody,
                                                        ParamType.JSON,
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
                                                child: Container(
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                                                  productosRelacionados.length -
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
                            if (getJsonField(
                                  widget.datosProducto,
                                  r'''$.related_ids''',
                                ) ==
                                null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 70.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'No hay productos relacionados',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.countControllerValue! > 0) {
                                    context.pushNamed(
                                      CarritoCompraInmediataWidget.routeName,
                                      queryParameters: {
                                        'articulo': serializeParam(
                                          widget.datosProducto,
                                          ParamType.JSON,
                                        ),
                                        'cantidad': serializeParam(
                                          _model.countControllerValue
                                              ?.toDouble(),
                                          ParamType.double,
                                        ),
                                        'listaRelacionados': serializeParam(
                                          functions
                                              .listaNumerosJson(getJsonField(
                                            widget.datosProducto,
                                            r'''$.related_ids''',
                                            true,
                                          )!),
                                          ParamType.int,
                                          isList: true,
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
                                },
                                text: 'Comprar Ahora',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.countControllerValue! > 0) {
                                    if (FFAppState().idOrdenCarritoCreada ==
                                        0) {
                                      _model.addCarrito =
                                          await EndpointCustomGroup
                                              .agregarArticulosCarritoCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                        idProducto: getJsonField(
                                          widget.datosProducto,
                                          r'''$.id''',
                                        ),
                                        cantidad: _model.countControllerValue,
                                      );

                                      _model.nuevocarrito =
                                          await EndpointCustomGroup
                                              .obtenerCarritoCall
                                              .call(
                                        idCustomer:
                                            FFAppState().idCustomerTemporal,
                                      );

                                      FFAppState().carrito =
                                          (_model.nuevocarrito?.jsonBody ?? '');
                                      FFAppState()
                                              .productosRelacionadosCarrito =
                                          functions
                                              .concatenarListasEnteros(
                                                  FFAppState()
                                                      .productosRelacionadosCarrito
                                                      .toList(),
                                                  functions
                                                      .listaNumerosJson(
                                                          getJsonField(
                                                        widget.datosProducto,
                                                        r'''$.related_ids''',
                                                        true,
                                                      )!)
                                                      .toList())
                                              .toList()
                                              .cast<int>();
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.countControllerValue = 1;
                                      });
                                    } else {
                                      _model.ordenActualCreada =
                                          await WooCommerceAPIGroup
                                              .obtenerPedidoIDCall
                                              .call(
                                        idOrden:
                                            FFAppState().idOrdenCarritoCreada,
                                      );

                                      _model.nuavosArticulosOrden =
                                          await WooCommerceAPIGroup
                                              .agregarArticulosOrdenExistenteCall
                                              .call(
                                        idOrden:
                                            FFAppState().idOrdenCarritoCreada,
                                        productsJson: functions
                                            .agregarProductoOrdenExistente(
                                                getJsonField(
                                                  (_model.ordenActualCreada
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.line_items''',
                                                  true,
                                                )!,
                                                getJsonField(
                                                  widget.datosProducto,
                                                  r'''$.id''',
                                                ),
                                                _model.countControllerValue!),
                                      );

                                      _model.carritoOrdenCreada =
                                          await WooCommerceAPIGroup
                                              .obtenerPedidoIDCall
                                              .call(
                                        idOrden:
                                            FFAppState().idOrdenCarritoCreada,
                                      );

                                      FFAppState().carrito =
                                          functions.formatoCarritoORdenCreada(
                                              getJsonField(
                                        (_model.carritoOrdenCreada?.jsonBody ??
                                            ''),
                                        r'''$.line_items''',
                                        true,
                                      )!);
                                      FFAppState()
                                              .productosRelacionadosCarrito =
                                          functions
                                              .concatenarListasEnteros(
                                                  FFAppState()
                                                      .productosRelacionadosCarrito
                                                      .toList(),
                                                  functions
                                                      .listaNumerosJson(
                                                          getJsonField(
                                                        widget.datosProducto,
                                                        r'''$.related_ids''',
                                                        true,
                                                      )!)
                                                      .toList())
                                              .toList()
                                              .cast<int>();
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.countControllerValue = 1;
                                      });
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text:
                                    'Añadir a carrito ${valueOrDefault<String>(
                                  _model.countControllerValue?.toString(),
                                  '0',
                                )}',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(15.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
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
                  pagina: 'tienda',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

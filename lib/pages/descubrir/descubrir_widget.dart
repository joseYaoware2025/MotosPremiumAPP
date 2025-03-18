import '';
import '/backend/api_requests/api_calls.dart';
import '/components/carta_producto/carta_producto_widget.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_no_hay_productos/mensaje_no_hay_productos_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'descubrir_model.dart';
export 'descubrir_model.dart';

class DescubrirWidget extends StatefulWidget {
  const DescubrirWidget({
    super.key,
    required this.busquedaInicial,
  });

  final String? busquedaInicial;

  static String routeName = 'Descubrir';
  static String routePath = '/descubrir';

  @override
  State<DescubrirWidget> createState() => _DescubrirWidgetState();
}

class _DescubrirWidgetState extends State<DescubrirWidget> {
  late DescubrirModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescubrirModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.busquedaInicial != null && widget!.busquedaInicial != '') {
        safeSetState(() {
          _model.textController?.text = widget!.busquedaInicial!;
        });
        _model.busqueda = widget!.busquedaInicial;
        safeSetState(() {});
        _model.busquedaIncial =
            await WooCommerceAPIGroup.buscarProductosCall.call(
          nameProd: _model.busqueda,
        );

        _model.resultadoBusqueda =
            (_model.busquedaIncial?.jsonBody ?? '').toList().cast<dynamic>();
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
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(
                InicioWidget.routeName,
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
          flexibleSpace: FlexibleSpaceBar(
            title: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/420165191_863069659158651_35324203450046437_n-removebg-preview.png',
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          toolbarHeight: 100.0,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.busqueda =
                                              _model.textController.text;
                                          _model.pagina = 1;
                                          safeSetState(() {});
                                          _model.busquedaChange =
                                              await WooCommerceAPIGroup
                                                  .buscarProductosCall
                                                  .call(
                                            nameProd: _model.busqueda,
                                          );

                                          if ((_model
                                                  .busquedaChange?.succeeded ??
                                              true)) {
                                            _model.resultadoBusqueda = (_model
                                                        .busquedaChange
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        _model.pagina = 1;
                                        _model.busqueda =
                                            _model.textController.text;
                                        safeSetState(() {});
                                        _model.busqueaSubmit =
                                            await WooCommerceAPIGroup
                                                .buscarProductosCall
                                                .call(
                                          nameProd: _model.busqueda,
                                        );

                                        _model.resultadoBusqueda =
                                            (_model.busqueaSubmit?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                        alignLabelWithHint: false,
                                        hintText: 'Buscar...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFA39F9F),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFA39F9F),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFA39F9F),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFA39F9F),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFA39F9F),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFFA39F9F),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFA39F9F),
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor: Colors.transparent,
                                  icon: Icon(
                                    Icons.close,
                                    color: Color(0xFFA39F9F),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                    _model.pagina = 1;
                                    _model.busqueda = null;
                                    safeSetState(() {});
                                    _model.pasarelaReset =
                                        await WooCommerceAPIGroup
                                            .pasarelaProductosCall
                                            .call(
                                      page: _model.pagina,
                                    );

                                    _model.resultadoBusqueda =
                                        (_model.pasarelaReset?.jsonBody ?? '')
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.divisorModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DivisorWidget(),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 0.0, 1.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final listaBusqueda =
                                        _model.resultadoBusqueda.toList();

                                    return RefreshIndicator(
                                      color: Color(0xFF29ABE2),
                                      backgroundColor: Color(0xFF6E6E6E),
                                      onRefresh: () async {},
                                      child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: valueOrDefault<int>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 1;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 2;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .height <
                                                  kBreakpointLarge) {
                                                return 3;
                                              } else {
                                                return 4;
                                              }
                                            }(),
                                            1,
                                          ),
                                          crossAxisSpacing: 1.0,
                                          mainAxisSpacing: 1.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: listaBusqueda.length,
                                        itemBuilder:
                                            (context, listaBusquedaIndex) {
                                          final listaBusquedaItem =
                                              listaBusqueda[listaBusquedaIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ProductoWidget.routeName,
                                                queryParameters: {
                                                  'datosProducto':
                                                      serializeParam(
                                                    listaBusquedaItem,
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
                                            child: wrapWithModel(
                                              model: _model.cartaProductoModels
                                                  .getModel(
                                                getJsonField(
                                                  listaBusquedaItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                listaBusquedaIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CartaProductoWidget(
                                                key: Key(
                                                  'Key6u9_${getJsonField(
                                                    listaBusquedaItem,
                                                    r'''$.id''',
                                                  ).toString()}',
                                                ),
                                                dataProducto: listaBusquedaItem,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        borderRadius: 100.0,
                                        buttonSize: 45.0,
                                        fillColor: Colors.white,
                                        icon: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                        onPressed: () async {
                                          _model.pagina = functions
                                              .paginaAtras(_model.pagina);
                                          safeSetState(() {});
                                          if (_model.pagina > 0) {
                                            _model.paginaAntras =
                                                await WooCommerceAPIGroup
                                                    .buscarProductosCall
                                                    .call(
                                              nameProd:
                                                  _model.textController.text,
                                              page: _model.pagina,
                                            );

                                            _model.resultadoBusqueda = (_model
                                                        .paginaAntras
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.pagina.toString(),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        borderRadius: 100.0,
                                        buttonSize: 45.0,
                                        fillColor: Colors.white,
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                        onPressed: () async {
                                          _model.pagina = functions
                                              .paginaSiguiente(_model.pagina);
                                          safeSetState(() {});
                                          _model.paginaSiguiente =
                                              await WooCommerceAPIGroup
                                                  .buscarProductosCall
                                                  .call(
                                            nameProd:
                                                _model.textController.text,
                                            page: _model.pagina,
                                          );

                                          _model.resultadoBusqueda = (_model
                                                      .paginaSiguiente
                                                      ?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                          safeSetState(() {});
                                          if (_model.resultadoBusqueda.length <=
                                              0) {
                                            _model.pagina = functions
                                                .paginaAtras(_model.pagina);
                                            safeSetState(() {});
                                            _model.paginaAnteriorUltima =
                                                await WooCommerceAPIGroup
                                                    .buscarProductosCall
                                                    .call(
                                              nameProd:
                                                  _model.textController.text,
                                              page: _model.pagina,
                                            );

                                            _model.resultadoBusqueda = (_model
                                                        .paginaAnteriorUltima
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    ].divide(SizedBox(width: 20.0)),
                                  ),
                                ),
                              ),
                              if (_model.resultadoBusqueda.length == 0)
                                wrapWithModel(
                                  model: _model.mensajeNoHayProductosModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MensajeNoHayProductosWidget(),
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
                    pagina: 'tienda',
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

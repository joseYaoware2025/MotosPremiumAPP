import '';
import '/backend/api_requests/api_calls.dart';
import '/components/carta_producto/carta_producto_widget.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_no_hay_productos/mensaje_no_hay_productos_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'accesorios_model.dart';
export 'accesorios_model.dart';

class AccesoriosWidget extends StatefulWidget {
  const AccesoriosWidget({
    super.key,
    required this.idMarcaAccesorio,
    required this.nombreMarcaAccesorio,
  });

  final int? idMarcaAccesorio;
  final String? nombreMarcaAccesorio;

  static String routeName = 'Accesorios';
  static String routePath = '/accesorios';

  @override
  State<AccesoriosWidget> createState() => _AccesoriosWidgetState();
}

class _AccesoriosWidgetState extends State<AccesoriosWidget> {
  late AccesoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccesoriosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.busqueda = '';
      safeSetState(() {});
      _model.cargaIncialPasarela =
          await WooCommerceAPIGroup.searchCategoriaProductosCall.call(
        idCategoria: widget.idMarcaAccesorio,
      );

      _model.resultadoBusqueda =
          (_model.cargaIncialPasarela?.jsonBody ?? '').toList().cast<dynamic>();
      safeSetState(() {});
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).info,
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  'Accesorios',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.nombreMarcaAccesorio,
                  'Marca',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
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
                        Row(
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
                                        _model.pagina = 1;
                                        _model.busqueda =
                                            _model.textController.text;
                                        safeSetState(() {});
                                        _model.busquedaEnAccesorios =
                                            await WooCommerceAPIGroup
                                                .searchCategoriaProductosCall
                                                .call(
                                          idCategoria: widget.idMarcaAccesorio,
                                          nombreProducto: _model.busqueda,
                                        );

                                        if ((_model.busquedaEnAccesorios
                                                ?.succeeded ??
                                            true)) {
                                          _model.resultadoBusqueda = (_model
                                                      .busquedaEnAccesorios
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
                                      _model.busqueda =
                                          _model.textController.text;
                                      _model.pagina = 1;
                                      safeSetState(() {});
                                      _model.busquedaEnAccesoriosCopy =
                                          await WooCommerceAPIGroup
                                              .searchCategoriaProductosCall
                                              .call(
                                        idCategoria: widget.idMarcaAccesorio,
                                        nombreProducto: _model.busqueda,
                                      );

                                      _model.resultadoBusqueda = (_model
                                                  .busquedaEnAccesoriosCopy
                                                  ?.jsonBody ??
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
                                  _model.resultadoBusqueda = [];
                                  _model.busqueda = null;
                                  _model.pagina = 1;
                                  safeSetState(() {});
                                  _model.busquedaAccesoriosReset =
                                      await WooCommerceAPIGroup
                                          .searchCategoriaProductosCall
                                          .call(
                                    idCategoria: widget.idMarcaAccesorio,
                                  );

                                  _model.resultadoBusqueda = (_model
                                              .busquedaAccesoriosReset
                                              ?.jsonBody ??
                                          '')
                                      .toList()
                                      .cast<dynamic>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        wrapWithModel(
                          model: _model.divisorModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DivisorWidget(
                            fondo: 'blanco',
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              if (_model.resultadoBusqueda.length > 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1.0, 0.0, 1.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final pasarelaAccesoriosBusqueda =
                                          _model.resultadoBusqueda.toList();

                                      return GridView.builder(
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
                                        itemCount:
                                            pasarelaAccesoriosBusqueda.length,
                                        itemBuilder: (context,
                                            pasarelaAccesoriosBusquedaIndex) {
                                          final pasarelaAccesoriosBusquedaItem =
                                              pasarelaAccesoriosBusqueda[
                                                  pasarelaAccesoriosBusquedaIndex];
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
                                                    pasarelaAccesoriosBusquedaItem,
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
                                                  pasarelaAccesoriosBusquedaItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                pasarelaAccesoriosBusquedaIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CartaProductoWidget(
                                                key: Key(
                                                  'Key8tw_${getJsonField(
                                                    pasarelaAccesoriosBusquedaItem,
                                                    r'''$.id''',
                                                  ).toString()}',
                                                ),
                                                dataProducto:
                                                    pasarelaAccesoriosBusquedaItem,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (_model.resultadoBusqueda.length == 0)
                                wrapWithModel(
                                  model: _model.mensajeNoHayProductosModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MensajeNoHayProductosWidget(),
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
                                          _model.paginaAtras =
                                              await WooCommerceAPIGroup
                                                  .searchCategoriaProductosCall
                                                  .call(
                                            idCategoria:
                                                widget.idMarcaAccesorio,
                                            nombreProducto: _model.busqueda,
                                            page: _model.pagina,
                                          );

                                          _model.resultadoBusqueda =
                                              (_model.paginaAtras?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .cast<dynamic>();
                                          safeSetState(() {});

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
                                                  .searchCategoriaProductosCall
                                                  .call(
                                            idCategoria:
                                                widget.idMarcaAccesorio,
                                            nombreProducto: _model.busqueda,
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
                                            _model.paginaAtrasFinal =
                                                await WooCommerceAPIGroup
                                                    .searchCategoriaProductosCall
                                                    .call(
                                              idCategoria:
                                                  widget.idMarcaAccesorio,
                                              nombreProducto: _model.busqueda,
                                              page: _model.pagina,
                                            );

                                            _model.resultadoBusqueda = (_model
                                                        .paginaAtrasFinal
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

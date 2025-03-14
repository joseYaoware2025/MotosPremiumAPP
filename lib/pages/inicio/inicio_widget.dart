import '';
import '/components/card_marcas/card_marcas_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/politicade_privacidad/politicade_privacidad_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'inicio_model.dart';
export 'inicio_model.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  static String routeName = 'Inicio';
  static String routePath = '/inicio';

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget>
    with TickerProviderStateMixin {
  late InicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().validarLecturaAvisoPrivacidad == false) {
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
                  child: PoliticadePrivacidadWidget(),
                ),
              ),
            );
          },
        );
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/420165191_863069659158651_35324203450046437_n-removebg-preview.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 5.0),
              ),
              toolbarHeight: 100.0,
              elevation: 2.0,
            ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
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
                                            _model.textfieldlleno = false;
                                            safeSetState(() {});
                                          },
                                        ),
                                        onFieldSubmitted: (_) async {
                                          if (_model.textController.text !=
                                                  '') {
                                            context.pushNamed(
                                              DescubrirWidget.routeName,
                                              queryParameters: {
                                                'busquedaInicial':
                                                    serializeParam(
                                                  _model.textController.text,
                                                  ParamType.String,
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
                                            _model.textfieldlleno = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.black,
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: false,
                                          hintText: 'Buscar...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFFA39F9F),
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.textfieldlleno ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.textfieldlleno ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.textfieldlleno ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.textfieldlleno ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : Color(0xFFFF0000),
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
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
                                      Icons.check,
                                      color: Color(0xFFA39F9F),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (_model.textController.text != '') {
                                        context.pushNamed(
                                          DescubrirWidget.routeName,
                                          queryParameters: {
                                            'busquedaInicial': serializeParam(
                                              _model.textController.text,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      } else {
                                        _model.textfieldlleno = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              letterSpacing: 0.0,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    tabs: [
                                      Tab(
                                        text: 'Refacciones',
                                      ),
                                      Tab(
                                        text: 'Accesorios',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 20.0, 5.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final mostrarMarcas =
                                                  FFAppConstants.marcasTemporal
                                                      .toList();

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      valueOrDefault<int>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 1;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 2;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 3;
                                                      } else {
                                                        return 4;
                                                      }
                                                    }(),
                                                    1,
                                                  ),
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 20.0,
                                                  childAspectRatio: 1.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: mostrarMarcas.length,
                                                itemBuilder: (context,
                                                    mostrarMarcasIndex) {
                                                  final mostrarMarcasItem =
                                                      mostrarMarcas[
                                                          mostrarMarcasIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        RefaccionesWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'idMarcaRefaccion':
                                                              serializeParam(
                                                            FFAppConstants
                                                                .numeroCatMarca
                                                                .elementAtOrNull(
                                                                    mostrarMarcasIndex),
                                                            ParamType.int,
                                                          ),
                                                          'nombreMarcaRefaccion':
                                                              serializeParam(
                                                            FFAppConstants
                                                                .marcasTemporal
                                                                .elementAtOrNull(
                                                                    mostrarMarcasIndex),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
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
                                                      model: _model
                                                          .cardMarcasModels1
                                                          .getModel(
                                                        mostrarMarcasIndex
                                                            .toString(),
                                                        mostrarMarcasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: CardMarcasWidget(
                                                        key: Key(
                                                          'Key4li_${mostrarMarcasIndex.toString()}',
                                                        ),
                                                        nombre: FFAppConstants
                                                            .marcasTemporal
                                                            .elementAtOrNull(
                                                                mostrarMarcasIndex)!,
                                                        imagen: FFAppConstants
                                                            .urlImagesMarcas
                                                            .elementAtOrNull(
                                                                mostrarMarcasIndex)!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 20.0, 5.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final mostrarMarcas =
                                                  FFAppConstants
                                                      .marcasAccesorios
                                                      .toList();

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      valueOrDefault<int>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 1;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 2;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 3;
                                                      } else {
                                                        return 4;
                                                      }
                                                    }(),
                                                    1,
                                                  ),
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 20.0,
                                                  childAspectRatio: 1.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: mostrarMarcas.length,
                                                itemBuilder: (context,
                                                    mostrarMarcasIndex) {
                                                  final mostrarMarcasItem =
                                                      mostrarMarcas[
                                                          mostrarMarcasIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        AccesoriosWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'idMarcaAccesorio':
                                                              serializeParam(
                                                            FFAppConstants
                                                                .numCategoriaMarcaAccesorios
                                                                .elementAtOrNull(
                                                                    mostrarMarcasIndex),
                                                            ParamType.int,
                                                          ),
                                                          'nombreMarcaAccesorio':
                                                              serializeParam(
                                                            FFAppConstants
                                                                .marcasAccesorios
                                                                .elementAtOrNull(
                                                                    mostrarMarcasIndex),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
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
                                                      model: _model
                                                          .cardMarcasModels2
                                                          .getModel(
                                                        mostrarMarcasIndex
                                                            .toString(),
                                                        mostrarMarcasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: CardMarcasWidget(
                                                        key: Key(
                                                          'Keywvn_${mostrarMarcasIndex.toString()}',
                                                        ),
                                                        nombre: FFAppConstants
                                                            .marcasAccesorios
                                                            .elementAtOrNull(
                                                                mostrarMarcasIndex)!,
                                                        imagen: FFAppConstants
                                                            .urlImagenesAccesorios
                                                            .elementAtOrNull(
                                                                mostrarMarcasIndex)!,
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
                      pagina: 'inicio',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

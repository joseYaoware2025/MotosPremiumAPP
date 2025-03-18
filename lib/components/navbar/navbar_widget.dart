import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    String? pagina,
  }) : this.pagina = pagina ?? 'home';

  final String pagina;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 50.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.home_rounded,
                    color: widget!.pagina == 'inicio'
                        ? Color(0xFF29ABE2)
                        : Colors.black,
                    size: 20.0,
                  ),
                  onPressed: () async {
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
                  },
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
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
                  },
                  child: Text(
                    'Inicio',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: widget!.pagina == 'inicio'
                              ? Color(0xFF29ABE2)
                              : Colors.black,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 50.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: widget!.pagina == 'tienda'
                        ? Color(0xFF29ABE2)
                        : Colors.black,
                    size: 20.0,
                  ),
                  onPressed: () async {
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
                  },
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
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
                  },
                  child: Text(
                    'Tienda',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: widget!.pagina == 'tienda'
                              ? Color(0xFF29ABE2)
                              : Colors.black,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                badges.Badge(
                  badgeContent: Text(
                    functions
                                .obtenerDimencionArregloJSON(getJsonField(
                                  FFAppState().carrito,
                                  r'''$.products''',
                                  true,
                                )!)
                                .toString() !=
                            '0'
                        ? functions
                            .obtenerDimencionArregloJSON(getJsonField(
                              FFAppState().carrito,
                              r'''$.products''',
                              true,
                            )!)
                            .toString()
                        : '',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  showBadge: functions
                          .obtenerDimencionArregloJSON(getJsonField(
                            FFAppState().carrito,
                            r'''$.products''',
                            true,
                          )!)
                          .toString() !=
                      '0',
                  shape: badges.BadgeShape.circle,
                  badgeColor: FlutterFlowTheme.of(context).secondary,
                  elevation: 4.0,
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  position: badges.BadgePosition.topEnd(),
                  animationType: badges.BadgeAnimationType.scale,
                  toAnimate: true,
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 50.0,
                    fillColor: Colors.transparent,
                    icon: FaIcon(
                      FontAwesomeIcons.shoppingCart,
                      color: widget!.pagina == 'carrito'
                          ? Color(0xFF29ABE2)
                          : Colors.black,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        CarritoWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      CarritoWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Text(
                    'Carrito',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: widget!.pagina == 'carrito'
                              ? Color(0xFF29ABE2)
                              : Colors.black,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 50.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.person,
                    color: widget!.pagina == 'cuenta'
                        ? Color(0xFF29ABE2)
                        : Colors.black,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      CuentaWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      CuentaWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Text(
                    'Cuenta',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: widget!.pagina == 'cuenta'
                              ? Color(0xFF29ABE2)
                              : Colors.black,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

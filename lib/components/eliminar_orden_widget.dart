import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'eliminar_orden_model.dart';
export 'eliminar_orden_model.dart';

class EliminarOrdenWidget extends StatefulWidget {
  const EliminarOrdenWidget({
    super.key,
    required this.datosOrden,
    required this.idTabBar,
  });

  final int? datosOrden;
  final int? idTabBar;

  @override
  State<EliminarOrdenWidget> createState() => _EliminarOrdenWidgetState();
}

class _EliminarOrdenWidgetState extends State<EliminarOrdenWidget> {
  late EliminarOrdenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EliminarOrdenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Text(
                    '¿Estás seguro de querer cancelar?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'No',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                      FFButtonWidget(
                        onPressed: () async {
                          await WooCommerceAPIGroup.eliminarOrdenCall.call(
                            idOrden: widget.datosOrden,
                          );

                          _model.respuestaCarritoVaciado =
                              await EndpointCustomGroup.obtenerCarritoCall.call(
                            idCustomer: FFAppState().idCustomerTemporal,
                          );

                          FFAppState().carrito =
                              (_model.respuestaCarritoVaciado?.jsonBody ?? '');
                          FFAppState().idOrdenCarritoCreada = 0;
                          FFAppState().productosRelacionadosCarrito = [];
                          safeSetState(() {});

                          context.pushNamed(
                            SeguimientoPedidosWidget.routeName,
                            queryParameters: {
                              'idTabBar': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          safeSetState(() {});
                        },
                        text: 'Si',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                    ].divide(SizedBox(width: 40.0)),
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

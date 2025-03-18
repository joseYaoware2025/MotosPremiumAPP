import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_orden_model.dart';
export 'card_orden_model.dart';

class CardOrdenWidget extends StatefulWidget {
  const CardOrdenWidget({
    super.key,
    required this.datosOrden,
  });

  final dynamic datosOrden;

  @override
  State<CardOrdenWidget> createState() => _CardOrdenWidgetState();
}

class _CardOrdenWidgetState extends State<CardOrdenWidget> {
  late CardOrdenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardOrdenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '\$',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          getJsonField(
                            widget!.datosOrden,
                            r'''$.total''',
                          )?.toString(),
                          'Total',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        "y/M/d h:mm a",
                        functions.convertirFormatoFecha(getJsonField(
                          widget!.datosOrden,
                          r'''$.date_created''',
                        )),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      'Fecha Pedido',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                        child: Text(
                          'No. artículos:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions
                                .obtenerDimencionArregloJSON(getJsonField(
                                  widget!.datosOrden,
                                  r'''$.line_items''',
                                  true,
                                )!)
                                .toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF352525),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      () {
                        if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'completed') {
                          return 'Entregado';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'cancelled') {
                          return 'Cancelado';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'processing') {
                          return 'Por llegar';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'pending') {
                          return 'Por pagar';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'on-hold') {
                          return 'En espera';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'refunded') {
                          return 'Reembolsado';
                        } else if (functions.datosJsonaString(getJsonField(
                              widget!.datosOrden,
                              r'''$.status''',
                            )) ==
                            'failed') {
                          return 'Fallido';
                        } else {
                          return 'Status';
                        }
                      }(),
                      'Status',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: () {
                            if (functions.datosJsonaString(getJsonField(
                                  widget!.datosOrden,
                                  r'''$.status''',
                                )) ==
                                'cancelled') {
                              return Color(0xFFFF0000);
                            } else if (functions.datosJsonaString(getJsonField(
                                  widget!.datosOrden,
                                  r'''$.status''',
                                )) ==
                                'completed') {
                              return Color(0xFF51B62F);
                            } else if (functions.datosJsonaString(getJsonField(
                                  widget!.datosOrden,
                                  r'''$.status''',
                                )) ==
                                'pending') {
                              return Color(0xFFFADA67);
                            } else {
                              return FlutterFlowTheme.of(context).secondary;
                            }
                          }(),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (functions.datosJsonaString(getJsonField(
                        widget!.datosOrden,
                        r'''$.status''',
                      )) ==
                      'pending')
                    FlutterFlowIconButton(
                      borderColor: Colors.white,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFFF0000),
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await WooCommerceAPIGroup.eliminarOrdenCall.call(
                          idOrden: getJsonField(
                            widget!.datosOrden,
                            r'''$.id''',
                          ),
                        );
                      },
                    ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

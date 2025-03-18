import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'politicade_devoluciones_model.dart';
export 'politicade_devoluciones_model.dart';

class PoliticadeDevolucionesWidget extends StatefulWidget {
  const PoliticadeDevolucionesWidget({super.key});

  @override
  State<PoliticadeDevolucionesWidget> createState() =>
      _PoliticadeDevolucionesWidgetState();
}

class _PoliticadeDevolucionesWidgetState
    extends State<PoliticadeDevolucionesWidget> {
  late PoliticadeDevolucionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliticadeDevolucionesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.8,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Politica de Devoluciones',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    'Los medios para ejercer los derechos de acceso, rectificación, cancelación u oposición (Derechos ARCO). Para ejercer cualquier derecho ARCO, deberá hacerlo por escrito a la persona responsable, en la dirección ubicada en “Torre Tepeyac MZ279 LT2”; o, a través de un correo electrónico a contacto@motospremium.com.mx de www.motospremium.com.mx, tener que cumplir con las disposiciones de los artículos 29 y 31 de la LFPDP. Para ello, deberá adjuntar una copia de la identificación del titular; o una copia del poder otorgado ante un notario público que lo acredite como representante del titular y una copia única de la identificación del representante; así como la documentación que considere necesaria y apropiada para respaldar el derecho que desea ejercer.\n\nUna vez recibida la solicitud correspondiente, tendremos un período de 20 días hábiles para notificar al propietario sobre la respuesta a su solicitud. La respuesta a la solicitud antes mencionada se dará en el correo electrónico indicado por el titular, o se le notificará por teléfono a la indicada por el titular',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                  child: Text(
                    'Acepto haber leído la Politica de Devoluciones',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().validarLecturaPoliticasDevolucion = true;
                      safeSetState(() {});
                      Navigator.pop(context);
                    },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 45.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lato',
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
      ),
    );
  }
}

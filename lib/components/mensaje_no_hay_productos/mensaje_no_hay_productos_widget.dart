import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mensaje_no_hay_productos_model.dart';
export 'mensaje_no_hay_productos_model.dart';

class MensajeNoHayProductosWidget extends StatefulWidget {
  const MensajeNoHayProductosWidget({super.key});

  @override
  State<MensajeNoHayProductosWidget> createState() =>
      _MensajeNoHayProductosWidgetState();
}

class _MensajeNoHayProductosWidgetState
    extends State<MensajeNoHayProductosWidget> {
  late MensajeNoHayProductosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeNoHayProductosModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No hay productos por mostrar',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Colors.black,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}

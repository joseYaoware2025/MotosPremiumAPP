import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'divisor_model.dart';
export 'divisor_model.dart';

class DivisorWidget extends StatefulWidget {
  const DivisorWidget({
    super.key,
    String? fondo,
  }) : this.fondo = fondo ?? 'blanco';

  final String fondo;

  @override
  State<DivisorWidget> createState() => _DivisorWidgetState();
}

class _DivisorWidgetState extends State<DivisorWidget> {
  late DivisorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DivisorModel());
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
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(
              thickness: 1.0,
              color: () {
                if (widget.fondo == 'blanco') {
                  return Colors.black;
                } else if (widget.fondo == 'azul') {
                  return Colors.white;
                } else if (widget.fondo == 'gris') {
                  return Color(0xFFA39F9F);
                } else {
                  return Colors.black;
                }
              }(),
            ),
          ],
        ),
      ),
    );
  }
}

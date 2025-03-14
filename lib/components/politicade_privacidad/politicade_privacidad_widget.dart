import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'politicade_privacidad_model.dart';
export 'politicade_privacidad_model.dart';

class PoliticadePrivacidadWidget extends StatefulWidget {
  const PoliticadePrivacidadWidget({super.key});

  @override
  State<PoliticadePrivacidadWidget> createState() =>
      _PoliticadePrivacidadWidgetState();
}

class _PoliticadePrivacidadWidgetState
    extends State<PoliticadePrivacidadWidget> {
  late PoliticadePrivacidadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliticadePrivacidadModel());
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
                    'Aviso de Privacidad',
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
                    'En COMERCIALIZADORA PREMIUM SHOPS SA DE CV (en adelante denominado «MOTOS PREMIUM»), nos preocupamos por el uso, la seguridad, la protección y el manejo adecuados de sus datos personales; al observar los principios de legalidad, consentimiento, información, calidad, propósito, lealtad, proporcionalidad y responsabilidad, de conformidad con las disposiciones de la Ley Federal de Protección de Datos Personales en Posesión de Particulares (LFPDP), sus Reglamentos y la Privacidad Pautas de notificación publicadas por el Ministerio de Economía el 17 de enero de 2013 en el Diario Oficial de la Federación (en adelante denominadas colectivamente como la «Ley»), en consecuencia, a través de esta notificación, se da a conocer al propietario, de manera efectiva y oportuna de manera, el procesamiento de su información personal, por lo que en términos de los Artículos 15 de la LFPDP y 23 de su Reglamento, este aviso de privacidad se pone a su disposición, en los siguientes términos:\n\nI.- La identidad y dirección de la parte responsable.\nLa Compañía COMERCIALIZADORA PREMIUM SHOPS SA DE CV, es responsable del efecto según lo dispuesto en el Artículo 3 Párrafo XIV de la LFPDP que está domiciliada en “Torre Tepeyac MZ279 LT2 Santa María Guadalupe las Torres, Cuautitlan Izcalli Edo. De Mex.”. Además, las personas a cargo del procesamiento de datos personales de conformidad con las disposiciones del Artículo 3, párrafo IX de la LFPDP, en nombre de MOTOS PREMIUM responsable, se encuentran en la misma dirección mencionada anteriormente y pueden contactarse por teléfono al 55 3693 6450 , o, por correo electrónico a contacto@motospremium.com.mx de motospremium.com.mx, de 10:00 a 18:00 horas, de lunes a viernes, excepto festivos.\n\nII – Datos personales que se someten a procesamiento.\nLos datos personales del titular que se enviarán al procesamiento son: nombre completo, domicilio, dirección comercial, RFC, correo electrónico, teléfono, sitio web, sexo, nacionalidad, edad, fecha y lugar de nacimiento, número de cuenta bancaria y cuenta contraseña\n\nIII. – Forma de obtener datos personales.\nLos datos personales se recopilan directamente del propietario, ya sea mediante una entrevista personal, completando un formato físico, a través de la página de Internet www.motospremium.com.mx (rellenando algún cuestionario) o cualquier medio electrónico, por teléfono o cualquier otro medio conocido o ser conocida.\nDel mismo modo, una parte o parte de la información personal descrita anteriormente se puede obtener de cualquier fuente pública legal, como directorios públicos, exposiciones, ferias, simposios, conferencias, bases de datos de cualquier órgano de gobierno, ya sea federal, estatal o municipal, etc.\nNuestro sitio web www.motospremium.com.mx no utiliza cookies, balizas web o tecnologías similares para almacenar datos, estadísticas o preferencias de navegación.\n\nIV. – Los fines del procesamiento de datos.\nLos datos que nos proporcionan son para la elaboración de un contrato, la integración de su archivo administrativo, el procesamiento de pedidos, elaboración de guias para envíos a domicilio por terceros, las facturas, la gestión estadística del consumo, la publicidad y cualquier actividad administrativa resultante de nuestra relación contractual.\nEn ningún caso sus datos personales tendrán un uso diferente, a los descritos en este párrafo, a menos que haya un cambio en este Aviso de privacidad.\n\nV. – Las opciones y los medios para limitar el uso o divulgación de los datos.\nLos datos personales que se nos proporcionan están custodiados directamente por la persona a cargo, autorizada por MOTOS PREMIUM, quien realiza todas las acciones destinadas a proteger, mantener y proteger la privacidad de dichos datos personales. Sus datos están en una base de datos electrónica debidamente protegida y protegida por todos los medios tecnológicos a nuestra disposición.\nCualquier empleado o proveedor de servicios para obtener acceso a dichos datos personales ha celebrado previamente un acuerdo de confidencialidad con MOTOS PREMIUM, para mantener el secreto de dichos datos personales.\nSi por algún motivo descubrimos que un tercero ingresó a la base de datos, para haber copiado total o parcialmente la base de datos mencionada, se le notificará a través de nuestro sitio web en www.motospremium.com.mx; o por correo electrónico o en persona; para que pueda tomar las precauciones y acciones que considere apropiadas.',
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
                    'Acepto haber leído el Aviso de Privacidad',
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
                      FFAppState().validarLecturaAvisoPrivacidad = true;
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

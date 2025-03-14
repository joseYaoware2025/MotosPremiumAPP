import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/auth/custom_auth/auth_util.dart';

double totalCompraCarrito(
  double precioProductos,
  double costoEnvio,
) {
  double total = precioProductos + costoEnvio;
  return total;
}

double restaPrecioProducto(
  double precioActual,
  String precioResta,
) {
  double nprecioResta = double.parse(precioResta);
  double totalPrecio = precioActual - nprecioResta;
  return totalPrecio;
}

int? obtenerNumCat(int numCat) {
  int? myVariable;
  if (numCat == 0) {
    myVariable = null;
  } else {
    myVariable = numCat;
  }
  return myVariable;
}

String htmlToText(String htmlText) {
  String htmlContent = htmlText;
  String plainText = htmlContent.replaceAll(RegExp(r'<[^>]*>'), '');
  plainText = plainText.replaceAll('#', ' ');
  return plainText;
}

bool fechaValidacionCodigoDescuento(String fechaJson) {
  bool estado = false;
  // Convertir la cadena a DateTime
  DateTime fechaConvertida = DateTime.parse(fechaJson);

  // Obtener la fecha actual
  DateTime fechaActual = DateTime.now();

  // Comparar las fechas
  if (fechaConvertida.isBefore(fechaActual)) {
    estado = false;
  } else if (fechaConvertida.isAfter(fechaActual)) {
    estado = true;
  } else {
    estado = true;
  }
  return estado;
}

String datosJsonaString(dynamic datoJson) {
  //Esta funcion castea los datos obtenidos de un json a tipos de detos string

  // Esta función castea los datos obtenidos de un JSON a tipos de datos String
  // Asegúrate de que `datoJson` sea un mapa antes de intentar acceder a sus claves.
  return datoJson.toString();
}

DateTime convertirFormatoFecha(dynamic fechaJson) {
  // Parse la fecha como si fuera local, sin asumir UTC.
  //DateTime fechaConvertida = DateTime.parse(fechaJson).toLocal();

  // Si sabes que la entrada está en UTC y no especifica zona horaria:
  DateTime fechaConvertida =
      DateTime.parse(fechaJson).add(Duration(hours: -6)).toLocal();

  return fechaConvertida;
}

int obtenerDimencionArregloJSON(List<dynamic> arrayJson) {
  List<dynamic> array = arrayJson;
  int numItems = array.length;
  return numItems;
}

int obtenerIdT(String token) {
  try {
    // Divide el token en sus partes
    List<String> parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Token no válido');
    }

    // Decodifica la parte del payload
    String payload = parts[1];
    String normalizedPayload = base64Url.normalize(payload);
    String decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

    // Convierte el payload a un mapa
    Map<String, dynamic> jsonPayload = jsonDecode(decodedPayload);

    // Extrae el ID del usuario
    String userId = jsonPayload['data']['user']['id'];
    int id = int.parse(userId);
    return id;
  } catch (e) {
    print('Error al decodificar el token: $e');
  }
  return 0;
}

bool verificarValidezToken(String token) {
  // Verifica si el token está vacío o nulo
  if (token.isEmpty) return false;

  // Dividir el token en sus partes
  List<String> parts = token.split('.');
  if (parts.length != 3) return false; // No es un token válido

  // Decodificar la parte del payload
  String payload = parts[1];
  String normalizedPayload = base64Url.normalize(payload);
  Map<String, dynamic> decodedPayload;

  try {
    decodedPayload =
        json.decode(utf8.decode(base64Url.decode(normalizedPayload)));
  } catch (e) {
    return false; // Fallo al decodificar el payload
  }

  // Comprobar la fecha de expiración
  if (decodedPayload.containsKey('exp')) {
    DateTime expirationDate =
        DateTime.fromMillisecondsSinceEpoch(decodedPayload['exp'] * 1000);
    if (expirationDate.isBefore(DateTime.now())) {
      return false; // El token ha expirado
    }
  }

  return true; // El token es válido
}

String obtenerNombreUsuario(String correo) {
  return correo.split('@')[0];
}

int datoJsonAInt(dynamic datoJson) {
  return int.parse(datoJson['stock_quantity'] as String);
}

List<bool> validarContrasea(String contrasena) {
  // Verifica la longitud y los requisitos de caracteres
  bool tieneMinimoOchoCaracteres = contrasena.length >= 8;
  bool tieneMayuscula = RegExp(r'[A-Z]').hasMatch(contrasena);
  bool tieneMinusculas = RegExp(r'[a-z]').hasMatch(contrasena);
  bool tieneNumero = RegExp(r'[0-9]').hasMatch(contrasena);

  return [
    tieneMinimoOchoCaracteres,
    tieneMayuscula,
    tieneMinusculas,
    tieneNumero,
  ];
}

double formatoJsonADouble(dynamic jsonDato) {
  return double.parse(jsonDato['price'] as String);
}

double enteroAdouble(int enteroPrice) {
  return enteroPrice.toDouble();
}

double stringAdouble(String precio) {
  return double.parse(precio);
}

int stringAint(String numero) {
  return int.parse(numero);
}

List<dynamic> formatProductList(dynamic inputJson) {
  // Inicializamos una lista para almacenar cada producto como una lista de atributos en orden fijo
  List<List<dynamic>> productsList = [];

  // Obtenemos los productos y recorremos cada uno
  inputJson['products'].forEach((key, product) {
    productsList.add([
      product["product_id"], // ID del producto
      product["quantity"], // Cantidad
      product["price"], // Precio
      product["name"], // Nombre
      product["image_src"] // URL de la imagen
    ]);
  });

  // Retornamos una lista combinada con los productos y el total
  return [
    productsList, // Lista de productos formateada
    inputJson["total"] // Total
  ];
}

double calcularTotal(
  double subtotal,
  double discountTotal,
  double shippingTotal,
  double taxTotal,
) {
  double total = (subtotal - discountTotal) + shippingTotal + taxTotal;

  return total; // Retornar el total calculado
}

dynamic obtenerDirecciones(List<dynamic> inputJson) {
// Inicializar una lista para almacenar las direcciones
  List<Map<String, dynamic>> addresses = [];

  // Buscar el elemento con la clave "shipping_addresses"
  for (var item in inputJson) {
    if (item['key'] == 'shipping_addresses' && item['value'] != null) {
      // Agregar las direcciones a la lista
      addresses.addAll(List<Map<String, dynamic>>.from(item['value']));
    }
  }

  // Retornar las direcciones como un Map<String, dynamic>
  return {'shipping_addresses': addresses};
}

List<String> obtenerFechaExpiracionTarjeta(String fechaCaducidad) {
  // Dividir la fecha por el carácter '/'
  List<String> partes = fechaCaducidad.split('/');

  // Verificar que se han obtenido exactamente 2 partes
  if (partes.length == 2) {
    return partes; // Devuelve el array con el mes y el año
  } else {
    throw FormatException('Formato de fecha no válido. Se esperaba MM/YY.');
  }
}

double totalArticulosCompraInmediata(
  double precioArticulo,
  double cantidad,
) {
  double salida = precioArticulo * cantidad;

  return salida;
}

dynamic crearCarritoCompraInmediata(
  int productId,
  double quantity,
  double price,
  String name,
  String? imageSrc,
  double total,
) {
  return {
    "products": [
      {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "name": name,
        "image_src": imageSrc,
      }
    ],
    "total": total,
  };
}

bool verificarNumeroEnLista(
  String numero,
  List<String> lista,
) {
  return lista.contains(numero);
}

List<dynamic> agregarDireccionAdicional(
  List<dynamic> direccionesExistentes,
  String firstName,
  String lastName,
  String company,
  String address1,
  String city,
  String state,
  String postcode,
) {
  // Crear un mapa para la nueva dirección con los campos proporcionados
  Map<String, dynamic> nuevaDireccion = {
    "first_name": firstName,
    "last_name": lastName,
    "company": company,
    "address_1": address1,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": "MX"
  };

  // Añadir la nueva dirección a la lista existente
  direccionesExistentes.add(nuevaDireccion);

  // Retornar la lista actualizada
  return direccionesExistentes;
}

List<dynamic> eliminarDireccionEnvio(
  List<dynamic> direcciones,
  int indice,
) {
  // Verificar que el índice sea válido
  if (indice < 0 || indice >= direcciones.length) {
    throw RangeError('Índice fuera de rango');
  }

  // Eliminar la dirección en el índice especificado
  direcciones.removeAt(indice);

  // Retornar la lista actualizada
  return direcciones;
}

bool validacionFechaDevolucion(String dateModifiedString) {
  // Convierte la cadena de fecha a un objeto DateTime
  DateTime dateModified = DateTime.parse(dateModifiedString);

  // Obtén la fecha actual
  final currentDate = DateTime.now();

  // Calcula la diferencia en días entre la fecha actual y `dateModified`
  final differenceInDays = currentDate.difference(dateModified).inDays;

  // Retorna true si está dentro de los primeros 30 días, de lo contrario false
  return differenceInDays <= 30;
}

List<dynamic> agregarDireccionFacturacionAdicional(
  String firstName,
  String lastName,
  String company,
  String address1,
  String city,
  String state,
  String postcode,
  String email,
  String phone,
  List<dynamic> direccionesExistentes,
) {
  // Crear un mapa para la nueva dirección con los campos proporcionados
  Map<String, dynamic> nuevaDireccion = {
    "first_name": firstName,
    "last_name": lastName,
    "company": company,
    "address_1": address1,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": "MX",
    "email": email,
    "phone": phone
  };

  // Añadir la nueva dirección a la lista existente
  direccionesExistentes.add(nuevaDireccion);

  // Retornar la lista actualizada
  return direccionesExistentes;
}

dynamic obtenerDireccionesFacturacion(List<dynamic> inputJson) {
  // Inicializar una lista para almacenar las direcciones
  List<Map<String, dynamic>> addresses = [];

  // Buscar el elemento con la clave "shipping_addresses"
  for (var item in inputJson) {
    if (item['key'] == 'billing_addresses' && item['value'] != null) {
      // Agregar las direcciones a la lista
      addresses.addAll(List<Map<String, dynamic>>.from(item['value']));
    }
  }

  // Retornar las direcciones como un Map<String, dynamic>
  return {'billing_addresses': addresses};
}

int obtenerStockProducto(int stockQ) {
  return stockQ ?? 0;
}

String ajustarUrl(String url) {
  try {
    // Parsear la URL
    Uri parsedUrl = Uri.parse(url);

    // Eliminar el parámetro 'pay_for_order'
    Map<String, String> newQueryParameters =
        Map.from(parsedUrl.queryParameters);
    newQueryParameters.remove('pay_for_order');

    // Reconstruir la URL con los parámetros actualizados
    Uri updatedUrl = Uri(
      scheme: parsedUrl.scheme,
      host: parsedUrl.host,
      path: parsedUrl.path,
      queryParameters:
          newQueryParameters.isNotEmpty ? newQueryParameters : null,
    );

    return updatedUrl.toString();
  } catch (e) {
    // Manejo de errores (devuelve la URL original si algo falla)
    return url;
  }
}

bool rfcValidar(
  String rfc,
  String tipoPersona,
) {
  // Expresiones regulares para validar RFC
  RegExp rfcFisica = RegExp(r'^[A-Z&Ñ]{4}\d{6}[A-Z0-9]{3}$');
  RegExp rfcMoral = RegExp(r'^[A-Z&Ñ]{3}(\d{6})[A-Z0-9]{3}$');

  // Validación según el tipo de persona
  if (tipoPersona == 'fisica' && rfcFisica.hasMatch(rfc)) {
    return true; // RFC válido para persona física
  } else if (tipoPersona == 'moral' && rfcMoral.hasMatch(rfc)) {
    return true; // RFC válido para persona moral
  } else {
    return false; // RFC inválido
  }
}

String stringToMayusculas(String cadena) {
  return cadena.toUpperCase();
}

List<dynamic> optimizeLineItems(List<dynamic> carrito) {
  // Validar que el carrito no sea nulo o vacío
  if (carrito == null || carrito.isEmpty) {
    print("Carrito vacío o nulo");
    return [];
  }

  // Procesar los elementos del carrito
  return carrito
      .map((item) {
        // Validar que cada item sea un mapa y tenga las claves necesarias
        if (item is Map<String, dynamic> &&
            item.containsKey("product_id") &&
            item.containsKey("quantity")) {
          return {
            "product_id": item["product_id"],
            "quantity": item["quantity"],
          };
        } else {
          print("Elemento inválido: $item");
          return null; // Manejo en caso de datos inválidos
        }
      })
      .where((item) => item != null)
      .toList(); // Filtrar nulos
}

bool validarDireccionEmail(String correo) {
  // Expresión regular para validar el formato del correo electrónico
  final RegExp regex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  // Retorna true si el correo cumple con la expresión regular, de lo contrario false
  return regex.hasMatch(correo);
}

bool validarSizeNumeros(
  String numero,
  int cantidad,
) {
  int tamanio = numero.length;
  if (tamanio == cantidad) {
    return true;
  }
  return false;
}

int paginaAtras(int pagina) {
  if (pagina > 1) {
    pagina -= 1;
  } else if (pagina <= 0) {
    pagina = 0;
  } else if (pagina == 1) {
    pagina = 1;
  }
  return pagina;
}

int paginaSiguiente(int pagina) {
  pagina += 1;
  return pagina;
}

dynamic formatoCarritoORdenCreada(List<dynamic> listItem) {
  Map<String, dynamic> result = {
    "products": [],
    "total": 0,
  };

  // Iterar sobre cada producto en el JSON de entrada
  for (var item in listItem) {
    // Crear el formato deseado para cada producto
    Map<String, dynamic> product = {
      "product_id": item["product_id"],
      "name": item["name"],
      "quantity": item["quantity"],
      "price": item["price"].toString(),
      "image_url": item["image"] != null ? item["image"]["src"] : null,
    };

    // Agregar el producto transformado al array
    result["products"].add(product);

    // Sumar al total
    result["total"] += item["price"] * item["quantity"];
  }

  return result;
}

List<dynamic> agregarProductoOrdenExistente(
  List<dynamic> carritoActual,
  int idProducto,
  int cantidad,
) {
  // Normalizar campos en los elementos existentes del carrito
  for (var item in carritoActual) {
    if (item['parent_name'] == null || item['parent_name'] is! String) {
      item['parent_name'] = ""; // Asegurar que sea una cadena vacía
    }
  }
  // Buscar si el producto ya existe en el carrito
  bool productExists = false;
  for (var item in carritoActual) {
    if (item['product_id'] == idProducto) {
      // Si el producto ya existe, actualizamos la cantidad
      item['quantity'] += cantidad;
      productExists = true;
      break;
    }
  }

  // Si el producto no existe, lo agregamos al carrito
  if (!productExists) {
    Map<String, dynamic> nuevoProducto = {
      //"id": null, // Campo `id` debe ser `null` o no incluirse para nuevos productos
      //"name": "Producto nuevo",
      "product_id": idProducto, // Identificador del producto
      //"variation_id": 0,
      "quantity": cantidad,
      /*"tax_class": "",
      "subtotal": "0.00",
      "subtotal_tax": "0.00",
      "total": "0.00",
      "total_tax": "0.00",
      "taxes": [],
      "meta_data": [],
      "sku": "",
      "price": 0,
      "image": {"id": 0, "src": ""},
      "parent_name": ""*/
    };

    // Agregar el nuevo producto al carrito
    carritoActual.add(nuevoProducto);
  }

  return carritoActual;
}

List<dynamic> eliminarProductoOrdenExistente(
  List<dynamic> listitems,
  int numItem,
) {
  // Buscar si el producto ya existe en el carrito
  if (numItem >= 0 && numItem < listitems.length) {
    // Elimina el producto en el índice especificado
    listitems.removeAt(numItem);
  }
  return listitems;
}

int numeroCaracteresTexto(double ancho) {
  int anchoCaracterPromedio = 12;
  ancho = ancho - 40;
  int numeroC = (ancho / anchoCaracterPromedio).toInt() * 2;
  return numeroC;
}

List<int> concatenarListasEnteros(
  List<int> listaOriginal,
  List<int> listasElementosNuevos,
) {
  List<int> nuevalista = [];
  for (int i = 0; i < listaOriginal.length; i++) {
    nuevalista.add(listaOriginal[i]);
  }
  for (int i = 0; i < listasElementosNuevos.length; i++) {
    if (!nuevalista.contains(listasElementosNuevos[i])) {
      nuevalista.add(listasElementosNuevos[i]);
    }
  }
  return nuevalista;
}

List<int> listaNumerosJson(List<dynamic> listaJson) {
  return listaJson.map((e) => int.tryParse(e.toString()) ?? 0).toList();
}

dynamic agregarProductosCarritoCR(
  dynamic productosExistente,
  int productId,
  double quantity,
  double price,
  String name,
  String? imageSrc,
) {
  dynamic nuevoProducto = {
    "product_id": productId,
    "quantity": quantity,
    "price": price,
    "name": name,
    "image_src": imageSrc ?? "",
  };
  bool bandera = false;
  // Agregar el nuevo producto a la lista existente
  for (int i = 0; i < productosExistente["products"].length; i++) {
    if (productosExistente["products"][i]["product_id"] == productId) {
      productosExistente["products"][i]["quantity"] = double.parse(
              productosExistente["products"][i]["quantity"].toString()) +
          quantity;
      bandera = true;
    }
  }
  if (bandera == false) {
    productosExistente["products"].add(nuevoProducto);
  }

  productosExistente["total"] += price * quantity;

  // Retornar la lista actualizada
  return productosExistente;
}

String datoJsonaString(dynamic dato) {
  String datoString = dato.toString();
  return datoString;
}

int datoJsonaInt(dynamic dato) {
  int datoInt = (dato as double).toInt();
  return datoInt;
}

double datoJsonaDouble(dynamic dato) {
  String datoS = dato.toString();
  double datoDouble = double.parse(datoS);
  return datoDouble;
}

double sumaDoubles(
  double subtotal,
  double nuevoPrecio,
) {
  double total = subtotal + nuevoPrecio;
  return total;
}

dynamic removerArticuloCarritoRapido(
  dynamic carritoEstructura,
  int indice,
) {
  double costo = 0;
  int cantidad = 0;
  for (int i = 0; i < carritoEstructura["products"].length; i++) {
    if (indice == i) {
      costo = carritoEstructura["products"][i]["price"];
      cantidad = carritoEstructura["products"][i]["quantity"];
    }
  }
  carritoEstructura["products"].removeAt(indice);
  carritoEstructura["total"] = carritoEstructura["total"] - (costo * cantidad);
  if (carritoEstructura["total"] < 0) {
    carritoEstructura["total"] = 0;
  }
  return carritoEstructura;
}

double restaDoubles(
  double subtotal,
  double precio,
  int cantidad,
) {
  return subtotal - (precio * cantidad);
}

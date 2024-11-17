import 'dart:io'; //este para recibir entrada por consola

void main() {
  print("Echo por Valeria.");
  Menu menu = new Menu();
  menu.menuPrincipal();
}
class Menu {
  menuPrincipal() {
    X funciones = new X();
    stdout.write(
        "\nElige la opcion: \n1:Ver platillos\n2:BuscarPlatillo\n3:Modificar  precio de un platillo\n4:Salir:\n  ");
    var opcion = stdin.readLineSync();
    switch (opcion) {
      case '1':
        funciones.menuPlatillos();
        menuPrincipal();
      case '2':
        funciones.buscarPlatillo();
        menuPrincipal();
      case '3':
        funciones.modificarPlatillo();
        menuPrincipal();
      case '4':
        print("saliendo");
        break;
      default:
        menuPrincipal();
    }
  }
}

var platillos = {
  "Pasta": 30,
  "Mole con Pollo": 190,
  "Chicken Mixiote": 150,
  "Roasted meat dish": 200,
  "Barbecue Dish": 200
};

class X {
  //1 Creamos el mapa

  menuPlatillos() {
    print("\n------------------\nMenu de la casa:");
    platillos.forEach((key, value) {
      print('$key:  $value');
    });
  }

  buscarPlatillo() {
    stdout.write(
        "Ingresa correctamente el nombre del platillo que deceas buscar: ");
    var nombre = stdin.readLineSync();
    int cont = 0;
    platillos.forEach((key, valor) {
      if (nombre != null) {
        if (nombre.toLowerCase() == key.toLowerCase()) {
          print("\nEl precio del platillo $key es de $valor pesos");
          cont = 1;
        }
      }
    });
    if (cont == 0) {
      print("\nEl platillo $nombre no existe");
    }
  }

  modificarPlatillo() {
    stdout.write("\nEscribe el nombre del platillo: ");
    var nombre = stdin.readLineSync();
    if (platillos.containsKey(nombre)) {
      print("existe $nombre");
      stdout.write("Escribe el nuevo precio: ");
      var nuevoPrecio = stdin.readLineSync();
      try {
        platillos['$nombre'] = int.parse(nuevoPrecio!);
        print("precio corregido correctamente");
      } catch (e) {
        print("error al actualizar el platillo");
      }
    } else {
      print("El platillo  $nombre  que decea modificar no existe");
    }
  }
}

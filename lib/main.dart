import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario
import 'package:movieapp_200749/home.dart'; // Importa el archivo home.dart que contiene la definición de la clase Home

void main() {
  // Función principal del programa
  runApp(new MaterialApp(
    // Inicializa la aplicación Flutter
    debugShowCheckedModeBanner:
        false, // Desactiva la etiqueta de depuración en la esquina superior derecha de la aplicación
    home:
        Home(), // Define la pantalla de inicio de la aplicación como una instancia de la clase Home

  ));
}

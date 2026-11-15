import 'package:material_ui/material_ui.dart';

// =====================================================================
// COLORES DE LA APLICACIÓN
// Todos los colores del diseño están aquí, en un solo sitio.
// Si hay que cambiar un color, se cambia aquí y cambia en toda la app.
// =====================================================================
class AppColors {
  // Fondo general de la pantalla (gris casi negro)
  static const Color background = Color(0xFF131418);

  // Marcador superior: fondo, borde y la "pastilla" central de los puntos
  static const Color headerBackground = Color(0xFF1F2024);
  static const Color headerBorder = Color(0xFF6B6C70);
  static const Color pillBackground = Color(0xFF0F1013);
  static const Color vsText = Color(0xFF9CA3AF);

  // Equipo local (azul): color de los botones y color oscuro del centro
  static const Color localMain = Color(0xFF3B82F6);
  static const Color localDark = Color(0xFF2D62B5);

  // Equipo visitante (rojo): botones, centro oscuro y texto del marcador
  static const Color visitMain = Color(0xFFDC2626);
  static const Color visitDark = Color(0xFF9B2222);
  static const Color visitLabel = Color(0xFFEF4444);

  // Botón RESET
  static const Color resetBackground = Color(0xFF2A2B30);
  static const Color resetBorder = Color(0xFF8A8B90);

  // Color de los textos e iconos
  static const Color text = Colors.white;
}

// =====================================================================
// ESTILOS DE TEXTO
// Tamaños y grosores de letra de cada texto de la interfaz.
// La fuente es Roboto, la que usa Flutter por defecto en Android.
// =====================================================================
class AppTextStyles {
  // Título "MARCADOR" de la barra superior
  static const TextStyle appTitle = TextStyle(
    color: AppColors.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Textos "LOCAL" y "VISITA" del marcador superior
  // (el color se pone en el widget, porque cada uno tiene el suyo)
  static const TextStyle headerLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  // Números pequeños del marcador superior
  static const TextStyle headerScore = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Texto "VS" del centro del marcador superior
  static const TextStyle vs = TextStyle(
    color: AppColors.vsText,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  // Número grande del centro de cada tarjeta
  static const TextStyle bigScore = TextStyle(
    color: AppColors.text,
    fontSize: 90,
    fontWeight: FontWeight.bold,
  );

  // Nombre del equipo en la parte de abajo de cada tarjeta
  static const TextStyle teamName = TextStyle(
    color: AppColors.text,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  // Texto del botón RESET
  static const TextStyle resetText = TextStyle(
    color: AppColors.text,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}

// =====================================================================
// TEMA GLOBAL
// Se aplica en main.dart a toda la aplicación (MaterialApp).
// =====================================================================
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      // Tema oscuro
      brightness: Brightness.dark,
      // Color de fondo de todas las pantallas (Scaffold)
      scaffoldBackgroundColor: AppColors.background,
      // Barra superior del mismo color que el fondo y sin sombra
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.text,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}

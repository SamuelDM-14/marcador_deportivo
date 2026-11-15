import 'package:material_ui/material_ui.dart';

import 'screens/scoreboard_screen.dart';
import 'themes/app_theme.dart';

// =====================================================================
// PUNTO DE ENTRADA DE LA APLICACIÓN
// main() es lo primero que se ejecuta y arranca la app con runApp().
// =====================================================================
void main() {
  runApp(const MarcadorApp());
}

// =====================================================================
// WIDGET RAÍZ
// Configura la MaterialApp: el tema global y la pantalla inicial.
// =====================================================================
class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador',
      // Quita la etiqueta roja de "DEBUG" de la esquina
      debugShowCheckedModeBanner: false,
      // Tema global definido en themes/app_theme.dart
      theme: AppTheme.darkTheme,
      // Pantalla que se muestra al abrir la app
      home: const ScoreboardScreen(),
    );
  }
}
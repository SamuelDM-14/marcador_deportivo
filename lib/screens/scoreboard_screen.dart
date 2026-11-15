import 'package:material_ui/material_ui.dart';

import '../themes/app_theme.dart';
import '../widgets/reset_button.dart';
import '../widgets/scoreboard_header.dart';
import '../widgets/team_card.dart';

// =====================================================================
// PANTALLA PRINCIPAL DEL MARCADOR
// Es un StatefulWidget porque las puntuaciones cambian mientras
// se usa la app y la pantalla se tiene que redibujar.
// =====================================================================
class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  // ===================================================================
  // ESTADO: puntuación de cada equipo. Empiezan en 0.
  // Estas dos variables son las únicas que guardan los puntos.
  // ===================================================================
  int _localScore = 0;
  int _visitScore = 0;

  // ===================================================================
  // LÓGICA DEL MARCADOR
  // setState() cambia el valor y avisa a Flutter de que redibuje.
  // ===================================================================

  // Suma un punto al equipo local
  void _incrementLocal() {
    setState(() {
      _localScore++;
    });
  }

  // Resta un punto al equipo local, solo si es mayor que 0
  // (así la puntuación nunca puede ser negativa)
  void _decrementLocal() {
    setState(() {
      if (_localScore > 0) {
        _localScore--;
      }
    });
  }

  // Suma un punto al equipo visitante
  void _incrementVisit() {
    setState(() {
      _visitScore++;
    });
  }

  // Resta un punto al equipo visitante, solo si es mayor que 0
  void _decrementVisit() {
    setState(() {
      if (_visitScore > 0) {
        _visitScore--;
      }
    });
  }

  // Botón RESET: pone las dos puntuaciones a 0
  void _resetScores() {
    setState(() {
      _localScore = 0;
      _visitScore = 0;
    });
  }

  // ===================================================================
  // INTERFAZ
  // ===================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----- BARRA SUPERIOR: icono de baloncesto + "MARCADOR" -----
      appBar: AppBar(
        titleSpacing: 16,
        title: const Row(
          children: [
            Icon(Icons.sports_basketball, size: 24),
            SizedBox(width: 12),
            Text('MARCADOR', style: AppTextStyles.appTitle),
          ],
        ),
      ),

      // SafeArea evita que el contenido quede debajo de la barra de navegación del móvil
      body: SafeArea(
        child: Padding(
          // Margen de 16 alrededor de todo el contenido
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ----- MARCADOR SUPERIOR -----
              ScoreboardHeader(
                localScore: _localScore,
                visitScore: _visitScore,
              ),
              const SizedBox(height: 16),

              // ----- TARJETAS DE LOS EQUIPOS -----
              // Expanded: las tarjetas ocupan todo el alto que sobra
              Expanded(
                child: Row(
                  // stretch: las tarjetas ocupan todo el alto disponible
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Tarjeta del equipo local (azul)
                    Expanded(
                      child: TeamCard(
                        teamName: 'EQUIPO LOCAL',
                        score: _localScore,
                        mainColor: AppColors.localMain,
                        darkColor: AppColors.localDark,
                        onIncrement: _incrementLocal,
                        onDecrement: _decrementLocal,
                      ),
                    ),
                    // Separación entre las dos tarjetas
                    const SizedBox(width: 16),
                    // Tarjeta del equipo visitante (rojo)
                    Expanded(
                      child: TeamCard(
                        teamName: 'EQUIPO VISITA',
                        score: _visitScore,
                        mainColor: AppColors.visitMain,
                        darkColor: AppColors.visitDark,
                        onIncrement: _incrementVisit,
                        onDecrement: _decrementVisit,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ----- BOTÓN RESET -----
              ResetButton(onPressed: _resetScores),
            ],
          ),
        ),
      ),
    );
  }
}

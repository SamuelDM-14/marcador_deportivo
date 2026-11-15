import 'package:material_ui/material_ui.dart';

import '../themes/app_theme.dart';
import 'score_button.dart';

// =====================================================================
// TARJETA DE EQUIPO
// Cada una de las dos columnas grandes de la pantalla. De arriba abajo:
//   1. Botón + (color principal)
//   2. Puntuación grande (color oscuro)
//   3. Botón - (color principal)
//   4. Nombre del equipo (color oscuro)
// Se usa dos veces: una para el equipo local y otra para el visitante.
// =====================================================================
class TeamCard extends StatelessWidget {
  // Nombre que aparece abajo ("EQUIPO LOCAL" o "EQUIPO VISITA")
  final String teamName;
  // Puntuación actual del equipo
  final int score;
  // Color de los botones + y -
  final Color mainColor;
  // Color de la zona del número y del nombre
  final Color darkColor;
  // Funciones que se ejecutan al pulsar + y -
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const TeamCard({
    super.key,
    required this.teamName,
    required this.score,
    required this.mainColor,
    required this.darkColor,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    // ClipRRect redondea las esquinas de toda la tarjeta
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        // stretch hace que cada parte ocupe todo el ancho de la tarjeta
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ----- 1. BOTÓN + (sumar un punto) -----
          // flex 3: ocupa 3 partes de la altura disponible
          Expanded(
            flex: 3,
            child: ScoreButton(
              icon: Icons.add,
              color: mainColor,
              onPressed: onIncrement,
            ),
          ),

          // ----- 2. PUNTUACIÓN GRANDE -----
          // flex 7: es la zona más alta de la tarjeta
          Expanded(
            flex: 7,
            child: Container(
              color: darkColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              // FittedBox reduce el número si no cabe (por ejemplo, 100)
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('$score', style: AppTextStyles.bigScore),
              ),
            ),
          ),

          // ----- 3. BOTÓN - (restar un punto) -----
          Expanded(
            flex: 3,
            child: ScoreButton(
              icon: Icons.remove,
              color: mainColor,
              onPressed: onDecrement,
            ),
          ),

          // ----- 4. NOMBRE DEL EQUIPO -----
          // Altura fija de 32, no cambia con el tamaño de pantalla
          Container(
            height: 32,
            color: darkColor,
            alignment: Alignment.center,
            child: Text(teamName, style: AppTextStyles.teamName),
          ),
        ],
      ),
    );
  }
}

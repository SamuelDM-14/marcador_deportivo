import 'package:material_ui/material_ui.dart';

import '../themes/app_theme.dart';

// =====================================================================
// BOTÓN DE PUNTUACIÓN (+ o -)
// Es la zona de color de arriba (+) y de abajo (-) de cada tarjeta.
// Se reutiliza 4 veces: + y - del equipo local y + y - del visitante.
// =====================================================================
class ScoreButton extends StatelessWidget {
  // Icono que se muestra: Icons.add (+) o Icons.remove (-)
  final IconData icon;
  // Color de fondo del botón (azul o rojo)
  final Color color;
  // Función que se ejecuta al pulsar (sumar o restar un punto)
  final VoidCallback onPressed;

  const ScoreButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Material da el color de fondo y permite el efecto de onda al pulsar
    return Material(
      color: color,
      // InkWell detecta la pulsación y dibuja el efecto de onda
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Icon(icon, color: AppColors.text, size: 64),
        ),
      ),
    );
  }
}

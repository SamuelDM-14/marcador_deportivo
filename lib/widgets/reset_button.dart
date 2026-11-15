import 'package:material_ui/material_ui.dart';

import '../themes/app_theme.dart';

// =====================================================================
// BOTÓN RESET
// El botón de abajo del todo, con el icono de reiniciar y el texto RESET.
// Al pulsarlo, las dos puntuaciones vuelven a 0.
// =====================================================================
class ResetButton extends StatelessWidget {
  // Función que se ejecuta al pulsar (reiniciar el marcador)
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // SizedBox fija el tamaño del botón
    return SizedBox(
      width: 180,
      height: 40,
      // OutlinedButton.icon: botón con borde, icono y texto
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.refresh, color: AppColors.text, size: 22),
        label: const Text('RESET', style: AppTextStyles.resetText),
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.resetBackground,
          side: const BorderSide(color: AppColors.resetBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

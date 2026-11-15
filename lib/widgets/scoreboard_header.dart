import 'package:material_ui/material_ui.dart';

import '../themes/app_theme.dart';

// =====================================================================
// MARCADOR SUPERIOR
// La caja de arriba con:  • LOCAL   [ 10  VS  21 ]   VISITA •
// Recibe las mismas puntuaciones que las tarjetas, así que siempre
// muestra los mismos valores (están sincronizados).
// =====================================================================
class ScoreboardHeader extends StatelessWidget {
  final int localScore;
  final int visitScore;

  const ScoreboardHeader({
    super.key,
    required this.localScore,
    required this.visitScore,
  });

  @override
  Widget build(BuildContext context) {
    // Caja exterior: fondo gris oscuro, borde gris y esquinas redondeadas
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.headerBorder),
      ),
      child: Row(
        // spaceBetween: LOCAL a la izquierda, pastilla al centro y VISITA a la derecha
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ----- IZQUIERDA: punto azul + "LOCAL" -----
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(AppColors.localMain),
              const SizedBox(width: 8),
              Text(
                'LOCAL',
                style: AppTextStyles.headerLabel.copyWith(
                  color: AppColors.localMain,
                ),
              ),
            ],
          ),

          // ----- CENTRO: pastilla con las puntuaciones -----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.pillBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Puntuación del local (azul)
                Text(
                  '$localScore',
                  style: AppTextStyles.headerScore.copyWith(
                    color: AppColors.localMain,
                  ),
                ),
                const SizedBox(width: 20),
                const Text('VS', style: AppTextStyles.vs),
                const SizedBox(width: 20),
                // Puntuación del visitante (rojo)
                Text(
                  '$visitScore',
                  style: AppTextStyles.headerScore.copyWith(
                    color: AppColors.visitLabel,
                  ),
                ),
              ],
            ),
          ),

          // ----- DERECHA: "VISITA" + punto rojo -----
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VISITA',
                style: AppTextStyles.headerLabel.copyWith(
                  color: AppColors.visitLabel,
                ),
              ),
              const SizedBox(width: 8),
              _buildDot(AppColors.visitLabel),
            ],
          ),
        ],
      ),
    );
  }

  // Crea el puntito de color que va al lado de LOCAL y VISITA
  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

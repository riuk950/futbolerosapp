import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme/app_colors.dart';

class Scoreboard extends StatelessWidget {
  final int homeScore;
  final int awayScore;
  final bool isLive;

  const Scoreboard({
    super.key,
    required this.homeScore,
    required this.awayScore,
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C1E), // Neutral 900 equivalent
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildScoreDigit(homeScore),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              ':',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildScoreDigit(awayScore),
          if (isLive) ...[
            const SizedBox(width: 8),
            _buildLiveIndicator(),
          ],
        ],
      ),
    );
  }

  Widget _buildScoreDigit(int score) {
    return Text(
      score.toString(),
      style: GoogleFonts.jetBrainsMono(
        color: AppColors.actionGreen,
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildLiveIndicator() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

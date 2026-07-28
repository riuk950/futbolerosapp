import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  int _selectedDateIndex = 2; // Default to 'HOY'

  final List<String> _dateOptions = [
    'MAR 21 JUL',
    'AYER',
    'HOY',
    'DIRECTO (4)',
    'MAÑANA',
    'SÁBADO',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 1,
        shadowColor: Colors.black26,
        leading: IconButton(
          icon: Icon(Icons.menu, color: colorScheme.onPrimary),
          onPressed: () {},
        ),
        title: Text(
          'Sogamoso Sports',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: colorScheme.onPrimary,
            letterSpacing: -0.18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today_outlined, color: colorScheme.onPrimary, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: colorScheme.onPrimary, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Sub-navigation: Date Selector Bar
          Container(
            color: colorScheme.primary,
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _dateOptions.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedDateIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDateIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: isSelected
                          ? const Border(
                              bottom: BorderSide(color: Colors.white, width: 3),
                            )
                          : null,
                    ),
                    child: Text(
                      _dateOptions[index],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.7),
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Main Content List
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section 1: CONMEBOL Sudamericana
                      _TournamentSectionCard(
                        title: 'CONMEBOL SUDAMERICANA',
                        icon: Icons.public,
                        matches: const [
                          _MatchRow(
                            homeTeam: 'Bolívar',
                            homeColor: Colors.lightBlueAccent,
                            awayTeam: 'Grêmio',
                            awayColor: Colors.blue,
                            time: '5:00 PM',
                            broadcast: 'ESPN (COL)',
                          ),
                          _MatchRow(
                            homeTeam: 'Santa Fe',
                            homeColor: Colors.redAccent,
                            awayTeam: 'Caracas',
                            awayColor: Colors.red,
                            time: '7:30 PM',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Section 2: SERIE A BETANO
                      _TournamentSectionCard(
                        title: 'SERIE A BETANO',
                        icon: Icons.emoji_events_outlined,
                        matches: const [
                          _MatchRow(
                            homeTeam: 'Corinthians',
                            homeColor: Colors.black87,
                            awayTeam: 'Remo',
                            awayColor: Colors.indigo,
                            time: '5:30 PM',
                            broadcast: 'WIN SPORTS (COL)',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Section 3: Live Status Highlight Bento Card
                      const _LiveMatchBentoCard(),
                      const SizedBox(height: 16),

                      // Section 4: Highlights Video Card
                      const _MatchHighlightsCard(),
                      const SizedBox(height: 16),

                      // Section 5: Recent / Friendly Matches
                      _TournamentSectionCard(
                        title: 'RECIENTES / AMISTOSOS',
                        icon: Icons.history,
                        matches: const [
                          _FinishedMatchRow(
                            homeTeam: 'Waldhof\nMannheim',
                            homeScore: '4',
                            awayScore: '1',
                            awayTeam: 'Liefering',
                            status: 'FIN',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TournamentSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> matches;

  const _TournamentSectionCard({
    required this.title,
    required this.icon,
    required this.matches,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Header Bar
          Container(
            color: colorScheme.surfaceContainer,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(icon, size: 16, color: colorScheme.onSurface),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
          ...matches,
        ],
      ),
    );
  }
}

class _MatchRow extends StatelessWidget {
  final String homeTeam;
  final Color homeColor;
  final String awayTeam;
  final Color awayColor;
  final String time;
  final String? broadcast;

  const _MatchRow({
    required this.homeTeam,
    required this.homeColor,
    required this.awayTeam,
    required this.awayColor,
    required this.time,
    this.broadcast,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.3), width: 1),
        ),
      ),
      child: Row(
        children: [
          // Home Team
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    homeTeam,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _TeamBadge(color: homeColor),
              ],
            ),
          ),
          // Time & Broadcast Center
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                    letterSpacing: -0.16,
                  ),
                ),
                if (broadcast != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    broadcast!,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.outline,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Away Team
          Expanded(
            child: Row(
              children: [
                _TeamBadge(color: awayColor),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    awayTeam,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FinishedMatchRow extends StatelessWidget {
  final String homeTeam;
  final String homeScore;
  final String awayScore;
  final String awayTeam;
  final String status;

  const _FinishedMatchRow({
    required this.homeTeam,
    required this.homeScore,
    required this.awayScore,
    required this.awayTeam,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer.withValues(alpha: 0.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    homeTeam,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const _TeamBadge(color: Colors.deepOrange),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      homeScore,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        '-',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: colorScheme.outline,
                        ),
                      ),
                    ),
                    Text(
                      awayScore,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const _TeamBadge(color: Colors.indigo),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    awayTeam,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveMatchBentoCard extends StatelessWidget {
  const _LiveMatchBentoCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LIVE NOW',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.9),
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Sogamoso Derby',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onPrimaryContainer,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Valle vs Centro • 82'",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '2 - 1',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: colorScheme.onPrimaryContainer,
                letterSpacing: -0.64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchHighlightsCard extends StatelessWidget {
  const _MatchHighlightsCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Match Highlights',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
              letterSpacing: -0.16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Don't miss the best moments from today's matches in Sogamoso.",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.play_arrow, size: 18),
              label: Text(
                'Watch Now',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamBadge extends StatelessWidget {
  final Color color;

  const _TeamBadge({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

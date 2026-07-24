import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Text(
                  'Welcome back, Athlete!',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    letterSpacing: -0.18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Stay up to date with your local tournaments and matches.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),

                // Stats Summary Bento
                Row(
                  children: [
                    Expanded(
                      child: _BentoStatCard(
                        icon: Icons.sports_soccer,
                        iconColor: colorScheme.primary,
                        label: 'ACTIVE MATCHES',
                        value: '12',
                        valueColor: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _BentoStatCard(
                        icon: Icons.trending_up,
                        iconColor: colorScheme.tertiary,
                        label: 'YOUR PERFORMANCE',
                        value: '+14%',
                        valueColor: colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Active Tournaments Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Tournaments',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                        letterSpacing: -0.16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View all',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tournament Horizontal Scroll
                SizedBox(
                  height: 152,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _TournamentCard(
                        title: 'Copa Sogamoso',
                        subtitle: 'Local League • 24 Teams',
                        badgeIcon: Icons.emoji_events_outlined,
                        badgeColor: colorScheme.primary,
                        progress: 0.75,
                      ),
                      const SizedBox(width: 12),
                      _TournamentCard(
                        title: 'Inter-Barrios',
                        subtitle: 'Community • 16 Teams',
                        badgeIcon: Icons.stadium_outlined,
                        badgeColor: colorScheme.secondary,
                        progress: 0.50,
                      ),
                      const SizedBox(width: 12),
                      _TournamentCard(
                        title: 'Senior Classic',
                        subtitle: 'Masters • 8 Teams',
                        badgeIcon: Icons.workspace_premium_outlined,
                        badgeColor: colorScheme.tertiary,
                        progress: 0.25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // Weekend Matches Section
                Text(
                  'Weekend Matches',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    letterSpacing: -0.16,
                  ),
                ),
                const SizedBox(height: 12),

                // CONMEBOL SUDAMERICANA Card
                const _MatchCategoryGroup(
                  categoryTitle: 'CONMEBOL SUDAMERICANA',
                  categoryIcon: Icons.public,
                  matches: [
                    _ScheduledMatchRow(
                      homeTeam: 'Bolívar',
                      time: '5:00PM',
                      awayTeam: 'Grêmio',
                      homeFlagColor: Colors.lightBlueAccent,
                      awayFlagColor: Colors.blueGrey,
                    ),
                    _ScheduledMatchRow(
                      homeTeam: 'Santa Fe',
                      time: '7:30PM',
                      awayTeam: 'Caracas',
                      homeFlagColor: Colors.redAccent,
                      awayFlagColor: Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // CLAUSURA ARGENTINA Live Card
                const _MatchCategoryGroup(
                  categoryTitle: 'CLAUSURA ARGENTINA',
                  categoryIcon: Icons.flag_outlined,
                  matches: [
                    _LiveMatchRow(
                      homeTeam: 'Sarmiento',
                      homeScore: '4',
                      awayScore: '1',
                      awayTeam: 'Arg. Juniors',
                      liveTime: "LIVE 82'",
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(top: BorderSide(color: colorScheme.outlineVariant, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurfaceVariant,
          selectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stadium_outlined),
              label: 'Courts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _BentoStatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final Color valueColor;

  const _BentoStatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: valueColor,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _TournamentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData badgeIcon;
  final Color badgeColor;
  final double progress;

  const _TournamentCard({
    required this.title,
    required this.subtitle,
    required this.badgeIcon,
    required this.badgeColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 200,
      padding: const EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(badgeIcon, color: badgeColor, size: 22),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  letterSpacing: -0.16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: colorScheme.surfaceContainer,
              valueColor: AlwaysStoppedAnimation<Color>(badgeColor),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchCategoryGroup extends StatelessWidget {
  final String categoryTitle;
  final IconData categoryIcon;
  final List<Widget> matches;

  const _MatchCategoryGroup({
    required this.categoryTitle,
    required this.categoryIcon,
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
                Icon(categoryIcon, size: 14, color: colorScheme.onSurface),
                const SizedBox(width: 8),
                Text(
                  categoryTitle,
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
          // Matches List
          ...matches,
        ],
      ),
    );
  }
}

class _ScheduledMatchRow extends StatelessWidget {
  final String homeTeam;
  final String time;
  final String awayTeam;
  final Color homeFlagColor;
  final Color awayFlagColor;

  const _ScheduledMatchRow({
    required this.homeTeam,
    required this.time,
    required this.awayTeam,
    required this.homeFlagColor,
    required this.awayFlagColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.3), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
              ),
            ),
            child: Row(
              children: [
                _TeamAvatar(color: homeFlagColor),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: -0.16,
                  ),
                ),
                const SizedBox(width: 8),
                _TeamAvatar(color: awayFlagColor),
              ],
            ),
          ),
          Expanded(
            child: Text(
              awayTeam,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveMatchRow extends StatelessWidget {
  final String homeTeam;
  final String homeScore;
  final String awayScore;
  final String awayTeam;
  final String liveTime;

  const _LiveMatchRow({
    required this.homeTeam,
    required this.homeScore,
    required this.awayScore,
    required this.awayTeam,
    required this.liveTime,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              homeTeam,
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                letterSpacing: -0.16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const _TeamAvatar(color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      '$homeScore - $awayScore',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const _TeamAvatar(color: Colors.redAccent),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  liveTime,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              awayTeam,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamAvatar extends StatelessWidget {
  final Color color;
  const _TeamAvatar({required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
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

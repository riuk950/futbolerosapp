import 'package:flutter/material.dart';
import '../widgets/squish_button.dart';
import '../widgets/scoreboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('FUTBOLEROS'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.w800,
            ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SOGAMOSO\nATHLETIC SYSTEM',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    height: 0.9,
                  ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'LIVE MATCH'),
            const SizedBox(height: 16),
            const Center(
              child: Scoreboard(
                homeScore: 2,
                awayScore: 1,
                isLive: true,
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'QUICK ACTIONS'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SquishButton(
                    onPressed: () {},
                    child: const Text('VIEW MATCHES'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SquishButton(
                    onPressed: () {},
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    child: const Text('NEWS FEED'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Torneo Relámpago 2026',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Próximo partido: Halcones vs Águilas',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('VIEW STANDINGS'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
    );
  }
}

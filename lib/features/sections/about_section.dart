import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/core/widget/section_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishnaGopal/themes/app_theme.dart';
import 'package:get/get.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMob = R.isMobile(context);

    return Obx(() {
      Get.find<ThemeController>().themeMode.value;

      return Container(
        color: AppTheme.surface(context),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: isMob ? 60 : 90,
          horizontal: isMob ? 24 : 48,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                const SectionTitle(
                  tag: 'ABOUT ME',
                  title: 'Passionate Flutter & Android Developer',
                  subtitle:
                  'Creating scalable and high-performance mobile applications for Android, iOS, and Web.',
                ),
                const SizedBox(height: 32),
                isMob
                    ? _buildMobile(context)
                    : _buildDesktop(context),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildLeft(context)),
        const SizedBox(width: 56),
        Expanded(flex: 5, child: _buildRight(context)),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        _buildLeft(context),
        const SizedBox(height: 32),
        _buildRight(context),
      ],
    );
  }

  Widget _buildLeft(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppTheme.card(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.border(context),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(
                icon: Icons.person_outline,
                label: 'Name',
                value: 'Mr. Krishna Gopal Sen',
              ),
              Divider(
                height: 24,
                color: AppTheme.border(context),
              ),
              _InfoRow(
                icon: Icons.location_on_outlined,
                label: 'Location',
                value: 'Indore (India)',
              ),
              Divider(
                height: 24,
                color: AppTheme.border(context),
              ),
              _InfoRow(
                icon: Icons.work_outline,
                label: 'Experience',
                value: '9+ Years',
              ),
              Divider(
                height: 24,
                color: AppTheme.border(context),
              ),
              _InfoRow(
                icon: Icons.devices_outlined,
                label: 'Platforms',
                value: 'Android | iOS | Web',
              ),
              Divider(
                height: 24,
                color: AppTheme.border(context),
              ),
              _InfoRow(
                icon: Icons.language,
                label: 'Languages',
                value: 'Flutter | Dart | Kotlin | Java',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _MiniStat(
                icon: Icons.smartphone,
                value: '40+',
                label: 'Apps',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MiniStat(
                icon: Icons.people_outline,
                value: '15+',
                label: 'Clients',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MiniStat(
                icon: Icons.star_outline,
                value: '4.5',
                label: 'Rating',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Building Digital Experiences',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary(context),
          ),
        ),
        const SizedBox(height: 14),

        Text(
          'Senior Flutter & Android Developer with 9+ years of experience in building '
              'scalable and high-performance mobile applications for Android and iOS platforms.'
              'Skilled in Flutter, Kotlin, Java, Firebase, REST APIs, and real-time application development.',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppTheme.textSecondary(context),
            height: 1.8,
          ),
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 12),

        Text(
          'I also have knowledge of backend technologies including Node.js,'
              ' Express.js, and MongoDB for building scalable APIs and backend services. '
              'Experienced in developing enterprise applications including airport transfer systems, '
              'eCommerce platforms, POS solutions, and multi-vendor apps.',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppTheme.textSecondary(context),
            height: 1.8,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'What I bring to the table:',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary(context),
          ),
        ),

        const SizedBox(height: 14),

        ...[
          '⚡ Scalable and high-performance mobile applications.',
          '📱 Cross-platform Android & iOS development with Flutter.',
          '🔥 Firebase integration (Auth, Firestore, Push Notifications).',
          '🌐 REST API development with Node.js & Express.js.',
          '🗄️ MongoDB database integration and backend handling.',
          '🗺️ Google Maps & real-time tracking systems.',
          '🏗️ Clean Architecture with GetX, Riverpod, Bloc & MVVM.',
          '🚀 Play Store & App Store deployment experience.',
        ].map(
              (e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    e,
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      color: AppTheme.textSecondary(context),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withValues(alpha:0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppTheme.accentColor,
          ),
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppTheme.textSecondary(context),
              ),
            ),

            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value, label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.card(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border(context),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppTheme.accentColor,
            size: 22,
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.accentColor,
            ),
          ),

          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppTheme.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}

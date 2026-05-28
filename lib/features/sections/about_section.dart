import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/core/widget/section_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishnaGopal/themes/app_theme.dart';
import 'package:get/get.dart';

import '../../core/string/appstring.dart';

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
                  tag: AppStrings.aboutTag,
                  title: AppStrings.aboutTitle,
                  subtitle: AppStrings.aboutSubtitle,
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
        // ── Info card ──
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
                label: AppStrings.labelName,
                value: AppStrings.infoName,
              ),
              Divider(height: 24, color: AppTheme.border(context)),
              _InfoRow(
                icon: Icons.location_on_outlined,
                label: AppStrings.labelLocation,
                value: AppStrings.infoLocation,
              ),
              Divider(height: 24, color: AppTheme.border(context)),
              _InfoRow(
                icon: Icons.work_outline,
                label: AppStrings.labelExperience,
                value: AppStrings.infoExperience,
              ),
              Divider(height: 24, color: AppTheme.border(context)),
              _InfoRow(
                icon: Icons.devices_outlined,
                label: AppStrings.labelPlatforms,
                value: AppStrings.infoPlatforms,
              ),
              Divider(height: 24, color: AppTheme.border(context)),
              _InfoRow(
                icon: Icons.language,
                label: AppStrings.labelLanguages,
                value: AppStrings.infoLanguages,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ── Mini stats ──
        Row(
          children: [
            Expanded(
              child: _MiniStat(
                icon: Icons.smartphone,
                value: AppStrings.miniStatApps,
                label: AppStrings.miniStatAppsLabel,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MiniStat(
                icon: Icons.people_outline,
                value: AppStrings.miniStatClients,
                label: AppStrings.miniStatClientsLabel,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MiniStat(
                icon: Icons.star_outline,
                value: AppStrings.miniStatRating,
                label: AppStrings.miniStatRatingLabel,
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
        // ── Heading ──
        Text(
          AppStrings.aboutHeading,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary(context),
          ),
        ),

        const SizedBox(height: 14),

        // ── Para 1 ──
        Text(
          AppStrings.aboutPara1,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppTheme.textSecondary(context),
            height: 1.8,
          ),
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 12),

        // ── Para 2 ──
        Text(
          AppStrings.aboutPara2,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppTheme.textSecondary(context),
            height: 1.8,
          ),
        ),

        const SizedBox(height: 24),

        // ── What I bring heading ──
        Text(
          AppStrings.aboutWhatIBring,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary(context),
          ),
        ),

        const SizedBox(height: 14),

        // ── Bullet list ──
        ...AppStrings.aboutBullets.map(
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

// ============================
// INFO ROW
// ============================

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
            color: AppTheme.accentColor.withValues(alpha: 0.12),
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

// ============================
// MINI STAT
// ============================

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
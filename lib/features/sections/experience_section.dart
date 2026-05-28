import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/model/all_model.dart';
import '../../core/string/appstring.dart';
import '../../themes/app_theme.dart';

// ─────────────────────────────────────────────
// SECTION
// ─────────────────────────────────────────────

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Obx(() {
      Get.find<ThemeController>().themeMode.value;

      return Container(
        width: double.infinity,
        color: AppTheme.bg(context),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 72,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(isMobile: isMobile),
            const SizedBox(height: 48),
            ...List.generate(AppStrings.experiences.length, (i) {
              return _TimelineItem(
                exp: AppStrings.experiences[i],
                isLast: i == AppStrings.experiences.length - 1,
                isMobile: isMobile,
              );
            }),
          ],
        ),
      );
    });
  }
}

// ─────────────────────────────────────────────
// SECTION HEADER
// ─────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final bool isMobile;
  const _SectionHeader({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.experienceTag,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
            color: AppTheme.accentColor,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          AppStrings.experienceTitle,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary(context),
            height: 1.2,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          AppStrings.experienceSubtitle,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 16,
            color: AppTheme.textSecondary(context),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// TIMELINE ITEM
// ─────────────────────────────────────────────

class _TimelineItem extends StatefulWidget {
  final ExperienceModel exp;
  final bool isLast;
  final bool isMobile;

  const _TimelineItem({
    required this.exp,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Timeline dot + line ──
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: widget.exp.accentColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.exp.accentColor,
                  width: 2,
                ),
              ),
              child: Icon(
                widget.exp.icon,
                size: 18,
                color: widget.exp.accentColor,
              ),
            ),
            if (!widget.isLast)
              Container(
                width: 2,
                height: _expanded ? 260 : 120,
                color: AppTheme.border(context),
              ),
          ],
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: _ExpCard(
              exp: widget.exp,
              expanded: _expanded,
              onToggle: () => setState(() => _expanded = !_expanded),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// EXPERIENCE CARD
// ─────────────────────────────────────────────

class _ExpCard extends StatelessWidget {
  final ExperienceModel exp;
  final bool expanded;
  final VoidCallback onToggle;

  const _ExpCard({
    required this.exp,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.card(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border(context)),
        boxShadow: [
          BoxShadow(
            color: exp.accentColor.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Card header ──
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp.role,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exp.company,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: exp.accentColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          _MetaChip(
                            icon: Icons.calendar_today_outlined,
                            label: exp.duration,
                          ),
                          _MetaChip(
                            icon: Icons.location_on_outlined,
                            label: exp.location,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── Expand toggle ──
                GestureDetector(
                  onTap: onToggle,
                  child: AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppTheme.textSecondary(context),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Expandable responsibilities ──
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: AppTheme.border(context), height: 1),
                  const SizedBox(height: 16),
                  ...exp.responsibilities.map(
                        (r) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: exp.accentColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              r,
                              style: GoogleFonts.inter(
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
              ),
            ),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// META CHIP
// ─────────────────────────────────────────────

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppTheme.textSecondary(context)),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppTheme.textSecondary(context),
          ),
        ),
      ],
    );
  }
}
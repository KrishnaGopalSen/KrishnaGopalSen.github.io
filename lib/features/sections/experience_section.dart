import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

// ─────────────────────────────────────────────
// MODEL
// ─────────────────────────────────────────────
class ExperienceModel {
  final String company;
  final String role;
  final String duration;
  final String location;
  final List<String> responsibilities;
  final IconData icon;
  final Color accentColor;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.responsibilities,
    required this.icon,
    required this.accentColor,
  });
}

// ─────────────────────────────────────────────
// DATA  ← Krishna Gopal Sen CV se update kiya
// ─────────────────────────────────────────────
const List<ExperienceModel> _experiences = [
  ExperienceModel(
    company: 'Syscraft Information System Pvt. Ltd.',
    role: 'Senior Flutter Developer',
    duration: 'Dec 2025 – Present',
    location: 'Indore',
    responsibilities: [
      'Developing enterprise-level Flutter applications for Android and iOS platforms.',
      'Working on airport transfer and real-time tracking apps (Twelve Client & Driver).',
      'Implementing scalable MVVM architecture, REST API integration, and payment systems.',
      'Collaborating with backend and QA teams for production deployment and app optimization.',
      'Managing Play Store and App Store release builds for UK-based client Twelve Transfers.',
    ],
    icon: Icons.flight_takeoff,
    accentColor: Color(0xFF6C63FF),
  ),
  ExperienceModel(
    company: 'Granth Technosoft Pvt. Ltd.',
    role: 'Senior Android / Flutter Developer',
    duration: 'Apr 2024 – Oct 2025',
    location: 'Indore',
    responsibilities: [
      'Collaborated with 8+ developers to build 15+ cross-platform apps using Flutter & MVVM, reducing delivery time by ~33%.',
      'Engineered RESTful APIs with Spring Boot, improving response time by 55%.',
      'Integrated Firebase services (Auth, Firestore, FCM) to support 10K+ MAUs.',
      'Migrated 5 native iOS/Android apps to Flutter — 95% feature parity, 60% smaller codebase.',
      'Boosted client satisfaction and repeat business by 60% through proactive requirement gathering.',
    ],
    icon: Icons.rocket_launch,
    accentColor: Color(0xFF00BFA6),
  ),
  ExperienceModel(
    company: 'Yug Technosoft',
    role: 'Android / Flutter Developer',
    duration: 'Jan 2021 – Mar 2024',
    location: 'Indore',
    responsibilities: [
      'Mentored 4 junior developers via bi-weekly sessions, increasing feature delivery accuracy by 55%.',
      'Led Google Maps API integration in 3 location-based apps, increasing user engagement by 65%.',
      'Implemented real-time chat via Firebase handling 15K+ monthly messages.',
      'Delivered 5+ eCommerce and grocery app builds, improving user retention by 60%.',
    ],
    icon: Icons.map_outlined,
    accentColor: Color(0xFFFF6B6B),
  ),
  ExperienceModel(
    company: 'SKB Infocom Pvt. Ltd.',
    role: 'Android Developer',
    duration: 'Dec 2019 – Jan 2021',
    location: 'Indore',
    responsibilities: [
      'Developed Android applications for business and enterprise domains.',
      'Worked on POS (Clover/PAX device) app — migrated to Kotlin, implemented SQLite + MVVM.',
      'Added inventory, order and billing features to the POS system.',
    ],
    icon: Icons.point_of_sale,
    accentColor: Color(0xFFF59E0B),
  ),
  ExperienceModel(
    company: 'Bit-7 Informatics',
    role: 'Jr. Android Developer',
    duration: 'Oct 2017 – Dec 2019',
    location: 'Bhopal',
    responsibilities: [
      'Developed Android applications with focus on UI/UX and API integration.',
    ],
    icon: Icons.phone_android,
    accentColor: Color(0xFF3B82F6),
  ),
  ExperienceModel(
    company: 'App Legend Pvt. Ltd.',
    role: 'Android Developer',
    duration: 'Apr 2016 – Oct 2017',
    location: 'Bhopal',
    responsibilities: [
      'Started career building Android applications.',
      'Developed core skills in Java, XML, and Android SDK.',
    ],
    icon: Icons.code,
    accentColor: Color(0xFF10B981),
  ),
];

// ─────────────────────────────────────────────
// SECTION
// ─────────────────────────────────────────────
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Obx(() {
      // Track theme changes
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
            ...List.generate(_experiences.length, (i) {
              return _TimelineItem(
                exp: _experiences[i],
                isLast: i == _experiences.length - 1,
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
          'EXPERIENCE',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
            color: AppTheme.accentColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'My Work History',
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary(context),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '9+ years of building real products across mobile platforms.',
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
        // Timeline dot + line
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: widget.exp.accentColor.withValues(alpha:0.12),
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
              onToggle: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
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
            color: exp.accentColor.withValues(alpha:0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                              label: exp.duration),
                          _MetaChip(
                              icon: Icons.location_on_outlined,
                              label: exp.location),
                        ],
                      ),
                    ],
                  ),
                ),
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
            crossFadeState:
            expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

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
              fontSize: 12, color: AppTheme.textSecondary(context)),
        ),
      ],
    );
  }
}
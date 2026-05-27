import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/core/widget/section_title.dart';
import 'package:krishnaGopal/themes/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    // Mobile Development
    _Skill('Flutter', 0.95, '🐦'),
    _Skill('Dart', 0.93, '🎯'),
    _Skill('Kotlin', 0.82, '🟣'),
    _Skill('Java', 0.80, '☕'),
    _Skill('Android SDK', 0.90, '🤖'),
    _Skill('Jetpack Compose', 0.78, '🧩'),

    // Architecture & State Management
    _Skill('MVVM', 0.88, '🏗️'),
    _Skill('Clean Architecture', 0.86, '🛠️'),
    _Skill('GetX', 0.90, '⚡'),
    _Skill('Riverpod', 0.80, '🌊'),
    _Skill('Bloc / Cubit', 0.82, '🧱'),
    _Skill('Provider', 0.87, '📦'),

    // Backend & Database
    _Skill('REST APIs', 0.85, '🌐'),
    _Skill('Firebase Auth', 0.88, '🔥'),
    _Skill('Firestore', 0.84, '📂'),
    _Skill('FCM', 0.83, '🔔'),
    _Skill('SQLite', 0.80, '🗄️'),
    _Skill('Hive', 0.78, '🍯'),
    _Skill('Node.js', 0.78, '🟢'),
    _Skill('MongoDB', 0.76, '🍃'),
    _Skill('Spring Boot', 0.72, '☕'),

    // Tools & DevOps
    _Skill('Git & GitHub', 0.88, '🐙'),
    _Skill('Codemagic', 0.78, '🚀'),
    _Skill('CI/CD', 0.80, '🔄'),
    _Skill('Android Studio', 0.92, '🤖'),
    _Skill('VS Code', 0.90, '💻'),
    _Skill('Play Store Deployment', 0.85, '📱'),
    _Skill('App Store Deployment', 0.75, '🍎'),
    _Skill('TestFlight', 0.78, '✈️'),
    _Skill('Xcode', 0.75, '🛠️'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMob = R.isMobile(context);

    return Obx(() {
      Get.find<ThemeController>().themeMode.value;

      return Container(
        color: AppTheme.bg(context),
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
                  tag: 'MY SKILLS',
                  title: 'Technical Expertise',
                  subtitle:
                  'Technologies I use to build modern mobile applications.',
                ),

                const SizedBox(height: 48),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    isMob ? 1 : (R.isTablet(context) ? 2 : 3),
                    crossAxisSpacing:  isMob ? 16 : (R.isTablet(context) ? 16 : 25),//16,
                    mainAxisSpacing: isMob ? 16 : (R.isTablet(context) ? 16 : 25),//16,
                    childAspectRatio: isMob ? 3.5 : (R.isTablet(context) ? 3.0 : 2.6),//isMob ? 4.5 : 3.5,
                  ),
                  itemCount: _skills.length,
                  itemBuilder: (ctx, i) =>
                      _SkillCard(skill: _skills[i]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _Skill {
  const _Skill(this.name, this.level, this.emoji);

  final String name;
  final String emoji;
  final double level;
}

class _SkillCard extends StatefulWidget {
  const _SkillCard({required this.skill});

  final _Skill skill;

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  bool _hover = false;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _anim = Tween<double>(
      begin: 0.0,
      end: widget.skill.level,
    ).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: Curves.easeOutCubic,
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 300),
          () {
        if (mounted) {
          _ctrl.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _hover
              ? AppTheme.surface(context)
              : AppTheme.card(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover
                ? AppTheme.accentColor.withValues(alpha:0.4)
                : AppTheme.border(context),
          ),
          boxShadow: _hover
              ? [
            BoxShadow(
              color: AppTheme.accentColor.withValues(alpha:
                isDark ? 0.15 : 0.08,
              ),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.skill.emoji,
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    widget.skill.name,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                ),

                AnimatedBuilder(
                  animation: _anim,
                  builder: (_, _) {
                    return Text(
                      '${(_anim.value * 100).toInt()}%',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentColor,
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AnimatedBuilder(
                animation: _anim,
                builder: (_, _) {
                  return LinearProgressIndicator(
                    value: _anim.value,
                    minHeight: 6,
                    backgroundColor: AppTheme.border(context),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppTheme.accentColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
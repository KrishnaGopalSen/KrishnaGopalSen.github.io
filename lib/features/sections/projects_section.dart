import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/core/widget/section_title.dart';
import 'package:krishnaGopal/themes/app_theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/all_model.dart';
import '../../core/string/appstring.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                const SectionTitle(
                  tag: AppStrings.projectsTag,
                  title: AppStrings.projectsTitle,
                  subtitle: AppStrings.projectsSubtitle,
                ),

                const SizedBox(height: 48),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    isMob ? 1 : (R.isTablet(context) ? 2 : 3),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: isMob ? 1.10 : 1.08,
                  ),
                  itemCount: AppStrings.projects.length,
                  itemBuilder: (ctx, i) {
                    return _ProjectCard(project: AppStrings.projects[i]);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ============================
// PROJECT CARD
// ============================

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectItem project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppTheme.card(context),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hover
                ? p.color.withValues(alpha: 0.4)
                : AppTheme.border(context),
          ),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? p.color.withValues(alpha: 0.18)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _hover ? 28 : 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // ── Image / Icon header ──
            p.image != null
                ? Container(
              height: 95,
              decoration: BoxDecoration(
                color: p.color.withValues(alpha: 0.10),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: p.color,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: p.color.withValues(alpha: 0.35),
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      p.image!,
                      height: 80,
                    ),
                  ),
                ),
              ),
            )
                : Container(
              height: 95,
              decoration: BoxDecoration(
                color: p.color.withValues(alpha: 0.10),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: p.color,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: p.color.withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    p.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),

            // ── Card body ──
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Name ──
                    Text(
                      p.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary(context),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Description ──
                    Text(
                      p.desc,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        height: 1.6,
                        color: AppTheme.textSecondary(context),
                      ),
                    ),

                    const Spacer(),

                    // ── Tags ──
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: p.tags.map((t) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: p.color.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            t,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: p.color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 15),

                    // ── Store links ──
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (p.playStoreUrl != null)
                          _LinkBtn(
                            icon: Icons.play_arrow,
                            label: AppStrings.playStore,
                            color: p.color,
                            url: p.playStoreUrl!,
                          ),
                        if (p.appStoreUrl != null)
                          _LinkBtn(
                            icon: Icons.apple,
                            label: AppStrings.appStore,
                            color: p.color,
                            url: p.appStoreUrl!,
                          ),
                        if (p.githubUrl != null)
                          _LinkBtn(
                            icon: Icons.code,
                            label: AppStrings.gitHub,
                            color: p.color,
                            url: p.githubUrl!,
                          ),
                      ],
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
}

// ============================
// LINK BUTTON
// ============================

class _LinkBtn extends StatelessWidget {
  const _LinkBtn({
    required this.icon,
    required this.label,
    required this.color,
    required this.url,
  });

  final IconData icon;
  final String label;
  final Color color;
  final String url;

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launch,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 5),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
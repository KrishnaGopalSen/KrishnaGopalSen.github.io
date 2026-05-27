import 'package:flutter/material.dart';
import 'package:flutternode/controller/theme_controller.dart';
import 'package:flutternode/core/responsive/responsive.dart';
import 'package:flutternode/core/widget/section_title.dart';
import 'package:flutternode/themes/app_theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final _projects = [
    _Project(
      name: 'Twelve Client Airport Transfer',
      desc:
      'Airport taxi booking app for London & UK passengers with instant booking, live driver tracking, trip history, payment gateway integration, and real-time trip updates.',
      tags: ['Flutter', 'Firebase', 'GetX', 'Google Maps'],
      color: const Color(0xFF4F46E5),
      icon: Icons.local_taxi,
      image: 'assets/images/ctlficon.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.ctlf.userapp',
      appStoreUrl:
      'https://apps.apple.com/us/app/twelve-client-airport-transfer/id1476364449',
    ),

    _Project(
      name: 'Twelve Driver Airport Transfer',
      desc:
      'Professional airport transfer driver app with live ride dispatch, navigation, earnings dashboard, and real-time notifications.',
      tags: ['Flutter', 'Socket.io', 'Firebase', 'MVVM'],
      color: const Color(0xFF059669),
      icon: Icons.drive_eta,
      image: 'assets/images/ctlficon.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=ctlf.mediafirst.ro',
      appStoreUrl:
      'https://apps.apple.com/us/app/twelve-driver-airport-transfer/id1339195128',
    ),

    _Project(
      name: 'AppVyapar Elite',
      desc:
      'GST billing, POS, ERP, inventory, invoicing, and business management application with real-time stock and cash tracking.',
      tags: ['Flutter', 'REST API', 'GetX', 'Firebase'],
      color: const Color(0xFFF59E0B),
      icon: Icons.storefront,
      image: 'assets/images/appvyparelite.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyapar',
    ),

    _Project(
      name: 'AppVyapar Business Admin',
      desc:
      'Business admin app for GST billing, order management, customer handling, offers, wallet management, and MIS reports.',
      tags: ['Flutter', 'Provider', 'Firebase', 'POS'],
      color: const Color(0xFFDC2626),
      icon: Icons.business_center,
      image: 'assets/images/appvyaparadmin.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyaparshop',
      appStoreUrl:
      'https://apps.apple.com/in/app/appvyapar-business-app/id1470244758',
    ),

    _Project(
      name: 'AppVyapar Mini',
      desc:
      'Field staff and customer management app with attendance, visit check-in/check-out, task management, expenses, and live location tracking.',
      tags: ['Flutter', 'Google Maps', 'GetX', 'SQLite'],
      color: const Color(0xFF0891B2),
      icon: Icons.people_alt,
      image: 'assets/images/appvyaparmini.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyaparmini',
      appStoreUrl:
      'https://apps.apple.com/in/app/appvyapar-mini/id6741160230',
    ),

    _Project(
      name: 'Anuraga Matrimony',
      desc:
      'Exclusive matrimony platform for Brahmin community with profile verification, matchmaking, daily matches, and payment integration.',
      tags: ['Kotlin', 'Java', 'REST API', 'Payment Gateway'],
      color: const Color(0xFFBE9424),
      icon: Icons.favorite,
      image: 'assets/images/anurahmato.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.jashnasolutions.anuragamatrimony',
    ),
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
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                const SectionTitle(
                  tag: 'PORTFOLIO',
                  title: 'My Recent Applications',
                  subtitle:
                  'A showcase of production-ready applications I have developed for Android and iOS platforms.',
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
                  itemCount: _projects.length,
                  itemBuilder: (ctx, i) {
                    return _ProjectCard(project: _projects[i]);
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

class _Project {
  const _Project({
    required this.name,
    required this.desc,
    required this.tags,
    required this.color,
    required this.icon,
    this.image,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
  });

  final String name;
  final String desc;
  final List<String> tags;
  final Color color;
  final IconData icon;
  final String? image;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
  });

  final _Project project;

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
        transform: Matrix4.translationValues(
          0,
          _hover ? -6 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: AppTheme.card(context),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hover
                ? p.color.withValues(alpha:0.4)
                : AppTheme.border(context),
          ),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? p.color.withValues(alpha:0.18)
                  : Colors.black.withValues(alpha:0.05),
              blurRadius: _hover ? 28 : 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            p.image != null
                ?  Container(
        height: 95,
          decoration: BoxDecoration(
            color: p.color.withValues(alpha:0.10),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: p.color,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: p.color.withValues(alpha:0.35),
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
                color: p.color.withValues(alpha:0.10),
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
                        color: p.color.withValues(alpha:0.35),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // 👇 Ye niche push karega
                    const Spacer(),

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
                            color: p.color.withValues(alpha:0.10),
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

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (p.playStoreUrl != null)
                          _LinkBtn(
                            icon: Icons.play_arrow,
                            label: 'Play Store',
                            color: p.color,
                            url: p.playStoreUrl!,
                          ),

                        if (p.appStoreUrl != null)
                          _LinkBtn(
                            icon: Icons.apple,
                            label: 'App Store',
                            color: p.color,
                            url: p.appStoreUrl!,
                          ),

                        if (p.githubUrl != null)
                          _LinkBtn(
                            icon: Icons.code,
                            label: 'GitHub',
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
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
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
          color: color.withValues(alpha:0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13,
              color: color,
            ),

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
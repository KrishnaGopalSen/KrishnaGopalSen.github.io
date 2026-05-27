// ============================
// IMPORTS
// ============================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../core/responsive/responsive.dart';
import '../../themes/app_theme.dart';

// ============================
// HERO SECTION
// ============================

class HeroSection extends StatefulWidget {
  const HeroSection({
    super.key,
    required this.onContact,
  });

  final VoidCallback onContact;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: Curves.easeOut,
      ),
    );

    _slideAnim = Tween(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: Curves.easeOut,
      ),
    );

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMob = R.isMobile(context);

    return Obx(() {
      Get.find<ThemeController>().themeMode.value;
      return Card(
        elevation: 5,
        shadowColor: AppTheme.surface(context),
        child: Container(
          width: double.infinity,
          color: AppTheme.surface(context),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMob ? 1 : 48,
                  vertical: isMob ? 1 : 90,
                ),
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: isMob
                        ? _buildMobile(context)
                        : _buildDesktop(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: _buildText(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: _buildAvatar(context),
        ),
      ],
    );
  }

  // Widget _buildMobile(BuildContext context) {
  //   return Column(
  //     children: [
  //       _buildAvatar(context),
  //       const SizedBox(height: 36),
  //       _buildText(context),
  //     ],
  //   );
  // }

  Widget _buildMobile(BuildContext context) {
    final isMob = R.isMobile(context);
    final size = isMob ? 180.0 : 260.0;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Image.asset(
          'assets/images/aboutphoto.png',
          width: double.infinity,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          isAntiAlias: true,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.accentColor,
                    AppTheme.greenAccent,
                  ],
                ),
              ),
              child: Icon(
                Icons.person,
                size: size * 0.6,
                color: Colors.white.withValues(alpha:0.9),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    final isMob = R.isMobile(context);

    return Column(
      crossAxisAlignment:
      isMob ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withValues(alpha:0.10),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.accentColor.withValues(alpha:0.25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                'Available for work',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.accentColor,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'Hi, I\'m',
          textAlign:
          isMob ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 16 : 18,
            color: AppTheme.textSecondary(context),
            fontWeight: FontWeight.w400,
          ),
        ),

        Text(
          'Krishna Gopal Sen',
          textAlign:
          isMob ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 34 : 48,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary(context),
            height: 1.15,
          ),
        ),

        ShaderMask(
          shaderCallback: (b) {
            return const LinearGradient(
              colors: [
                AppTheme.accentColor,
                AppTheme.greenAccent,
              ],
            ).createShader(b);
          },
          child: Text(
            'Sr. Mobile Application Developer',
            textAlign:
            isMob ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: isMob ? 16 : 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          'Senior Flutter & Android Developer crafting scalable cross-platform mobile applications with modern architectures and real-time solutions.'
              '\n9+ Years Experience\nFlutter | Kotlin | Android | Firebase | Clean Architecture',
          textAlign:
          isMob ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 14 : 16,
            color: AppTheme.textSecondary(context),
            height: 1.7,
          ),
        ),

        const SizedBox(height: 32),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment:
          isMob ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _GradientButton(
              label: 'Hire Me',
              icon: Icons.work_outline,
              onTap: widget.onContact,
            ),

            _OutlineButton(
              label: 'Download CV',
              icon: Icons.download_outlined,
              onTap: () {},
            ),

            _OutlineButton(
              label: 'Contact Me',
              icon: Icons.mail_outline,
              onTap: widget.onContact,
            ),
          ],
        ),

        const SizedBox(height: 36),

        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment:
          isMob ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _StatBadge(
              value: '9+',
              label: 'Years Exp.',
            ),
            _StatBadge(
              value: '40+',
              label: 'Apps Built',
            ),
            _StatBadge(
              value: '15+',
              label: 'Happy Clients',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final isMob = R.isMobile(context);
    final size = isMob ? 180.0 : 260.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size + 32,
            height: size + 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppTheme.accentColor.withValues(alpha:0.15),
                  AppTheme.greenAccent.withValues(alpha:0.10),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  AppTheme.accentColor,
                  AppTheme.greenAccent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accentColor.withValues(alpha:0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profilephoto.png',
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.accentColor,
                            AppTheme.greenAccent,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: size * 0.6,
                        color: Colors.white.withValues(alpha:0.9),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 8,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppTheme.card(context),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha:0.08),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(
                  color: AppTheme.border(context),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.flutter_dash,
                    color: AppTheme.accentColor,
                    size: 16,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    'Choose Your Avatar',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================
// GRADIENT BUTTON
// ============================

class _GradientButton extends StatefulWidget {
  const _GradientButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_GradientButton> createState() =>
      _GradientButtonState();
}

class _GradientButtonState
    extends State<_GradientButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(
            0,
            _hover ? -2 : 0,
            0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppTheme.accentColor,
                AppTheme.greenAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: _hover
                ? [
              BoxShadow(
                color: AppTheme.accentColor.withValues(alpha:0.25),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 16,
              ),

              const SizedBox(width: 8),

              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================
// OUTLINE BUTTON
// ============================

class _OutlineButton extends StatefulWidget {
  const _OutlineButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_OutlineButton> createState() =>
      _OutlineButtonState();
}

class _OutlineButtonState
    extends State<_OutlineButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(
            0,
            _hover ? -2 : 0,
            0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: _hover
                ? AppTheme.accentColor.withValues(alpha:0.08)
                : Colors.transparent,
            border: Border.all(
              color: _hover
                  ? AppTheme.accentColor
                  : AppTheme.border(context),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _hover
                    ? AppTheme.accentColor
                    : AppTheme.textSecondary(context),
                size: 16,
              ),

              const SizedBox(width: 8),

              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _hover
                      ? AppTheme.accentColor
                      : AppTheme.textPrimary(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================
// STAT BADGE
// ============================

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (b) {
            return const LinearGradient(
              colors: [
                AppTheme.accentColor,
                AppTheme.greenAccent,
              ],
            ).createShader(b);
          },
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),

        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: AppTheme.textSecondary(context),
          ),
        ),
      ],
    );
  }
}
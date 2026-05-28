import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/themes/app_theme.dart';

import '../../core/model/all_model.dart';
import '../../core/string/appstring.dart';
import '../../core/widget/section_title.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

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
                  tag: AppStrings.servicesTag,
                  title: AppStrings.servicesTitle,
                  subtitle: AppStrings.servicesSubtitle,
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
                    childAspectRatio: isMob ? 1.4 : 1.6,
                  ),
                  itemCount: AppStrings.services.length,
                  itemBuilder: (ctx, i) =>
                      _ServiceCard(service: AppStrings.services[i]),
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
// SERVICE CARD
// ============================

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({required this.service});

  final ServiceItem service;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hover = false;

  void _showPopup(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (_) => _ServiceDialog(
        service: widget.service,
        isMobile: isMobile,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => _showPopup(context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _hover
                ? AppTheme.surface(context)
                : AppTheme.card(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hover
                  ? AppTheme.accentColor.withValues(alpha: 0.45)
                  : AppTheme.border(context),
            ),
            boxShadow: _hover
                ? [
              BoxShadow(
                color: AppTheme.accentColor.withValues(
                  alpha: isDark ? 0.15 : 0.10,
                ),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Icon container ──
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: _hover
                      ? AppTheme.heroGradient
                      : LinearGradient(
                    colors: [
                      AppTheme.surface(context),
                      AppTheme.surface(context),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.border(context)),
                ),
                child: Icon(
                  widget.service.icon,
                  color: AppTheme.accentColor,
                  size: 24,
                ),
              ),

              const SizedBox(height: 14),

              // ── Title ──
              Text(
                widget.service.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary(context),
                ),
              ),

              const SizedBox(height: 8),

              // ── Description (truncated) ──
              Expanded(
                child: Text(
                  widget.service.desc,
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    color: AppTheme.textSecondary(context),
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 8),

              // ── Read more ──
              Row(
                children: [
                  Text(
                    AppStrings.readMore,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppTheme.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: AppTheme.accentColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================
// SERVICE DIALOG
// ============================

class _ServiceDialog extends StatelessWidget {
  const _ServiceDialog({
    required this.service,
    required this.isMobile,
  });

  final ServiceItem service;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 24 : 60,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : 540,
        ),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 20 : 32),
          decoration: BoxDecoration(
            color: AppTheme.card(context),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.border(context)),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.35)
                    : Colors.black.withValues(alpha: 0.08),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ── Header ──
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.surface(context)
                            : AppTheme.accentColor.withValues(alpha: 0.80),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.border(context)),
                      ),
                      child: Icon(
                        service.icon,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        service.title,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 16 : 19,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary(context),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface(context),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        splashRadius: 22,
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close_rounded,
                          color: AppTheme.textSecondary(context),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Divider(color: AppTheme.border(context), thickness: 1),

                const SizedBox(height: 18),

                // ── Full description ──
                Text(
                  service.desc,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 13 : 14,
                    color: AppTheme.textSecondary(context),
                    height: 1.8,
                  ),
                ),

                const SizedBox(height: 28),

                // ── Close button ──
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppTheme.accentColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      AppStrings.close,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
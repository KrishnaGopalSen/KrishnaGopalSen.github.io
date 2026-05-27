import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/core/responsive/responsive.dart';
import 'package:krishnaGopal/themes/app_theme.dart';

import '../../core/widget/section_title.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      Icons.android,
      'Android App Development',
      'Build high-performance native Android applications using Flutter, Kotlin, and Java. '
          'Experienced in enterprise-level apps including airport transfer, eCommerce, POS systems, '
          'and multi-vendor platforms. Skilled in MVVM and Clean Architecture with state management '
          'using Riverpod, Bloc, GetX, and Provider. Integrated Google Maps API, real-time tracking, '
          'Firebase services, and payment gateways across 15+ production apps. Published and managed '
          'release builds on Google Play Store with CI/CD using Codemagic.',
    ),
    _Service(
      Icons.apple,
      'iOS App Development',
      'Develop cross-platform iOS applications using Flutter with native-feel animations and smooth '
          'interactions. Experienced in migrating native iOS features to Flutter achieving 95% feature '
          'parity with 60% reduction in codebase size. Integrated Firebase Auth, Firestore, and FCM '
          'push notifications supporting 10K+ monthly active users. Managed App Store submissions, '
          'TestFlight beta distribution, and production release builds for multiple live iOS applications.',
    ),
    _Service(
      Icons.api_outlined,
      'API Integration',
      'Integrate RESTful APIs with clean architecture and efficient data handling across Android and '
          'iOS platforms. Experienced in connecting apps to Firebase, Retrofit, third-party SDKs, and '
          'Socket.io for real-time communication. Worked with backend teams using Spring Boot to improve '
          'API response time by 55%. Implemented secure authentication flows, OTP verification, and '
          'seamless data sync between app and server.',
    ),
    _Service(
      Icons.map_outlined,
      'Real-Time Tracking',
      'Implement live location tracking, Google Maps API integration, and real-time ride tracking '
          'systems. Built complete driver and passenger tracking for airport transfer applications using '
          'Socket.io and WebSocket. Developed route navigation, ride status updates, and location-based '
          'features across 3+ production apps. Led Google Maps integration in a 6-member team increasing '
          'user engagement by 65%.',
    ),
    _Service(
      Icons.cloud_outlined,
      'Firebase & Backend Setup',
      'Setup and manage Firebase Authentication, Cloud Firestore, and FCM push notifications for '
          'scalable mobile backends. Supported 10K+ monthly active users with secure and reliable Firebase '
          'infrastructure. Experienced in real-time chat implementation handling 15K+ monthly messages. '
          'Configured CI/CD pipelines using Codemagic and GitHub Actions for automated builds and '
          'deployments across Android and iOS platforms.',
    ),
    _Service(
      Icons.payment,
      'Payment Integration',
      'Integrate secure payment gateways, OTP verification systems, and smooth in-app checkout '
          'experiences. Implemented payment flows in eCommerce, multi-vendor, and airport transfer '
          'applications. Experienced in building reward point tracking, SKU browsing, and monthly claims '
          'systems for contractor apps with 2000+ active users. Ensured secure transaction handling with '
          'proper error management and user feedback.',
    ),
    _Service(
      Icons.bug_report_outlined,
      'Bug Fixing & Optimization',
      'Diagnose and resolve complex bugs, improve app responsiveness, and optimize overall performance. '
          'Conducted unit, widget, and integration testing using flutter_test and Mockito for reliable '
          'bug-free releases. Achieved 80% reduction in real-time data update lag through optimized sync '
          'logic. Proficient in performance profiling, memory management, and reducing app load times '
          'across Android and iOS platforms.',
    ),
    _Service(
      Icons.devices_outlined,
      'Cross-Platform Development',
      'Develop Android and iOS applications from a single Flutter and Dart codebase using MVVM and '
          'Clean Architecture. Built 15+ cross-platform apps reducing delivery time by nearly one-third '
          'compared to native development. Skilled in reusable UI components, scalable module design, and '
          'state management with Riverpod, Bloc, Cubit, GetX, and Provider. Maintained consistent user '
          'experience and performance across both platforms.',
    ),
    _Service(
      Icons.store_outlined,
      'App Store Deployment',
      'Handle end-to-end app publishing for Google Play Store and Apple App Store including release '
          'build management, signing, and store listing setup. Experienced with TestFlight beta distribution '
          'and production deployment for multiple live applications. Configured CI/CD pipelines using '
          'Codemagic for automated builds and deployments. Managed Play Store developer account for '
          'Granth Technosoft Pvt. Ltd. with multiple published apps.',
    ),
  ];

  @override
  Widget build(BuildContext context) { //https://www.sahiclick.com/
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
                  tag: 'SERVICES',
                  title: 'What I Provide',
                  subtitle:
                  'End-to-end mobile development services tailored to your needs.',
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
                  itemCount: _services.length,
                  itemBuilder: (ctx, i) =>
                      _ServiceCard(service: _services[i]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _Service {
  const _Service(this.icon, this.title, this.desc);

  final IconData icon;
  final String title;
  final String desc;
}

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({required this.service});

  final _Service service;

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
      barrierColor: Colors.black.withValues(alpha:0.5),
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
            color: _hover ? AppTheme.surface(context) : AppTheme.card(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hover
                  ? AppTheme.accentColor.withValues(alpha:0.45)
                  : AppTheme.border(context),
            ),
            boxShadow: _hover
                ? [
              BoxShadow(
                color: AppTheme.accentColor.withValues(alpha:
                  isDark ? 0.15 : 0.10,
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
              Text(
                widget.service.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary(context),
                ),
              ),
              const SizedBox(height: 8),
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
              Row(
                children: [
                  Text(
                    'Read more',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppTheme.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_rounded,
                      size: 14, color: AppTheme.accentColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Popup Dialog ────────────────────────────────────────────
class _ServiceDialog extends StatelessWidget {
  const _ServiceDialog({
    required this.service,
    required this.isMobile,
  });

  final _Service service;
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
            border: Border.all(
              color: AppTheme.border(context),
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha:0.35)
                    : Colors.black.withValues(alpha:0.08),
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

                /// Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.surface(context)
                            : AppTheme.accentColor.withValues(alpha:0.80),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppTheme.border(context),
                        ),
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

                Divider(
                  color: AppTheme.border(context),
                  thickness: 1,
                ),

                const SizedBox(height: 18),

                /// Description
                Text(
                  service.desc,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 13 : 14,
                    color: AppTheme.textSecondary(context),
                    height: 1.8,
                  ),
                ),

                const SizedBox(height: 28),

                /// Close Button
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
                      'Close',
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

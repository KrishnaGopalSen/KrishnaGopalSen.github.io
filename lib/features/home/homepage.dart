import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:krishnaGopal/themes/app_theme.dart';

import '../../core/widget/nav_bar.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';
import '../sections/skills_section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final ThemeController controller = Get.find<ThemeController>();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;

    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppTheme.bg(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.changeTheme(),
          child: Icon(
            controller.themeMode.value == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),

        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,

              child: Column(
                children: [
                  const SizedBox(height: 72),

                  HeroSection(
                    key: _heroKey,
                    onContact: () => _scrollTo(_contactKey),
                  ),

                  AboutSection(key: _aboutKey),
                  SkillsSection(key: _skillsKey),
                  ServicesSection(key: _servicesKey),
                  ProjectsSection(key: _projectsKey),
                  ExperienceSection(key: _experienceKey),
                  ContactSection(key: _contactKey),
                  FooterSection(
                    onNavTap: (index) {
                      final keys = [
                        _heroKey,
                        _aboutKey,
                        _skillsKey,
                        _projectsKey,
                        _experienceKey,
                        _contactKey,
                      ];
                      _scrollTo(keys[index]);
                    },
                  ),
                  //const FooterSection(),
                ],
              ),
            ),

            NavBar(
              onNavTap: (index) {
                final keys = [
                  _heroKey,
                  _aboutKey,
                  _skillsKey,
                  _servicesKey,
                  _projectsKey,
                  _experienceKey,
                  _contactKey,
                ];

                _scrollTo(keys[index]);
              },
            ),
          ],
        ),
      );
    });
  }
}


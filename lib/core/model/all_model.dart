import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLink {
  final String label;
  final FaIconData icon;
  final String url;

  const SocialLink(
      this.label,
      this.icon,
      this.url,
      );
}
class ContactDetail {
  final IconData icon;
  final String label;
  final String value;
  const ContactDetail(this.icon, this.label, this.value);
}

class SkillItem {
  const SkillItem(this.name, this.level, this.emoji);

  final String name;
  final double level;
  final String emoji;
}

class ServiceItem {
  const ServiceItem(this.icon, this.title, this.desc);

  final IconData icon;
  final String title;
  final String desc;
}


// ─────────────────────────────────────────────
// Add this model in your all_model.dart file
// ─────────────────────────────────────────────

class ProjectItem {
  const ProjectItem({
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

class FooterLink {
  final String label;

  const FooterLink(this.label);
}


class SocialItem {
  final String label;
  final FaIconData icon;
  final String url;

  const SocialItem(
      this.label,
      this.icon,
      this.url,
      );
}
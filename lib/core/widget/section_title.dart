import 'package:flutter/material.dart';
import 'package:flutternode/themes/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.tag,
    required this.title,
    this.subtitle,
  });

  final String tag;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withValues(alpha:0.10),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.accentColor.withValues(alpha:0.20),
            ),
          ),
          child: Text(
            tag,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.accentColor,
              letterSpacing: 1.2,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary(context),
            height: 1.2,
          ),
        ),

        if (subtitle != null) ...[
          const SizedBox(height: 10),

          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: AppTheme.textSecondary(context),
              height: 1.6,
            ),
          ),
        ],

        const SizedBox(height: 16),

        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: const LinearGradient(
              colors: [
                AppTheme.accentColor,
                AppTheme.greenAccent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
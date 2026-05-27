import 'package:flutter/material.dart';

// class AppTheme {
//   static final light = LightTheme.theme;
//   static final dark = DarkTheme.theme;
// }

class AppTheme {
  AppTheme._();

  // ── Accent (same in both modes) ───────────────────────────
  static const Color accentColor  = Color(0xFF6C63FF);
  static const Color accentLight  = Color(0xFFEEEDFF);
  static const Color greenAccent  = Color(0xFF00BFA6);
  static const Color redAccent    = Color(0xFFFF6B6B);

  // ── Dark palette ─────────────────────────────────────────
  static const Color darkBg         = Color(0xFF0F1117);
  static const Color darkSurface    = Color(0xFF13151F);
  static const Color darkCard       = Color(0xFF1A1D27);
  static const Color darkBorder     = Color(0xFF2A2D3A);
  static const Color darkTextPrimary   = Color(0xFFF0F0F5);
  static const Color darkTextSecondary = Color(0xFF8B8FA8);

  // ── Light palette ────────────────────────────────────────
  static const Color lightBg         = Color(0xFFF4F6FC);
  static const Color lightSurface    = Color(0xFFFFFFFF);
  static const Color lightCard       = Color(0xFFFFFFFF);
  static const Color lightBorder     = Color(0xFFE2E6F0);
  static const Color lightTextPrimary   = Color(0xFF14161F);
  static const Color lightTextSecondary = Color(0xFF8C979B);

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFFEEF2FF), Color(0xFFF5F3FF), Color(0xFFFAFAFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  // ── Helper: pick based on brightness ─────────────────────
  static Color bg(BuildContext context) =>
      _isDark(context) ? darkBg : lightBg;

  static Color surface(BuildContext context) =>
      _isDark(context) ? darkSurface : lightSurface;

  static Color card(BuildContext context) =>
      _isDark(context) ? darkCard : lightCard;

  static Color border(BuildContext context) =>
      _isDark(context) ? darkBorder : lightBorder;

  static Color textPrimary(BuildContext context) =>
      _isDark(context) ? darkTextPrimary : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      _isDark(context) ? darkTextSecondary : lightTextSecondary;

  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  // ── ThemeData objects (pass to GetMaterialApp) ───────────
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBg,
    cardColor: lightCard,
    colorScheme: const ColorScheme.light(primary: accentColor),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: lightTextSecondary),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    cardColor: darkCard,
    colorScheme: const ColorScheme.dark(primary: accentColor),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: darkTextSecondary),
    ),
  );
}

/*
class AppTheme {
  static const Color primary   = Color(0xFF4F46E5); // Indigo
  static const Color primaryL  = Color(0xFF818CF8); // Light Indigo
  static const Color accent    = Color(0xFF06B6D4); // Cyan accent
  static const Color bgColor   = Color(0xFFFAFAFF);
  static const Color cardBg    = Color(0xFFFFFFFF);
  static const Color textDark  = Color(0xFF0F0F1A);
  static const Color textGrey  = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color border    = Color(0xFFE5E7EB);
  static const Color chipBg    = Color(0xFFEEF2FF);
  static const Color cardColor     = Color(0xFF1A1D27);
  static const Color cardBorder    = Color(0xFF2A2D3A);
  static const Color accentColor   = Color(0xFF6C63FF);
  static const Color textPrimary   = Color(0xFFF0F0F5);
  static const Color textSecondary = Color(0xFF8B8FA8);

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: accent,
      surface: bgColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: bgColor,
  );

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFFEEF2FF), Color(0xFFF5F3FF), Color(0xFFFAFAFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black.withValues(alpha:0.06), blurRadius: 20, offset: const Offset(0, 4)),
    BoxShadow(color: Colors.black.withValues(alpha:0.03), blurRadius: 6, offset: const Offset(0, 1)),
  ];

  static List<BoxShadow> primaryShadow = [
    BoxShadow(color: primary.withValues(alpha:0.30), blurRadius: 24, offset: const Offset(0, 8)),
  ];
}   */
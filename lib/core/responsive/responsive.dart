import 'package:flutter/material.dart';

class AppBreakpoints {
  static const double mobile  = 480;
  static const double tablet  = 768;
  static const double desktop = 1024;
  static const double wide    = 1280;
}

class R {
  R._();

  static double _w(BuildContext ctx) => MediaQuery.of(ctx).size.width;

  static bool isMobile(BuildContext ctx)  => _w(ctx) <  AppBreakpoints.tablet;
  static bool isTablet(BuildContext ctx)  => _w(ctx) >= AppBreakpoints.tablet && _w(ctx) < AppBreakpoints.desktop;
  static bool isDesktop(BuildContext ctx) => _w(ctx) >= AppBreakpoints.desktop;
  static bool isWide(BuildContext ctx)    => _w(ctx) >= AppBreakpoints.wide;

  static T value<T>(BuildContext ctx, {required T mobile, T? tablet, T? desktop, T? wide}) {
    final w = _w(ctx);
    if (w >= AppBreakpoints.wide    && wide    != null) return wide;
    if (w >= AppBreakpoints.desktop && desktop != null) return desktop;
    if (w >= AppBreakpoints.tablet  && tablet  != null) return tablet;
    return mobile;
  }

  static double spacing(BuildContext ctx) =>
      value(ctx, mobile: 12, tablet: 20, desktop: 28, wide: 36);

  static EdgeInsets padding(BuildContext ctx) => EdgeInsets.all(spacing(ctx));
  static EdgeInsets paddingH(BuildContext ctx) => EdgeInsets.symmetric(horizontal: spacing(ctx));
  static EdgeInsets paddingV(BuildContext ctx) => EdgeInsets.symmetric(vertical: spacing(ctx));

  static double fontSize(BuildContext ctx, double base) =>
      value(ctx, mobile: base, tablet: base * 1.1, desktop: base * 1.2);

  static double headline(BuildContext ctx) => fontSize(ctx, 24);
  static double title(BuildContext ctx)    => fontSize(ctx, 18);
  static double body(BuildContext ctx)     => fontSize(ctx, 14);
  static double caption(BuildContext ctx)  => fontSize(ctx, 11);

  static double maxWidth(BuildContext ctx) =>
      value(ctx, mobile: double.infinity, tablet: 720, desktop: 1000, wide: 1200);

  static int columns(BuildContext ctx) =>
      value(ctx, mobile: 1, tablet: 2, desktop: 3, wide: 4);

  static double iconSize(BuildContext ctx) =>
      value(ctx, mobile: 20, tablet: 22, desktop: 24);

  static double buttonHeight(BuildContext ctx) =>
      value(ctx, mobile: 44, tablet: 48, desktop: 52);

  static BorderRadius radius(BuildContext ctx) =>
      BorderRadius.circular(value(ctx, mobile: 8, tablet: 10, desktop: 12));
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.mobile, this.tablet, this.desktop});
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext ctx) {
    if (R.isDesktop(ctx)) return desktop ?? tablet ?? mobile;
    if (R.isTablet(ctx))  return tablet  ?? mobile;
    return mobile;
  }
}

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, required this.child, this.padding, this.alignment = Alignment.topCenter});
  final Widget child;
  final EdgeInsets? padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext ctx) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: R.maxWidth(ctx)),
        child: Padding(
          padding: padding ?? R.padding(ctx),
          child: child,
        ),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key, required this.children, this.crossAxisSpacing = 16, this.mainAxisSpacing = 16, this.childAspectRatio = 1.0});
  final List<Widget> children;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext ctx) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: R.columns(ctx),
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
      children: children,
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  const ResponsiveRow({super.key, required this.children, this.spacing = 16, this.mainAxisAlignment = MainAxisAlignment.start, this.crossAxisAlignment = CrossAxisAlignment.start});
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext ctx) {
    final gap = SizedBox(width: R.isMobile(ctx) ? 0 : spacing, height: R.isMobile(ctx) ? spacing : 0);
    final separated = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      separated.add(R.isMobile(ctx) ? children[i] : Expanded(child: children[i]));
      if (i < children.length - 1) separated.add(gap);
    }
    return R.isMobile(ctx)
        ? Column(crossAxisAlignment: crossAxisAlignment, children: separated)
        : Row(mainAxisAlignment: mainAxisAlignment, crossAxisAlignment: crossAxisAlignment, children: separated);
  }
}








// import 'package:flutter/material.dart';
//
// // ─────────────────────────────────────────────
// //  📐 BREAKPOINTS
// // ─────────────────────────────────────────────
// class AppBreakpoints {
//   static const double mobile  = 480;
//   static const double tablet  = 768;
//   static const double desktop = 1024;
//   static const double wide    = 1280;
// }
//
// // ─────────────────────────────────────────────
// //  📱 RESPONSIVE HELPER  (main class)
// //  Usage:  R.isMobile(context)
// //          R.padding(context)
// //          R.fontSize(context, 16)
// // ─────────────────────────────────────────────
// class R {
//   R._(); // private constructor — only static use
//
//   static double _w(BuildContext ctx) =>
//       MediaQuery.of(ctx).size.width;
//
//   // ── Device type ──────────────────────────────
//   static bool isMobile(BuildContext ctx)  => _w(ctx) <  AppBreakpoints.tablet;
//   static bool isTablet(BuildContext ctx)  => _w(ctx) >= AppBreakpoints.tablet &&
//       _w(ctx) <  AppBreakpoints.desktop;
//   static bool isDesktop(BuildContext ctx) => _w(ctx) >= AppBreakpoints.desktop;
//   static bool isWide(BuildContext ctx)    => _w(ctx) >= AppBreakpoints.wide;
//
//   // ── Responsive value picker ───────────────────
//   /// Returns the value matching the current breakpoint.
//   /// Smaller breakpoints fall back to the next smaller defined value.
//   static T value<T>(
//       BuildContext ctx, {
//         required T mobile,
//         T? tablet,
//         T? desktop,
//         T? wide,
//       }) {
//     final w = _w(ctx);
//     if (w >= AppBreakpoints.wide    && wide    != null) return wide;
//     if (w >= AppBreakpoints.desktop && desktop != null) return desktop;
//     if (w >= AppBreakpoints.tablet  && tablet  != null) return tablet;
//     return mobile;
//   }
//
//   // ── Spacing ───────────────────────────────────
//   static double spacing(BuildContext ctx) =>
//       value(ctx, mobile: 12, tablet: 20, desktop: 28, wide: 36);
//
//   static EdgeInsets padding(BuildContext ctx) {
//     final s = spacing(ctx);
//     return EdgeInsets.all(s);
//   }
//
//   static EdgeInsets paddingH(BuildContext ctx) {
//     final s = spacing(ctx);
//     return EdgeInsets.symmetric(horizontal: s);
//   }
//
//   static EdgeInsets paddingV(BuildContext ctx) {
//     final s = spacing(ctx);
//     return EdgeInsets.symmetric(vertical: s);
//   }
//
//   // ── Typography ────────────────────────────────
//   /// Scales a base font size proportionally across devices.
//   static double fontSize(BuildContext ctx, double base) =>
//       value(ctx, mobile: base, tablet: base * 1.1, desktop: base * 1.2);
//
//   static double get _headlineBase => 24;
//   static double get _titleBase     => 18;
//   static double get _bodyBase      => 14;
//   static double get _captionBase   => 11;
//
//   static double headline(BuildContext ctx) => fontSize(ctx, _headlineBase);
//   static double title(BuildContext ctx)    => fontSize(ctx, _titleBase);
//   static double body(BuildContext ctx)     => fontSize(ctx, _bodyBase);
//   static double caption(BuildContext ctx)  => fontSize(ctx, _captionBase);
//
//   // ── Layout ────────────────────────────────────
//   /// Max content width (centers on large screens like a website container).
//   static double maxWidth(BuildContext ctx) =>
//       value(ctx, mobile: double.infinity, tablet: 720, desktop: 1000, wide: 1200);
//
//   /// Number of grid columns.
//   static int columns(BuildContext ctx) =>
//       value(ctx, mobile: 1, tablet: 2, desktop: 3, wide: 4);
//
//   /// Icon size.
//   static double iconSize(BuildContext ctx) =>
//       value(ctx, mobile: 20, tablet: 22, desktop: 24);
//
//   /// Button height.
//   static double buttonHeight(BuildContext ctx) =>
//       value(ctx, mobile: 44, tablet: 48, desktop: 52);
//
//   // ── Radius ───────────────────────────────────
//   static BorderRadius radius(BuildContext ctx) =>
//       BorderRadius.circular(value(ctx, mobile: 8, tablet: 10, desktop: 12));
// }
//
// // ─────────────────────────────────────────────
// //  🧩 ResponsiveBuilder widget
// //  Usage:
// //   ResponsiveBuilder(
// //     mobile:  MobileLayout(),
// //     tablet:  TabletLayout(),
// //     desktop: DesktopLayout(),
// //   )
// // ─────────────────────────────────────────────
// class ResponsiveBuilder extends StatelessWidget {
//   const ResponsiveBuilder({
//     super.key,
//     required this.mobile,
//     this.tablet,
//     this.desktop,
//   });
//
//   final Widget mobile;
//   final Widget? tablet;
//   final Widget? desktop;
//
//   @override
//   Widget build(BuildContext ctx) {
//     if (R.isDesktop(ctx)) return desktop ?? tablet ?? mobile;
//     if (R.isTablet(ctx))  return tablet  ?? mobile;
//     return mobile;
//   }
// }
//
// // ─────────────────────────────────────────────
// //  📦 ResponsiveContainer
// //  Wraps content with max-width + centered padding.
// //  Drop this around any screen body.
// // ─────────────────────────────────────────────
// class ResponsiveContainer extends StatelessWidget {
//   const ResponsiveContainer({
//     super.key,
//     required this.child,
//     this.padding,
//     this.alignment = Alignment.topCenter,
//   });
//
//   final Widget child;
//   final EdgeInsets? padding;
//   final Alignment alignment;
//
//   @override
//   Widget build(BuildContext ctx) {
//     return Align(
//       alignment: alignment,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: R.maxWidth(ctx)),
//         child: Padding(
//           padding: padding ?? R.padding(ctx),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────
// //  🔲 ResponsiveGrid
// //  Auto column grid — columns change with screen.
// //  Usage:
// //   ResponsiveGrid(children: [ Card(), Card(), … ])
// // ─────────────────────────────────────────────
// class ResponsiveGrid extends StatelessWidget {
//   const ResponsiveGrid({
//     super.key,
//     required this.children,
//     this.crossAxisSpacing = 16,
//     this.mainAxisSpacing  = 16,
//     this.childAspectRatio = 1.0,
//   });
//
//   final List<Widget> children;
//   final double crossAxisSpacing;
//   final double mainAxisSpacing;
//   final double childAspectRatio;
//
//   @override
//   Widget build(BuildContext ctx) {
//     return GridView.count(
//       shrinkWrap:       true,
//       physics:          const NeverScrollableScrollPhysics(),
//       crossAxisCount:   R.columns(ctx),
//       crossAxisSpacing: crossAxisSpacing,
//       mainAxisSpacing:  mainAxisSpacing,
//       childAspectRatio: childAspectRatio,
//       children:         children,
//     );
//   }
// }
//
// // ─────────────────────────────────────────────
// //  ↔️  ResponsiveRow
// //  Mobile → Column,  Tablet/Desktop → Row
// // ─────────────────────────────────────────────
// class ResponsiveRow extends StatelessWidget {
//   const ResponsiveRow({
//     super.key,
//     required this.children,
//     this.spacing = 16,
//     this.mainAxisAlignment = MainAxisAlignment.start,
//     this.crossAxisAlignment = CrossAxisAlignment.start,
//   });
//
//   final List<Widget> children;
//   final double spacing;
//   final MainAxisAlignment mainAxisAlignment;
//   final CrossAxisAlignment crossAxisAlignment;
//
//   @override
//   Widget build(BuildContext ctx) {
//     final gap = SizedBox(
//       width:  R.isMobile(ctx) ? 0 : spacing,
//       height: R.isMobile(ctx) ? spacing : 0,
//     );
//
//     final separated = <Widget>[];
//     for (int i = 0; i < children.length; i++) {
//       separated.add(
//         R.isMobile(ctx) ? children[i] : Expanded(child: children[i]),
//       );
//       if (i < children.length - 1) separated.add(gap);
//     }
//
//     return R.isMobile(ctx)
//         ? Column(
//       crossAxisAlignment: crossAxisAlignment,
//       children: separated,
//     )
//         : Row(
//       mainAxisAlignment:  mainAxisAlignment,
//       crossAxisAlignment: crossAxisAlignment,
//       children: separated,
//     );
//   }
// }
//
// // ─────────────────────────────────────────────
// //  📝  AppTextStyles  (ready-to-use TextStyles)
// // ─────────────────────────────────────────────
// class AppTextStyles {
//   static TextStyle headline(BuildContext ctx, {Color? color}) => TextStyle(
//     fontSize:   R.headline(ctx),
//     fontWeight: FontWeight.w700,
//     color:      color,
//   );
//
//   static TextStyle title(BuildContext ctx, {Color? color}) => TextStyle(
//     fontSize:   R.title(ctx),
//     fontWeight: FontWeight.w600,
//     color:      color,
//   );
//
//   static TextStyle body(BuildContext ctx, {Color? color}) => TextStyle(
//     fontSize: R.body(ctx),
//     color:    color,
//   );
//
//   static TextStyle caption(BuildContext ctx, {Color? color}) => TextStyle(
//     fontSize:   R.caption(ctx),
//     color:      color ?? Colors.grey,
//   );
// }
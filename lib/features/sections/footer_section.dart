import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishnaGopal/core/string/appstring.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/all_model.dart';
import '../../themes/app_theme.dart';

// ─────────────────────────────────────────────
// FOOTER SECTION
// ─────────────────────────────────────────────
class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.onNavTap,
  });

  final Function(int index) onNavTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.surface(context),
        border: Border(
          top: BorderSide(
            color: AppTheme.border(context),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80,
              vertical: 56,
            ),
            child: isMobile
                ? _MobileFooterBody(onNavTap: onNavTap)
                : _DesktopFooterBody(onNavTap: onNavTap),
          ),

          _FooterBottomBar(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// DESKTOP LAYOUT
// ─────────────────────────────────────────────
class _DesktopFooterBody extends StatelessWidget {
  const _DesktopFooterBody({
    required this.onNavTap,
  });

  final Function(int index) onNavTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _BrandColumn(),
        ),

        const SizedBox(width: 40),

        Expanded(
          flex: 2,
          child: _FooterLinkColumn(
            title: AppStrings.footerNavTitle,
            links: AppStrings.navLinks,
            onNavTap: onNavTap,
          ),
        ),

        const SizedBox(width: 24),

        Expanded(
          flex: 2,
          child: _FooterLinkColumn(
            title: AppStrings.footerServTitle,
            links: AppStrings.serviceLinks,
          ),
        ),

        const SizedBox(width: 24),

        Expanded(
          flex: 3,
          child: _NewsletterColumn(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// MOBILE LAYOUT
// ─────────────────────────────────────────────
class _MobileFooterBody extends StatelessWidget {
  const _MobileFooterBody({
    required this.onNavTap,
  });

  final Function(int index) onNavTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BrandColumn(),

        const SizedBox(height: 36),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FooterLinkColumn(
                title: AppStrings.footerNavTitle,
                links: AppStrings.navLinks,
                onNavTap: onNavTap,
              ),
            ),

            const SizedBox(width: 24),

            Expanded(
              child: _FooterLinkColumn(
                title: AppStrings.footerServTitle,
                links: AppStrings.serviceLinks,
              ),
            ),
          ],
        ),

        const SizedBox(height: 36),

        _NewsletterColumn(),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// BRAND COLUMN
// ─────────────────────────────────────────────
class _BrandColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppTheme.accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  AppStrings.footerInitials,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 07),

            Text(
              AppStrings.footerName,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary(context),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Text(AppStrings.footerTagline,
          style: GoogleFonts.inter(
            fontSize: 13.5,
            color: AppTheme.textSecondary(context),
            height: 1.7,
          ),
        ),

        const SizedBox(height: 24),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: AppStrings.socialItems
              .map((e) => _SocialIcon(item: e))
              .toList(),
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppTheme.greenAccent.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.greenAccent.withValues(alpha:0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                AppStrings.footerAvailable,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppTheme.greenAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// LINKS
// ─────────────────────────────────────────────


class _FooterLinkColumn extends StatelessWidget {
  const _FooterLinkColumn({
    required this.title,
    required this.links,
    this.onNavTap,
  });

  final String title;
  final List<FooterLink> links;
  final Function(int index)? onNavTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary(context),
          ),
        ),

        const SizedBox(height: 16),

        ...List.generate(
          links.length,
              (index) => _FooterLinkItem(
            link: links[index],
            onTap: () {
              if (onNavTap != null) {
                onNavTap!(index);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _FooterLinkItem extends StatefulWidget {
  const _FooterLinkItem({
    required this.link,
    this.onTap,
  });

  final FooterLink link;
  final VoidCallback? onTap;

  @override
  State<_FooterLinkItem> createState() => _FooterLinkItemState();
}

class _FooterLinkItemState extends State<_FooterLinkItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.inter(
              fontSize: 13.5,
              color: hovered
                  ? AppTheme.accentColor
                  : AppTheme.textSecondary(context),
              fontWeight:
              hovered ? FontWeight.w600 : FontWeight.w400,
            ),
            child: Text(widget.link.label),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// NEWSLETTER
// ─────────────────────────────────────────────
class _NewsletterColumn extends StatefulWidget {
  @override
  State<_NewsletterColumn> createState() =>
      _NewsletterColumnState();
}

class _NewsletterColumnState
    extends State<_NewsletterColumn> {
  final TextEditingController _emailCtr =
  TextEditingController();

  bool subscribed = false;

  @override
  void dispose() {
    _emailCtr.dispose();
    super.dispose();
  }

  Future<void> _subscribe() async {
    if (_emailCtr.text.trim().contains('@')) {
      setState(() {
        subscribed = true;
      });

      final String subjectdata =
      Uri.encodeComponent(_emailCtr.text.trim());

      final String body = Uri.encodeComponent(
        '${AppStrings.message}: ${subjectdata.trim()}',
      );

      final Uri emailUri = Uri.parse(
        'mailto:${AppStrings.email}'
            '?subject=Stay Updated'
            '&body=$body',
      );

      try {
        final bool launched = await launchUrl(
          emailUri,
          mode: LaunchMode.externalApplication,
        );

        if (launched) {
          setState(() {
            subscribed = true;
          });
          _emailCtr.clear();
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Could not open email app"),
            ),
          );
        }
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            subscribed = false;
          });
        }
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.footerStayUpdated,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary(context),
          ),
        ),

        const SizedBox(height: 12),

        Text(AppStrings.footerStayDesc,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.textSecondary(context),
            height: 1.6,
          ),
        ),

        const SizedBox(height: 16),

        subscribed
            ? Row(
          children: [
            Icon(
              Icons.check_circle,
              color: AppTheme.greenAccent,
              size: 18,
            ),

            const SizedBox(width: 8),

            Text(AppStrings.footerSubscribed,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.greenAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
            : Row(
          children: [
            Expanded(
              child: TextField(
                controller: _emailCtr,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppTheme.textPrimary(context),
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.emailHint,
                  hintStyle: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.textSecondary(context)
                        .withValues(alpha:0.5),
                  ),
                  filled: true,
                  fillColor: AppTheme.card(context),
                  contentPadding:
                  const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppTheme.border(context),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppTheme.border(context),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                      color: AppTheme.accentColor,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            GestureDetector(
              onTap: _subscribe,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppTheme.accentColor,
                  borderRadius:
                  BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// SOCIAL ICONS
// ─────────────────────────────────────────────

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({
    required this.item,
  });

  final SocialItem item;

  @override
  State<_SocialIcon> createState() =>
      _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool hovered = false;

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.item.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            hovered = false;
          });
        },
        child:  GestureDetector(
          onTap: () => _openUrl(widget.item.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: hovered
                  ? AppTheme.accentColor
                  : AppTheme.card(context),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: hovered
                    ? AppTheme.accentColor
                    : AppTheme.border(context),
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.item.icon,
                size: 16,
                color: hovered
                    ? Colors.white
                    : AppTheme.textSecondary(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// BOTTOM BAR
// ─────────────────────────────────────────────
class _FooterBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < 700;

    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppTheme.border(context),
          ),
        ),
      ),
      child: isMobile
          ? Column(
        children: [
          _copyright(context, year),

          const SizedBox(height: 8),

          _madeWith(context),
        ],
      )
          : Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          _copyright(context, year),
          _madeWith(context),
        ],
      ),
    );
  }

  Widget _copyright(
      BuildContext context,
      int year,
      ) {
    return Text(
      '© $year ${AppStrings.footerCopyright}',
      style: GoogleFonts.inter(
        fontSize: 12,
        color: AppTheme.textSecondary(context),
      ),
    );
  }

  Widget _madeWith(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.footerMadeWith,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppTheme.textSecondary(context),
          ),
        ),

        const Icon(
          Icons.favorite,
          size: 12,
          color: AppTheme.redAccent,
        ),

        Text(
          AppStrings.footerUsingFlutter,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppTheme.textSecondary(context),
          ),
        ),
      ],
    );
  }
}
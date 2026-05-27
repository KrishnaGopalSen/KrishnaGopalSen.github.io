import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../responsive/responsive.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.onNavTap,
  });

  final void Function(int index) onNavTap;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  final _items = const [
    'Home',
    'About',
    'Skills',
    'Services',
    'Projects',
    'Experience',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,

      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface(context).withValues(alpha:0.92),

          border: Border(
            bottom: BorderSide(
              color: AppTheme.border(context),
            ),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.05),
              blurRadius: 16,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: ClipRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 64,

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),

                  child: Row(
                    children: [
                      // Logo
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
                          'KG',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Krishna Gopal Sen',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary(context),
                        ),
                      ),
                      const Spacer(),
                      if (R.isDesktop(context))
                        Row(
                          children: List.generate(
                            _items.length,
                                (i) => _NavItem(
                              label: _items[i],
                              onTap: () => widget.onNavTap(i),
                            ),
                          ),
                        )
                      else
                        IconButton(
                          icon: Icon(
                            _menuOpen
                                ? Icons.close
                                : Icons.menu,
                            color: AppTheme.textPrimary(context),
                          ),

                          onPressed: () {
                            setState(() {
                              _menuOpen = !_menuOpen;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),

              // Mobile Menu
              if (_menuOpen && !R.isDesktop(context))
                Container(
                  color: AppTheme.card(context),

                  child: Column(
                    children: List.generate(
                      _items.length,
                          (i) => ListTile(
                        title: Text(
                          _items[i],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textPrimary(context),
                          ),
                        ),

                        onTap: () {
                          setState(() {
                            _menuOpen = false;
                          });
                          widget.onNavTap(i);
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hover = true);
      },
      onExit: (_) {
        setState(() => _hover = false);
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _hover
                      ? AppTheme.accentColor
                      : AppTheme.textSecondary(context),                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hover ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppTheme.accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
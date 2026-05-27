import 'package:flutter/material.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../themes/app_theme.dart';


// ─────────────────────────────────────────────
// CONTACT SECTION
// ─────────────────────────────────────────────
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey    = GlobalKey<FormState>();
  final _nameCtr    = TextEditingController();
  final _emailCtr   = TextEditingController();
  final _phoneController   = TextEditingController();
  final _subjectCtr = TextEditingController();
  final _msgCtr     = TextEditingController();
  bool _submitted   = false;
  bool _loading     = false;

  @override
  void dispose() {
    _nameCtr.dispose();
    _emailCtr.dispose();
    _subjectCtr.dispose();
    _phoneController.dispose();
    _msgCtr.dispose();
    super.dispose();
  }


  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _loading = true;
    });

    final String subject =
    Uri.encodeComponent(_subjectCtr.text.trim());

    final String body = Uri.encodeComponent(
      'Name: ${_nameCtr.text.trim()}\n'
          'Email: ${_emailCtr.text.trim()}\n'
          'Contact Number: ${_phoneController.text.trim()}\n'
          'Message: ${_msgCtr.text.trim()}',
    );

    final Uri emailUri = Uri.parse(
      'mailto:krishnagopalsen22@gmail.com'
          '?subject=$subject'
          '&body=$body',
    );

    try {
      final bool launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );

      if (launched) {
        setState(() {
          _submitted = true;
        });

        _nameCtr.clear();
        _emailCtr.clear();
        _phoneController.clear();
        _subjectCtr.clear();
        _msgCtr.clear();
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
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Obx(() {
      // Track theme changes
      Get.find<ThemeController>().themeMode.value;

      return Container(
        width: double.infinity,
        color: AppTheme.surface(context),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 80,
        ),
        child: isMobile
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ContactInfo(isMobile: isMobile),
            const SizedBox(height: 48),
            _ContactForm(
              formKey: _formKey,
              nameCtr: _nameCtr,
              emailCtr: _emailCtr,
              phoneController: _phoneController,
              subjectCtr: _subjectCtr,
              msgCtr: _msgCtr,
              loading: _loading,
              submitted: _submitted,
              onSubmit: _submit,
            ),
          ],
        )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: _ContactInfo(isMobile: isMobile)),
            const SizedBox(width: 60),
            Expanded(
              flex: 7,
              child: _ContactForm(
                formKey: _formKey,
                nameCtr: _nameCtr,
                emailCtr: _emailCtr,
                phoneController: _phoneController,
                subjectCtr: _subjectCtr,
                msgCtr: _msgCtr,
                loading: _loading,
                submitted: _submitted,
                onSubmit: _submit,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// ─────────────────────────────────────────────
// CONTACT INFO (left)
// ─────────────────────────────────────────────
class _ContactInfo extends StatelessWidget {
  final bool isMobile;
  const _ContactInfo({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
            color: AppTheme.accentColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Let's Work\nTogether",
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary(context),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Have a project in mind or just want to say hello? "
              "Fill in the form and I'll get back to you within 24 hours.",
          style: GoogleFonts.inter(
            fontSize: isMobile ? 13 : 15,
            color: AppTheme.textSecondary(context),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 36),
        ..._contactDetails.map((d) => _ContactDetailRow(detail: d)),
        const SizedBox(height: 32),
        Row(
          children: _socialLinks
              .map((s) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _SocialButton(label: s.label, icon: s.icon,url: s.url),
          ))
              .toList(),
        ),
      ],
    );
  }
}

class _ContactDetail {
  final IconData icon;
  final String label;
  final String value;
  const _ContactDetail(this.icon, this.label, this.value);
}

const List<_ContactDetail> _contactDetails = [
  _ContactDetail(Icons.email_outlined,       'Email',    'krishnagopalsen22@gmail.com'),
  _ContactDetail(Icons.phone_outlined,       'Phone',    '+91 87704 00610'),
  _ContactDetail(Icons.location_on_outlined, 'Location', 'Indore, India'),
];

class _ContactDetailRow extends StatelessWidget {
  final _ContactDetail detail;
  const _ContactDetailRow({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.accentColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(detail.icon, size: 18, color: AppTheme.accentColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.label,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.textSecondary(context),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  detail.value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _SocialLink {
  final String label;
  final FaIconData icon;
  final String url;

  const _SocialLink(
      this.label,
      this.icon,
      this.url,
      );
}

const List<_SocialLink> _socialLinks = [
  _SocialLink(
    'GitHub',
    FontAwesomeIcons.github,
    'https://github.com/KrishnaGopalSen',
  ),

  _SocialLink(
    'LinkedIn',
    FontAwesomeIcons.linkedinIn,
    'https://www.linkedin.com/in/krishna-gopal-8b85338b/',
  ),

  _SocialLink(
    'Twitter',
    FontAwesomeIcons.xTwitter,
    'https://x.com/krishna28051986',
  ),

  _SocialLink(
    'Instagram',
    FontAwesomeIcons.instagram,
    'https://www.instagram.com/krishngopal28?igsh=dmE4YjE5bmZhMHN5',
  ),

  _SocialLink(
    'WhatsApp',
    FontAwesomeIcons.whatsapp,
    'https://wa.me/918770400610',
  ),




];

class _SocialButton extends StatefulWidget {
  final String label;
  final FaIconData icon;
  final String url;
  const _SocialButton({required this.label, required this.icon,required this.url});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

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
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: _hovered
                ? AppTheme.accentColor
                : AppTheme.accentColor.withValues(alpha:0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? AppTheme.accentColor : AppTheme.border(context),
            ),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              size: 15,
              color: _hovered ? Colors.white : AppTheme.accentColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CONTACT FORM (right)
// ─────────────────────────────────────────────
class _ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtr, emailCtr,phoneController, subjectCtr, msgCtr;
  final bool loading;
  final bool submitted;
  final VoidCallback onSubmit;

  const _ContactForm({
    required this.formKey,
    required this.nameCtr,
    required this.emailCtr,
    required this.phoneController,
    required this.subjectCtr,
    required this.msgCtr,
    required this.loading,
    required this.submitted,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    if (submitted) return const _SuccessMessage();

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.card(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.border(context)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Message',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary(context),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _AppTextField(
                    controller: nameCtr,
                    label: 'Your Name',
                    hint: 'Enter your name',
                    validator: (v) => v == null || v.isEmpty ? 'Name required' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _AppTextField(
                    controller: emailCtr,
                    label: 'Email',
                    hint: 'contact@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Email required';
                      if (!v.contains('@')) return 'Invalid email';
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _AppTextField(
              controller: phoneController,
              label: 'Contact Number',
              hint: '+91 9876543210',
              keyboardType: TextInputType.number,
              validator: (v) => v == null || v.isEmpty ? 'Contact number required' : null,
            ),
            const SizedBox(height: 16),
            _AppTextField(
              controller: subjectCtr,
              label: 'Subject',
              hint: 'Project Inquiry',
              validator: (v) => v == null || v.isEmpty ? 'Subject required' : null,
            ),
            const SizedBox(height: 16),
            _AppTextField(
              controller: msgCtr,
              label: 'Message',
              hint: 'Tell me about your project...',
              maxLines: 10,
              minLines: 3,
              validator: (v) => v == null || v.length < 10 ? 'Message too short' : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: loading ? null : onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: loading
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send Message',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.send_rounded, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TEXT FIELD
// ─────────────────────────────────────────────
class _AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final int maxLines;
  final int minLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _AppTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondary(context),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppTheme.textPrimary(context),
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: AppTheme.textSecondary(context).withValues(alpha:0.5),
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppTheme.bg(context),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.border(context)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.accentColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// SUCCESS STATE
// ─────────────────────────────────────────────
class _SuccessMessage extends StatelessWidget {
  const _SuccessMessage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.card(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.greenAccent.withValues(alpha:0.4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppTheme.greenAccent.withValues(alpha:0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_rounded, color: AppTheme.greenAccent, size: 32),
          ),
          const SizedBox(height: 20),
          Text(
            'Message Sent!',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary(context),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Thanks for reaching out. I'll get back to you within 24 hours.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary(context),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
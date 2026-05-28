import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/all_model.dart';

class AppStrings {

  // ─────────────────────────────────────────────
  // HERO SECTION
  // ─────────────────────────────────────────────

  static const String availableForWork = 'Available for work';
  static const String hiIm = "Hi, I'm";
  static const String developerName = 'Krishna Gopal Sen';
  static const String developerTitle = 'Sr. Mobile Application Developer';
  static const String heroBio =
      'Senior Flutter & Android Developer crafting scalable cross-platform mobile applications with modern architectures and real-time solutions.'
      '\n9+ Years Experience\nFlutter | Kotlin | Android | Firebase | Clean Architecture';

  static const String hireMe = 'Hire Me';
  static const String downloadCV = 'Download CV';
  static const String contactMe = 'Contact Me';

  static const String yearsExp = '9+';
  static const String yearsExpLabel = 'Years Exp.';
  static const String appsBuilt = '40+';
  static const String appsBuiltLabel = 'Apps Built';
  static const String happyClients = '15+';
  static const String happyClientsLabel = 'Happy Clients';
  static const String chooseYourAvatar = 'Choose Your Avatar';

  // ─────────────────────────────────────────────
  // ABOUT SECTION
  // ─────────────────────────────────────────────

  static const String aboutTag = 'ABOUT ME';
  static const String aboutTitle = 'Passionate Flutter & Android Developer';
  static const String aboutSubtitle =
      'Creating scalable and high-performance mobile applications for Android, iOS, and Web.';

  static const String labelName = 'Name';
  static const String labelLocation = 'Location';
  static const String labelExperience = 'Experience';
  static const String labelPlatforms = 'Platforms';
  static const String labelLanguages = 'Languages';

  static const String infoName = 'Mr. Krishna Gopal Sen';
  static const String infoLocation = 'Indore (India)';
  static const String infoExperience = '9+ Years';
  static const String infoPlatforms = 'Android | iOS | Web';
  static const String infoLanguages = 'Flutter | Dart | Kotlin | Java';

  static const String miniStatApps = '40+';
  static const String miniStatAppsLabel = 'Apps';
  static const String miniStatClients = '15+';
  static const String miniStatClientsLabel = 'Clients';
  static const String miniStatRating = '4.5';
  static const String miniStatRatingLabel = 'Rating';

  static const String aboutHeading = 'Building Digital Experiences';
  static const String aboutPara1 =
      'Senior Flutter & Android Developer with 9+ years of experience in building '
      'scalable and high-performance mobile applications for Android and iOS platforms.'
      'Skilled in Flutter, Kotlin, Java, Firebase, REST APIs, and real-time application development.';
  static const String aboutPara2 =
      'I also have knowledge of backend technologies including Node.js,'
      ' Express.js, and MongoDB for building scalable APIs and backend services. '
      'Experienced in developing enterprise applications including airport transfer systems, '
      'eCommerce platforms, POS solutions, and multi-vendor apps.';
  static const String aboutWhatIBring = 'What I bring to the table:';

  static const List<String> aboutBullets = [
    '⚡ Scalable and high-performance mobile applications.',
    '📱 Cross-platform Android & iOS development with Flutter.',
    '🔥 Firebase integration (Auth, Firestore, Push Notifications).',
    '🌐 REST API development with Node.js & Express.js.',
    '🗄️ MongoDB database integration and backend handling.',
    '🗺️ Google Maps & real-time tracking systems.',
    '🏗️ Clean Architecture with GetX, Riverpod, Bloc & MVVM.',
    '🚀 Play Store & App Store deployment experience.',
  ];

  // ─────────────────────────────────────────────
  // SKILLS SECTION
  // ─────────────────────────────────────────────

  static const String skillsTag = 'MY SKILLS';
  static const String skillsTitle = 'Technical Expertise';
  static const String skillsSubtitle =
      'Technologies I use to build modern mobile applications.';

  static const List<SkillItem> skills = [
    // Mobile Development
    SkillItem('Flutter', 0.95, '🐦'),
    SkillItem('Dart', 0.93, '🎯'),
    SkillItem('Kotlin', 0.82, '🟣'),
    SkillItem('Java', 0.80, '☕'),
    SkillItem('Android SDK', 0.90, '🤖'),
    SkillItem('Jetpack Compose', 0.78, '🧩'),

    // Architecture & State Management
    SkillItem('MVVM', 0.88, '🏗️'),
    SkillItem('Clean Architecture', 0.86, '🛠️'),
    SkillItem('GetX', 0.90, '⚡'),
    SkillItem('Riverpod', 0.80, '🌊'),
    SkillItem('Bloc / Cubit', 0.82, '🧱'),
    SkillItem('Provider', 0.87, '📦'),

    // Backend & Database
    SkillItem('REST APIs', 0.85, '🌐'),
    SkillItem('Firebase Auth', 0.88, '🔥'),
    SkillItem('Firestore', 0.84, '📂'),
    SkillItem('FCM', 0.83, '🔔'),
    SkillItem('SQLite', 0.80, '🗄️'),
    SkillItem('Hive', 0.78, '🍯'),
    SkillItem('Node.js', 0.78, '🟢'),
    SkillItem('MongoDB', 0.76, '🍃'),
    SkillItem('Spring Boot', 0.72, '☕'),

    // Tools & DevOps
    SkillItem('Git & GitHub', 0.88, '🐙'),
    SkillItem('Codemagic', 0.78, '🚀'),
    SkillItem('CI/CD', 0.80, '🔄'),
    SkillItem('Android Studio', 0.92, '🤖'),
    SkillItem('VS Code', 0.90, '💻'),
    SkillItem('Play Store Deployment', 0.85, '📱'),
    SkillItem('App Store Deployment', 0.75, '🍎'),
    SkillItem('TestFlight', 0.78, '✈️'),
    SkillItem('Xcode', 0.75, '🛠️'),
  ];

  // ─────────────────────────────────────────────
  // SERVICES SECTION
  // ─────────────────────────────────────────────

  static const String servicesTag = 'SERVICES';
  static const String servicesTitle = 'What I Provide';
  static const String servicesSubtitle =
      'End-to-end mobile development services tailored to your needs.';
  static const String readMore = 'Read more';
  static const String close = 'Close';

  static const List<ServiceItem> services = [
    ServiceItem(
      Icons.android,
      'Android App Development',
      'Build high-performance native Android applications using Flutter, Kotlin, and Java. '
          'Experienced in enterprise-level apps including airport transfer, eCommerce, POS systems, '
          'and multi-vendor platforms. Skilled in MVVM and Clean Architecture with state management '
          'using Riverpod, Bloc, GetX, and Provider. Integrated Google Maps API, real-time tracking, '
          'Firebase services, and payment gateways across 15+ production apps. Published and managed '
          'release builds on Google Play Store with CI/CD using Codemagic.',
    ),
    ServiceItem(
      Icons.apple,
      'iOS App Development',
      'Develop cross-platform iOS applications using Flutter with native-feel animations and smooth '
          'interactions. Experienced in migrating native iOS features to Flutter achieving 95% feature '
          'parity with 60% reduction in codebase size. Integrated Firebase Auth, Firestore, and FCM '
          'push notifications supporting 10K+ monthly active users. Managed App Store submissions, '
          'TestFlight beta distribution, and production release builds for multiple live iOS applications.',
    ),
    ServiceItem(
      Icons.api_outlined,
      'API Integration',
      'Integrate RESTful APIs with clean architecture and efficient data handling across Android and '
          'iOS platforms. Experienced in connecting apps to Firebase, Retrofit, third-party SDKs, and '
          'Socket.io for real-time communication. Worked with backend teams using Spring Boot to improve '
          'API response time by 55%. Implemented secure authentication flows, OTP verification, and '
          'seamless data sync between app and server.',
    ),
    ServiceItem(
      Icons.map_outlined,
      'Real-Time Tracking',
      'Implement live location tracking, Google Maps API integration, and real-time ride tracking '
          'systems. Built complete driver and passenger tracking for airport transfer applications using '
          'Socket.io and WebSocket. Developed route navigation, ride status updates, and location-based '
          'features across 3+ production apps. Led Google Maps integration in a 6-member team increasing '
          'user engagement by 65%.',
    ),
    ServiceItem(
      Icons.cloud_outlined,
      'Firebase & Backend Setup',
      'Setup and manage Firebase Authentication, Cloud Firestore, and FCM push notifications for '
          'scalable mobile backends. Supported 10K+ monthly active users with secure and reliable Firebase '
          'infrastructure. Experienced in real-time chat implementation handling 15K+ monthly messages. '
          'Configured CI/CD pipelines using Codemagic and GitHub Actions for automated builds and '
          'deployments across Android and iOS platforms.',
    ),
    ServiceItem(
      Icons.payment,
      'Payment Integration',
      'Integrate secure payment gateways, OTP verification systems, and smooth in-app checkout '
          'experiences. Implemented payment flows in eCommerce, multi-vendor, and airport transfer '
          'applications. Experienced in building reward point tracking, SKU browsing, and monthly claims '
          'systems for contractor apps with 2000+ active users. Ensured secure transaction handling with '
          'proper error management and user feedback.',
    ),
    ServiceItem(
      Icons.bug_report_outlined,
      'Bug Fixing & Optimization',
      'Diagnose and resolve complex bugs, improve app responsiveness, and optimize overall performance. '
          'Conducted unit, widget, and integration testing using flutter_test and Mockito for reliable '
          'bug-free releases. Achieved 80% reduction in real-time data update lag through optimized sync '
          'logic. Proficient in performance profiling, memory management, and reducing app load times '
          'across Android and iOS platforms.',
    ),
    ServiceItem(
      Icons.devices_outlined,
      'Cross-Platform Development',
      'Develop Android and iOS applications from a single Flutter and Dart codebase using MVVM and '
          'Clean Architecture. Built 15+ cross-platform apps reducing delivery time by nearly one-third '
          'compared to native development. Skilled in reusable UI components, scalable module design, and '
          'state management with Riverpod, Bloc, Cubit, GetX, and Provider. Maintained consistent user '
          'experience and performance across both platforms.',
    ),
    ServiceItem(
      Icons.store_outlined,
      'App Store Deployment',
      'Handle end-to-end app publishing for Google Play Store and Apple App Store including release '
          'build management, signing, and store listing setup. Experienced with TestFlight beta distribution '
          'and production deployment for multiple live applications. Configured CI/CD pipelines using '
          'Codemagic for automated builds and deployments. Managed Play Store developer account for '
          'Granth Technosoft Pvt. Ltd. with multiple published apps.',
    ),
  ];

  // ─────────────────────────────────────────────
  // PROJECTS SECTION
  // ─────────────────────────────────────────────

  static const String projectsTag = 'PORTFOLIO';
  static const String projectsTitle = 'My Recent Applications';
  static const String projectsSubtitle =
      'A showcase of production-ready applications I have developed for Android and iOS platforms.';
  static const String playStore = 'Play Store';
  static const String appStore = 'App Store';
  static const String gitHub = 'GitHub';

  static final List<ProjectItem> projects = [
    ProjectItem(
      name: 'Twelve Client Airport Transfer',
      desc:
      'Airport taxi booking app for London & UK passengers with instant booking, live driver tracking, trip history, payment gateway integration, and real-time trip updates.',
      tags: ['Flutter', 'Firebase', 'GetX', 'Google Maps'],
      color: const Color(0xFF4F46E5),
      icon: Icons.local_taxi,
      image: 'assets/images/ctlficon.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.ctlf.userapp',
      appStoreUrl:
      'https://apps.apple.com/us/app/twelve-client-airport-transfer/id1476364449',
    ),
    ProjectItem(
      name: 'Twelve Driver Airport Transfer',
      desc:
      'Professional airport transfer driver app with live ride dispatch, navigation, earnings dashboard, and real-time notifications.',
      tags: ['Flutter', 'Socket.io', 'Firebase', 'MVVM'],
      color: const Color(0xFF059669),
      icon: Icons.drive_eta,
      image: 'assets/images/ctlficon.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=ctlf.mediafirst.ro',
      appStoreUrl:
      'https://apps.apple.com/us/app/twelve-driver-airport-transfer/id1339195128',
    ),
    ProjectItem(
      name: 'AppVyapar Elite',
      desc:
      'GST billing, POS, ERP, inventory, invoicing, and business management application with real-time stock and cash tracking.',
      tags: ['Flutter', 'REST API', 'GetX', 'Firebase'],
      color: const Color(0xFFF59E0B),
      icon: Icons.storefront,
      image: 'assets/images/appvyparelite.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyapar',
    ),
    ProjectItem(
      name: 'AppVyapar Business Admin',
      desc:
      'Business admin app for GST billing, order management, customer handling, offers, wallet management, and MIS reports.',
      tags: ['Flutter', 'Provider', 'Firebase', 'POS'],
      color: const Color(0xFFDC2626),
      icon: Icons.business_center,
      image: 'assets/images/appvyaparadmin.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyaparshop',
      appStoreUrl:
      'https://apps.apple.com/in/app/appvyapar-business-app/id1470244758',
    ),
    ProjectItem(
      name: 'AppVyapar Mini',
      desc:
      'Field staff and customer management app with attendance, visit check-in/check-out, task management, expenses, and live location tracking.',
      tags: ['Flutter', 'Google Maps', 'GetX', 'SQLite'],
      color: const Color(0xFF0891B2),
      icon: Icons.people_alt,
      image: 'assets/images/appvyaparmini.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.yugtechno.appvyaparmini',
      appStoreUrl:
      'https://apps.apple.com/in/app/appvyapar-mini/id6741160230',
    ),
    ProjectItem(
      name: 'Anuraga Matrimony',
      desc:
      'Exclusive matrimony platform for Brahmin community with profile verification, matchmaking, daily matches, and payment integration.',
      tags: ['Kotlin', 'Java', 'REST API', 'Payment Gateway'],
      color: const Color(0xFFBE9424),
      icon: Icons.favorite,
      image: 'assets/images/anurahmato.png',
      playStoreUrl:
      'https://play.google.com/store/apps/details?id=com.jashnasolutions.anuragamatrimony',
    ),
  ];

  // ─────────────────────────────────────────────
  // EXPERIENCE SECTION
  // ─────────────────────────────────────────────

  static const String experienceTag = 'EXPERIENCE';
  static const String experienceTitle = 'My Work History';
  static const String experienceSubtitle =
      '9+ years of building real products across mobile platforms.';

  static final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: 'Syscraft Information System Pvt. Ltd.',
      role: 'Senior Flutter Developer',
      duration: 'Dec 2025 – Present',
      location: 'Indore',
      responsibilities: [
        'Developing enterprise-level Flutter applications for Android and iOS platforms.',
        'Working on airport transfer and real-time tracking apps (Twelve Client & Driver).',
        'Implementing scalable MVVM architecture, REST API integration, and payment systems.',
        'Collaborating with backend and QA teams for production deployment and app optimization.',
        'Managing Play Store and App Store release builds for UK-based client Twelve Transfers.',
      ],
      icon: Icons.flight_takeoff,
      accentColor: Color(0xFF6C63FF),
    ),
    ExperienceModel(
      company: 'Granth Technosoft Pvt. Ltd.',
      role: 'Senior Android / Flutter Developer',
      duration: 'Apr 2024 – Oct 2025',
      location: 'Indore',
      responsibilities: [
        'Collaborated with 8+ developers to build 15+ cross-platform apps using Flutter & MVVM, reducing delivery time by ~33%.',
        'Engineered RESTful APIs with Spring Boot, improving response time by 55%.',
        'Integrated Firebase services (Auth, Firestore, FCM) to support 10K+ MAUs.',
        'Migrated 5 native iOS/Android apps to Flutter — 95% feature parity, 60% smaller codebase.',
        'Boosted client satisfaction and repeat business by 60% through proactive requirement gathering.',
      ],
      icon: Icons.rocket_launch,
      accentColor: Color(0xFF00BFA6),
    ),
    ExperienceModel(
      company: 'Yug Technosoft',
      role: 'Android / Flutter Developer',
      duration: 'Jan 2021 – Mar 2024',
      location: 'Indore',
      responsibilities: [
        'Mentored 4 junior developers via bi-weekly sessions, increasing feature delivery accuracy by 55%.',
        'Led Google Maps API integration in 3 location-based apps, increasing user engagement by 65%.',
        'Implemented real-time chat via Firebase handling 15K+ monthly messages.',
        'Delivered 5+ eCommerce and grocery app builds, improving user retention by 60%.',
      ],
      icon: Icons.map_outlined,
      accentColor: Color(0xFFFF6B6B),
    ),
    ExperienceModel(
      company: 'SKB Infocom Pvt. Ltd.',
      role: 'Android Developer',
      duration: 'Dec 2019 – Jan 2021',
      location: 'Indore',
      responsibilities: [
        'Developed Android applications for business and enterprise domains.',
        'Worked on POS (Clover/PAX device) app — migrated to Kotlin, implemented SQLite + MVVM.',
        'Added inventory, order and billing features to the POS system.',
      ],
      icon: Icons.point_of_sale,
      accentColor: Color(0xFFF59E0B),
    ),
    ExperienceModel(
      company: 'Bit-7 Informatics',
      role: 'Jr. Android Developer',
      duration: 'Oct 2017 – Dec 2019',
      location: 'Bhopal',
      responsibilities: [
        'Developed Android applications with focus on UI/UX and API integration.',
      ],
      icon: Icons.phone_android,
      accentColor: Color(0xFF3B82F6),
    ),
    ExperienceModel(
      company: 'App Legend Pvt. Ltd.',
      role: 'Android Developer',
      duration: 'Apr 2016 – Oct 2017',
      location: 'Bhopal',
      responsibilities: [
        'Started career building Android applications.',
        'Developed core skills in Java, XML, and Android SDK.',
      ],
      icon: Icons.code,
      accentColor: Color(0xFF10B981),
    ),
  ];

  // ─────────────────────────────────────────────
  // CONTACT SECTION
  // ─────────────────────────────────────────────

  static const String contact = 'CONTACT';
  static const String letsWorkTogether = "Let's Work\nTogether";
  static const String contactDescription =
      "Have a project in mind or just want to say hello? "
      "Fill in the form and I'll get back to you within 24 hours.";
  static const String sendMessage = 'Send Message';
  static const String yourName = 'Your Name';
  static const String enterYourName = 'Enter your name';
  static const String emailTitle = 'Email';
  static const String emailHint = 'contact@gmail.com';
  static const String contactNumber = 'Contact Number';
  static const String contactNumberHint = '+91 9876543210';
  static const String email = 'krishnagopalsen22@gmail.com';
  static const String phone = '+91 87704 00610';
  static const String location = 'Indore, India';
  static const String subject = 'Subject';
  static const String subjectHint = 'Project Inquiry';
  static const String message = 'Message';
  static const String messageHint = 'Tell me about your project...';
  static const String nameRequired = 'Name required';
  static const String emailRequired = 'Email required';
  static const String invalidEmail = 'Invalid email';
  static const String contactRequired = 'Contact number required';
  static const String subjectRequired = 'Subject required';
  static const String messageTooShort = 'Message too short';
  static const String messageSent = 'Message Sent!';
  static const String successDescription =
      "Thanks for reaching out. I'll get back to you within 24 hours.";

  static const List<SocialLink> socialLinks = [
    SocialLink(
      'GitHub',
      FontAwesomeIcons.github,
      'https://github.com/KrishnaGopalSen',
    ),
    SocialLink(
      'LinkedIn',
      FontAwesomeIcons.linkedinIn,
      'https://www.linkedin.com/in/krishna-gopal-8b85338b/',
    ),
    SocialLink(
      'Twitter',
      FontAwesomeIcons.xTwitter,
      'https://x.com/krishna28051986',
    ),
    SocialLink(
      'Instagram',
      FontAwesomeIcons.instagram,
      'https://www.instagram.com/krishngopal28?igsh=dmE4YjE5bmZhMHN5',
    ),
    SocialLink(
      'WhatsApp',
      FontAwesomeIcons.whatsapp,
      'https://wa.me/918770400610',
    ),
  ];

  static const List<ContactDetail> contactDetails = [
    ContactDetail(
      Icons.email_outlined,
      'Email',
      email,
    ),
    ContactDetail(
      Icons.phone_outlined,
      'Phone',
      phone,
    ),
    ContactDetail(
      Icons.location_on_outlined,
      'Location',
      location,
    ),
  ];


// ─────────────────────────────────────────────
// FOOTER SECTION
// ─────────────────────────────────────────────


  static const String footerName        = 'Krishna Gopal Sen';
  static const String footerInitials    = 'KG';
  static const String footerTagline     = 'Flutter & Mobile App Developer crafting\nbold, performant cross-platform experiences.';
  static const String footerAvailable   = 'Available for freelance';
  static const String footerNavTitle    = 'Navigation';
  static const String footerServTitle   = 'Services';
  static const String footerStayUpdated = 'Stay Updated';
  static const String footerStayDesc    = 'Get notified about new projects\nand articles.';

  static const String footerSubscribed  = "You're subscribed!";
  static const String footerCopyright   = 'Krishna Gopal. All rights reserved.';
  static const String footerMadeWith    = 'Made with ';
  static const String footerUsingFlutter = ' using Flutter';


  static const List<FooterLink> navLinks = [
    FooterLink('Home'),
    FooterLink('About'),
    FooterLink('Skills'),
    FooterLink('Projects'),
    FooterLink('Experience'),
    FooterLink('Contact'),
  ];

  static const List<FooterLink> serviceLinks = [
    FooterLink('Flutter Apps'),
    FooterLink('UI/UX Design'),
    FooterLink('API Integration'),
    FooterLink('Consulting'),
   FooterLink('Code Review'),
  ];

  static const List<SocialItem> socialItems = [
    SocialItem( 'GitHub',
      FontAwesomeIcons.github,
      'https://github.com/KrishnaGopalSen',),
    SocialItem( 'LinkedIn',
      FontAwesomeIcons.linkedinIn,
      'https://www.linkedin.com/in/krishna-gopal-8b85338b/',),
    SocialItem( 'Twitter',
      FontAwesomeIcons.xTwitter,
      'https://x.com/krishna28051986',),
    SocialItem(  'WhatsApp',
      FontAwesomeIcons.whatsapp,
      'https://wa.me/918770400610',),
  ];
}
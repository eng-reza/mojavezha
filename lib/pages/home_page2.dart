import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../widgets/animated_logo.dart';
import '../widgets/main_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tutorial keys
  final GlobalKey _logoKey = GlobalKey();
  final GlobalKey _perModuleKey = GlobalKey();
  final GlobalKey _perSoftwareKey = GlobalKey();

  late TutorialCoachMark _tutorial;
  bool _showingTutorial = false;

  // animation controller for page entry
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    // در این صفحه فقط حالت عمودی فعال است //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // انیمیشن ورودی صفحه //
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();

    // نمایش راهنما فقط دفعه اول //
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final shown = prefs.getBool('tutorial_shown') ?? false;
      if (!shown) {
        _showTutorial();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ---------------- راهنما ----------------
  void _showTutorial() {
    if (_showingTutorial) return;
    _showingTutorial = true;

    final targets = <TargetFocus>[
      _buildTarget(
        identify: 'logo',
        key: _logoKey,
        title: 'معرفی اپلیکیشن',
        description:
            'مجوزهایی که توسط نرم افزارها بکارگیری می شوند را به ساده ترین شکل نمایش می‌دهد.',
        step: 1,
        total: 3,
      ),
      _buildTarget(
        identify: 'perModule',
        key: _perModuleKey,
        title: 'بر اساس نوع دسترسی',
        description:
            'از این بخش می‌توانید ببینید کدام اپ‌ها به میکروفون، دوربین و ... دسترسی دارند.',
        step: 2,
        total: 3,
      ),
      _buildTarget(
        identify: 'perSoftware',
        key: _perSoftwareKey,
        title: 'بر اساس اپلیکیشن',
        description:
            'از این بخش می توانید مجوزهای هر نرم افزار را به‌صورت جداگانه بررسی کنید.',
        step: 3,
        total: 3,
      ),
    ];

    _tutorial = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black54,
      textSkip: 'رد کن',
      paddingFocus: 8,
      opacityShadow: 0.9,
      onFinish: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('tutorial_shown', true);
        _showingTutorial = false;
      },
      onSkip: () {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('tutorial_shown', true);
        });
        _showingTutorial = false;
        return _showingTutorial;
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tutorial.show(context: context);
    });
  }

  TargetFocus _buildTarget({
    required String identify,
    required GlobalKey key,
    required String title,
    required String description,
    required int step,
    required int total,
  }) {
    return TargetFocus(
      identify: identify,
      keyTarget: key,
      shape: ShapeLightFocus.RRect,
      radius: 8,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$step / $total',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- ورود به UI ----------------
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.textScaleFactorOf(context).clamp(1.0, 1.3);

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeIn,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isPhone = width < 600;
              final logoSize = isPhone ? 140.0 : 220.0;
              final cardWidth = isPhone ? width * 0.88 : 420.0;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: _buildBackgroundDecoration(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 28,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Semantics(
                        label: 'لوگوی اپلیکیشن مجوزها',
                        child: Column(
                          children: [
                            AnimatedLogo(
                              key: _logoKey,
                              assetPath: 'assets/images/mojavezha.png',
                              size: logoSize,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'مجوزها',
                              style: TextStyle(
                                fontSize: isPhone
                                    ? 18 * textScale
                                    : 22 * textScale,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'شفافیت در دسترسی‌های اپ‌ها روی دستگاه شما',
                              style: TextStyle(
                                fontSize: isPhone
                                    ? 13 * textScale
                                    : 14 * textScale,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Wrap(
                        runSpacing: 16,
                        spacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          MainCard(
                            key: _perModuleKey,
                            width: cardWidth,
                            title: 'بر اساس نوع دسترسی',
                            subtitle: 'دوربین، میکروفون، موقعیت و ...',
                            icons: const [
                              Icons.camera_alt_outlined,
                              Icons.mic_none_outlined,
                              Icons.gps_fixed,
                              Icons.wifi_tethering,
                              Icons.perm_identity,
                            ],
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Navigator.pushNamed(context, '/perModule');
                            },
                          ),
                          MainCard(
                            key: _perSoftwareKey,
                            width: cardWidth,
                            title: 'بر اساس نرم‌افزار',
                            subtitle: 'مشاهده مجوزهای هر اپلیکیشن',
                            icons: const [
                              FontAwesomeIcons.youtube,
                              FontAwesomeIcons.chrome,
                              FontAwesomeIcons.instagram,
                              FontAwesomeIcons.telegram,
                            ],
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Navigator.pushNamed(context, '/installedApps');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: _showTutorial,
                            icon: const Icon(
                              Icons.help_outline,
                              color: Colors.white70,
                            ),
                            label: const Text(
                              'راهنما',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(width: 12),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white70,
                            ),
                            label: const Text(
                              'درباره مجوزها',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFB3E5FC), Color(0xFF64B5F6), Color(0xFF1976D2)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}

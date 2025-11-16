import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // متد تشخیص وضعیت نمایش راهنما در ابتدای شروع بکار نرم افزار //
  void showTutorialIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isTutorialShown = prefs.getBool('tutorial_shown');
    if (isTutorialShown != true) {
      showTutorial();
    }
  }

  // کلید ها جهت استفاده در نمایش راهنمای اولیه ایجاد شده اند //
  GlobalKey mainLogo = GlobalKey();
  GlobalKey keyPerSoftwareButton = GlobalKey();
  GlobalKey keyPerModuleButton = GlobalKey();

  late TutorialCoachMark tutorial;

  //  متد برای نمایش راهنمای اولیه //
  void showTutorial() {
    tutorial = TutorialCoachMark(
      targets: _createTargets(),
      textSkip: 'رد کردن',
      textStyleSkip: TextStyle(color: Colors.red),
      colorShadow: Colors.black.withAlpha((255 * 0.7).toInt()),

      onFinish: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('tutorial_shown', true);
      },
      onSkip: () {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('tutorial_shown', true);
        });
        return true;
      },
    )..show(context: context);
  }

  // متون نمایشی راهنمای اولیه //
  List<TargetFocus> _createTargets() {
    return [
      TargetFocus(
        identify: "mainLogo",
        keyTarget: mainLogo,
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(bottom: 20, left: 0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: Text(
                'اپلیکیشن مجوزها\n این نرم افزار بمنظور آگاه سازی کاربران در جهت دسترسی هایی که نرم افزارها بر روی دستگاه دارند توسعه داده شده است',
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "perModuleButton",
        keyTarget: keyPerModuleButton,
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(bottom: 20, left: 0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: Text(
                'اگر میخواهید بدانید که میکروفن یا دوربین و دیگر سخت افزار موبایلتان توسط چه نرم افزارهایی استفاده می شوند وارد این بخش شوید',
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "perSoftwareButton",
        keyTarget: keyPerSoftwareButton,
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(bottom: 20, left: 0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: Text(
                'اگر میخواهید بدانید که اپلیکیشن های منصوب در دستگاه شما چه دسترسی هایی دارند نیز وارد این بخش شوید',
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // این صفحه حالت چرخش نخواهد داشت //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTutorialIfNeeded();
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تشخیص صفحه عمودی یا افقی //
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size;
    bool isPhone = size.width < 600;
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue.shade700],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: isLandscape ? 0 : 50),
              Image.asset(
                key: mainLogo,
                'assets/images/mojavezha.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: isLandscape ? 20 : 50),
              isLandscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 50,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(
                                  (0.2 * 255).toInt(),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'بررسی مجوزها بر اساس نوع دسترسی',
                                      style: TextStyle(
                                        fontSize: isPhone ? 18 : 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      color: Colors.white.withAlpha(
                                        (0.4 * 255).toInt(),
                                      ),
                                      height: 1,
                                      width: 310,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: const [
                                        Icon(
                                          Icons.camera_alt_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.mic_none_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.memory_outlined,
                                          color: Colors.black,
                                        ),
                                        Icon(Icons.wifi, color: Colors.black),
                                        Icon(
                                          Icons.payment_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.network_cell,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.contact_phone_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.notification_important_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.verified_user_sharp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                onPressed: () {
                                  SystemChrome.setPreferredOrientations(
                                    DeviceOrientation.values,
                                  );
                                  Navigator.pushNamed(context, '/perModule');
                                },
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(
                                  (0.2 * 255).toInt(),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'بررسی مجوزها بر اساس نرم افزار',
                                      style: TextStyle(
                                        fontSize: isPhone ? 18 : 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      color: Colors.white.withAlpha(
                                        (0.4 * 255).toInt(),
                                      ),
                                      height: 1,
                                      width: 270,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.youtube,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.chrome,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.android,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.telegram,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.whatsapp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.waze,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.alipay,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                onPressed: () {
                                  SystemChrome.setPreferredOrientations(
                                    DeviceOrientation.values,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    '/installedApps',
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  // حالت افقی //
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      spacing: 50,
                      children: [
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(
                                  (0.2 * 255).toInt(),
                                ), // شفافیت پس‌زمینه
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  elevation: 4,
                                  shadowColor: Colors.blueGrey.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: isPhone ? 15 : 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Colors.white70,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'بررسی مجوزها بر اساس نوع دسترسی',
                                      style: TextStyle(
                                        fontSize: isPhone ? 18 : 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      key: keyPerModuleButton,
                                      color: Colors.white70,
                                      height: 1,
                                      width: isPhone ? 250 : 310,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        Icon(
                                          Icons.camera_alt_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.mic_none_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.memory_outlined,
                                          color: Colors.black,
                                        ),
                                        Icon(Icons.wifi, color: Colors.black),
                                        Icon(
                                          Icons.payment_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.network_cell,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.contact_phone_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.notification_important_sharp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.verified_user_sharp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                onPressed: () {
                                  SystemChrome.setPreferredOrientations(
                                    DeviceOrientation.values,
                                  );
                                  Navigator.pushNamed(context, '/perModule');
                                },
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(
                                  (0.2 * 255).toInt(),
                                ), // شفافیت پس‌زمینه
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  elevation: 4,
                                  shadowColor: Colors.blueGrey.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: isPhone ? 15 : 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Colors.white70,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'بررسی مجوزها بر اساس نرم افزار',
                                      style: TextStyle(
                                        fontSize: isPhone ? 18 : 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      key: keyPerSoftwareButton,
                                      color: Colors.white70,
                                      height: 1,
                                      width: isPhone ? 250 : 270,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.youtube,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.chrome,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.android,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.telegram,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.whatsapp,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.waze,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.alipay,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                onPressed: () {
                                  SystemChrome.setPreferredOrientations(
                                    DeviceOrientation.values,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    '/installedApps',
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

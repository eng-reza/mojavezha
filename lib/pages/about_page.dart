import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = '';
  @override
  void initState() {
    super.initState();
    getAppVersion(); // فراخوانی درست
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF64B5F6), Color(0xFF1976D2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- Header ---
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'درباره مجوزها',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // برای بالانس با دکمه Back
                ],
              ),

              const SizedBox(height: 10),

              // --- Content ---
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.privacy_tip_outlined,
                        size: 90,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'چرا بررسی مجوزها مهم است؟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          '''
اپلیکیشن‌ها برای کارکرد درست خود نیاز به دسترسی‌هایی مانند دوربین، میکروفون، موقعیت مکانی و ... دارند. اما گاهی برخی برنامه‌ها بیش از اندازه دسترسی دریافت می‌کنند که می‌تواند تهدیدی برای حریم خصوصی شما باشد.

اپلیکیشن «مجوزها» با هدف شفاف‌سازی، این امکان را فراهم می‌کند تا:
• بدانید هر اپ به چه مجوزهایی دسترسی دارد  
• مجوزهای حساس مانند دوربین و میکروفون را کنترل کنید  
• دسترسی‌های غیرضروری را شناسایی کنید  
• از مصرف پنهان داده و باتری جلوگیری کنید
                          ''',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'مجوزهای مهم سیستم:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 14),

                      _buildPermissionItem(
                        Icons.camera_alt_outlined,
                        'دوربین',
                        'تشخیص اپ‌هایی که به دوربین دسترسی دارند.',
                      ),
                      _buildPermissionItem(
                        Icons.mic_none_outlined,
                        'میکروفون',
                        'شناسایی استفاده احتمالی بدون اطلاع.',
                      ),
                      _buildPermissionItem(
                        Icons.location_on_outlined,
                        'موقعیت مکانی',
                        'بررسی دقت بالا یا تقریبی.',
                      ),
                      _buildPermissionItem(
                        Icons.storage_outlined,
                        'فایل‌ها و رسانه‌ها',
                        'کنترل دسترسی به حافظه داخلی.',
                      ),
                      _buildPermissionItem(
                        FontAwesomeIcons.wifi,
                        'شبکه و اینترنت',
                        'نمایش اپ‌هایی که اینترنت را مصرف می‌کنند.',
                      ),

                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'نسخه نرم افزار',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            appVersion,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.blue.shade700),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = info.version;
    });
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // تشخیص صفحه عمودی یا افقی //
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size;
    bool isPhone = size.width < 600;
    return Scaffold(
      body: Container(
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
            Image.asset('assets/images/mojavezha.png', width: 200, height: 200),
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
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
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
                                    color: Colors.white.withOpacity(0.4),
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
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
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
                                    color: Colors.white.withOpacity(0.4),
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
                                Navigator.pushNamed(context, '/installedApps');
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
                                Navigator.pushNamed(context, '/installedApps');
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
    );
  }
}

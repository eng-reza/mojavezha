import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/mojavezha.png',
                width: 200,
                height: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 4,
                    shadowColor: Colors.blueGrey.withAlpha((0.3 * 255).toInt()),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.blueGrey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'بررسی مجوزها بر اساس ماژول',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        color: Colors.grey.shade400,
                        height: 1,
                        width: 250,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Icon(Icons.camera_alt_sharp),
                          Icon(Icons.mic_none_sharp),
                          Icon(Icons.memory_outlined),
                          Icon(Icons.wifi),
                          Icon(Icons.payment_sharp),
                          Icon(Icons.network_cell),
                          Icon(Icons.contact_phone_sharp),
                          Icon(Icons.notification_important_sharp),
                          Icon(Icons.verified_user_sharp),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 4,
                    shadowColor: Colors.blueGrey.withAlpha((0.3 * 255).toInt()),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.blueGrey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'بررسی مجوزها بر اساس نرم افزار',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        color: Colors.grey.shade400,
                        height: 1,
                        width: 270,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Icon(FontAwesomeIcons.youtube),
                          Icon(FontAwesomeIcons.chrome),
                          Icon(FontAwesomeIcons.facebook),
                          Icon(FontAwesomeIcons.android),
                          Icon(FontAwesomeIcons.instagram),
                          Icon(FontAwesomeIcons.telegram),
                          Icon(FontAwesomeIcons.whatsapp),
                          Icon(FontAwesomeIcons.waze),
                          Icon(FontAwesomeIcons.alipay),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/installedApps');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

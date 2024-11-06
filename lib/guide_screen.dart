
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening URLs in a browser

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  // Exercise video URLs
  final String pushupUrl = 'https://www.youtube.com/watch?v=lsRAK6cr5kY'; // Example link for Pushups
  final String squatUrl = 'https://www.youtube.com/watch?v=6bvZMJATN-s'; // Example link for Squats
  final String situpUrl = 'https://www.youtube.com/watch?v=R5FJuyAPNTo'; // Example link for Sit-Ups

  // Function to open the URL in the browser
  Future<void> _launchURL(String url) async {
    final Uri videoUri = Uri.parse(url);
    if (await canLaunchUrl(videoUri)) {
      await launchUrl(videoUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Exercise Guide',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Click below to view the exercise guide videos:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Pushups Button with Play Icon
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    shadowColor: Colors.lightBlueAccent,
                  ),
                  onPressed: () => _launchURL(pushupUrl), // Pushups video URL
                  label: const Text(
                    'Watch Pushups Guide',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Squats Button with Play Icon
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                  ),
                  onPressed: () => _launchURL(squatUrl), // Squats video URL
                  label: const Text(
                    'Watch Squats Guide',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Sit-Ups Button with Play Icon
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    shadowColor: Colors.orangeAccent,
                  ),
                  onPressed: () => _launchURL(situpUrl), // Sit-Ups video URL
                  label: const Text(
                    'Watch Sit-Ups Guide',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

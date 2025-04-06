import 'package:flutter/material.dart';
import 'mainmenu/introduction_screen.dart';
import 'mainmenu/latest_article_screen.dart';
import 'mainmenu/video_tutorials_screen.dart';
import 'mainmenu/ai_therapist_screen.dart';
import 'mainmenu/consult_doctor_screen.dart';
import 'mainmenu/exercises_screen.dart';
import 'profile/profile_screen.dart';
import 'baby_names_screen.dart';
import 'diary_screen.dart';
import 'moments_screen.dart';
import 'appointments_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Coming Soon"),
          content: Text(
              "We are working hard to bring this feature to this app. Please check again at a later time."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String label,
    IconData icon,
    Widget screen,
    bool isToolsMenu,
  ) {
    final Uri apollo247 = Uri.parse('https://www.apollo247.com/specialties');

    Future<void> _launchUrl() async {
      if (!await launchUrl(apollo247)) {
        throw Exception('Could not launch ${apollo247}');
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: isToolsMenu ? Colors.pink[100] : const Color.fromARGB(255, 180, 230, 248),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: () {
        if (label == 'AI Therapist') {
          _showComingSoonDialog(context);
        } else if (label == 'Consult a doctor') {
          _launchUrl();
        }
        else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0, color: isToolsMenu ? Colors.black : Colors.pink),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildToolsMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: <Widget>[
          _buildFeatureButton(context, 'Baby Names', Icons.child_friendly, const BabyNamesScreen(), true),
          _buildFeatureButton(context, 'Diary', Icons.book, const DiaryScreen(), true),
          _buildFeatureButton(context, 'Moments', Icons.camera, const MomentsScreen(), true),
          _buildFeatureButton(context, 'Appointments', Icons.calendar_today, const AppointmentsScreen(), true),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('images/logo.jpg', height: 30),
              const SizedBox(width: 8),
              const Text(
                'Sukoon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: <Widget>[
                    _buildFeatureButton(
                      context,
                      'Introduction',
                      Icons.info,
                      const IntroductionScreen(),
                      false,
                    ),
                    _buildFeatureButton(
                      context,
                      'Latest Articles',
                      Icons.article,
                      const LatestArticleScreen(),
                      false,
                    ),
                    _buildFeatureButton(
                      context,
                      'Video Tutorials',
                      Icons.ondemand_video,
                      const VideoTutorialsScreen(),
                      false,
                    ),
                    _buildFeatureButton(
                      context,
                      'AI Therapist',
                      Icons.android,
                      const AiTherapistScreen(),
                      false,
                    ),
                    _buildFeatureButton(
                      context,
                      'Consult a doctor',
                      Icons.medical_services,
                      const ConsultDoctorScreen(),
                      false,
                    ),
                    _buildFeatureButton(
                      context,
                      'Exercises',
                      Icons.fitness_center,
                      const ExercisesScreen(),
                      false,
                    ),
                  ],
                ),
              )
          : _selectedIndex == 1
              ? _buildToolsMenu(context)
              : Center(child: ProfileScreen()),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tools'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({Key? key, required this.featureName}) : super(key: key);

  final String featureName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(featureName),
      ),
      body: Center(
        child: Text('This is the $featureName screen.'),
      ),
    );
  }
}

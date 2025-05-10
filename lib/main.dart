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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default theme mode

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sukoon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC8A2C8), // Violet for the seed color
          primary: const Color(0xFFEE82EE), // Vibrant Violet
          secondary: const Color(0xFFDDA0DD), // Plum
          tertiary: const Color(0xFFE6E6FA), // Lavender
          background: const Color(0xFFE6E6FA), // Lavender background
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFE6E6FA), // Lavender background
        appBarTheme: const AppBarTheme(
          elevation: 4, // Add shadow
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFF6B7AA1), // Misty Blue-Violet
          primary: const Color(0xFF8899CC),   // Pastel Blue-Violet
          secondary: const Color(0xFF9BAEDB), // Soft Periwinkle
          tertiary: const Color(0xFFD8E1F0),  // Light Baby Blue for accents
          background: const Color(0xFF1C1F2B), // Charcoal Blue background
          surface: const Color(0xFF272B38),    // Surface slightly lighter
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 4, // Add shadow
        ),
      ),
      themeMode: _themeMode, // Use the theme mode state
      home: MyHomePage(changeTheme: changeTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(ThemeMode) changeTheme;

  const MyHomePage({Key? key, required this.changeTheme}) : super(key: const ValueKey<String>('MyHomePage'));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _currentThemeMode = ThemeMode.light;
  bool _isTamil = false; // Language selection state
  int _selectedIndex = 0; // Bottom navigation index

  // Define text for both languages
  Map<String, String> englishText = {
    'appTitle': 'Sukoon',
    'introduction': 'Introduction',
    'latestArticles': 'Latest Articles',
    'videoTutorials': 'Video Tutorials',
    'aiTherapist': 'AI Therapist',
    'consultDoctor': 'Consult a doctor',
    'exercises': 'Exercises',
    'babyNames': 'Baby Names',
    'diary': 'Diary',
    'moments': 'Moments',
    'appointments': 'Appointments',
    'home': 'Home',
    'tools': 'Tools',
    'profile': 'Profile',
    'comingSoon': 'Coming Soon',
    'weAreWorkingHard': 'We are working hard to bring this feature to this app. Please check again at a later time.',
    'close': 'Close',
  };

  Map<String, String> tamilText = {
    'appTitle': 'சுகூன்',
    'introduction': 'அறிமுகம்',
    'latestArticles': 'இறுதிச் கட்டுரைகள்',
    'videoTutorials': 'வீடியோ பயிற்சிகள்',
    'aiTherapist': 'ஏ.ஐ. நிபுணர்',
    'consultDoctor': 'மருத்தவரை ஆலோசிக்கவும்',
    'exercises': 'வாராந்திர பயிற்சிகள்',
    'babyNames': 'குழந்தை பெயர்கள்',
    'diary': 'பதிவேடு',
    'moments': 'நினைவுகள்',
    'appointments': 'நியமனங்கள்',
    'home': 'வீடு',
    'tools': 'கருவிகள்',
    'profile': 'சுயவிவரம்',
    'comingSoon': 'இருக்கவிரும்பும்',
    'weAreWorkingHard': 'இந்த அம்சத்தை இந்த செயலியில் கொண்டு வர நாங்கள் கடுமையாக வேலை செய்யின்றோம். தயவுசெய்து பிறகு மீண்டும் சரிபார்க்கவும்.',
    'close': 'மூடு',
  };

  // Function to switch language
  void _switchLanguage(String language) {
    setState(() {
      _isTamil = language == 'Tamil';
    });
  }

  // Function to get text based on selected language
  String _getText(String key) {
    return _isTamil ? tamilText[key]! : englishText[key]!;
  }

  // Button builder for features
  Widget _buildFeatureButton(
    BuildContext context,
    String label,
    IconData icon,
    Widget screen,
    bool isToolsMenu,
  ) {
    final Uri apollo247 = Uri.parse('https://www.apollo247.com/specialties');

    Future<void> launchApollo247Url() async {
      if (!await launchUrl(apollo247)) {
        throw Exception('Could not launch $apollo247');
      }
    }

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isToolsMenu
          ? Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF7B68EE) // Medium Slate Blue
              : const Color(0xFFEE82EE) // Vibrant Violet
          : Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF8470FF) // Dark Lavender
              : const Color(0xFFDDA0DD), // Plum
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (label == _getText('consultDoctor')) {
            launchApollo247Url();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : isToolsMenu ? Colors.black : Colors.pink,
              ),
              const SizedBox(height: 8.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Menu for tools
  Widget _buildToolsMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: <Widget>[
          _buildFeatureButton(context, _getText('babyNames'), Icons.child_friendly, const BabyNamesScreen(), true),
          _buildFeatureButton(context, _getText('diary'), Icons.book, const DiaryScreen(), true),
          _buildFeatureButton(context, _getText('moments'), Icons.camera, const MomentsScreen(), true),
          _buildFeatureButton(context, _getText('appointments'), Icons.calendar_today, const AppointmentsScreen(), true),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF6A0DAD) // Deep Purple
            : const Color(0xFFDDA0DD), // Plum
        elevation: 4, // Add shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton<String>(
              icon: Icon(
                Icons.language,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              onSelected: (String language) {
                _switchLanguage(language);
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'English',
                    child: Text('English'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Tamil',
                    child: Text('Tamil'),
                  ),
                ];
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('images/logo.jpg', height: 30),
                const SizedBox(width: 8),
                Text(
                  _getText('appTitle'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _currentThemeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
                  widget.changeTheme(_currentThemeMode);
                });
              },
            ),
          ],
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
                    _getText('introduction'),
                    Icons.info,
                    const IntroductionScreen(),
                    false,
                  ),
                  _buildFeatureButton(
                    context,
                    _getText('latestArticles'),
                    Icons.article,
                    const LatestArticleScreen(),
                    false,
                  ),
                  _buildFeatureButton(
                    context,
                    _getText('videoTutorials'),
                    Icons.ondemand_video,
                    const VideoTutorialsScreen(),
                    false,
                  ),
                  _buildFeatureButton(
                    context,
                    _getText('aiTherapist'),
                    Icons.android,
                    const AiTherapistScreen(),
                    false,
                  ),
                  _buildFeatureButton(
                    context,
                    _getText('consultDoctor'),
                    Icons.medical_services,
                    const ConsultDoctorScreen(),
                    false,
                  ),
                  _buildFeatureButton(
                    context,
                    _getText('exercises'),
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: _getText('home')),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: _getText('tools')),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: _getText('profile')),
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

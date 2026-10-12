import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF42A5F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5FAFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF42A5F5),
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ---------------- LOGIN PAGE ----------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController rollController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    rollController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (rollController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter Roll Number and Password'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DashboardPage(rollNo: rollController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF7FF), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 55,
                        color: Color(0xFF0288D1),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'My Portfolio',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0288D1),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Student E-Portfolio',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),

                      // Profile photo
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFB3E5FC),
                          border: Border.all(
                            color: const Color(0xFF0288D1),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'lib/assets/profile.jpeg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                size: 60,
                                color: Color(0xFF0288D1),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      TextField(
                        controller: rollController,
                        decoration: const InputDecoration(
                          labelText: 'Roll Number',
                          prefixIcon: Icon(Icons.badge),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: login,
                          icon: const Icon(Icons.login),
                          label: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: const Color(0xFF0288D1),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- DASHBOARD PAGE ----------------

class DashboardPage extends StatelessWidget {
  final String rollNo;

  const DashboardPage({super.key, required this.rollNo});

  Widget dashboardButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(title),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            alignment: Alignment.centerLeft,
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF0288D1),
          ),
        ),
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio Dashboard'),
        backgroundColor: Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
           colors: [Color(0xFFF5FAFF), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: Color(0xFF0288D1),
                    child: Icon(
                      Icons.person,
                      size: 52,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Welcome to My Portfolio!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Roll Number: $rollNo',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  dashboardButton(
                    context,
                    'Academic Details',
                    Icons.school,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AcademicDetailsPage(),
                        ),
                      );
                    },
                  ),
                  dashboardButton(
                    context,
                    'Course Certifications (Skills)',
                    Icons.workspace_premium,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CertificationsPage(),
                        ),
                      );
                    },
                  ),
                  dashboardButton(
                    context,
                    'Extra-Curricular Activities',
                    Icons.emoji_events,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivitiesPage(),
                        ),
                      );
                    },
                  ),
                  dashboardButton(
                    context,
                    'Video-Animation of Achievements',
                    Icons.play_circle,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AchievementsPage(),
                        ),
                      );
                    },
                  ),
                  dashboardButton(
                    context,
                    'Logout',
                    Icons.logout,
                    () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- ACADEMIC DETAILS PAGE ----------------


class AcademicDetailsPage extends StatelessWidget {
  const AcademicDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Details'),
        backgroundColor: const Color(0xFF42A5F5),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5FAFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 950),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 55,
                  color: Color(0xFF0288D1),
                ),
                const SizedBox(height: 8),
                const Text(
                  'My Academic Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0288D1),
                  ),
                ),
                const SizedBox(height: 24),

                // B.Tech details card
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color(0xFFBBDEFB),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'B.Tech — Computer Science and Engineering',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0288D1),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'BVRIT Hyderabad College of Engineering for Women',
                          ),
                          SizedBox(height: 8),
                          Text('Duration: 2024–2028'),
                          Text('Current Year: 3rd Year'),
                          SizedBox(height: 12),
                          Text(
                            'Current CGPA: 8.69',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF0288D1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Education History',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0288D1),
                  ),
                ),

                const SizedBox(height: 14),

                // Centered academic table
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(
                            const Color(0xFFB3E5FC),
                          ),
                          border: TableBorder.all(
                            color: const Color(0xFF90CAF9),
                          ),
                          columnSpacing: 24,
                          horizontalMargin: 12,
                          columns: const [
                            DataColumn(label: Text('Course')),
                            DataColumn(label: Text('Institution')),
                            DataColumn(label: Text('Year')),
                            DataColumn(label: Text('Marks')),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('10th Class')),
                              DataCell(Text('SHRADDHA- The School')),
                              DataCell(Text('2022')),
                              DataCell(Text('93.1%')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Intermediate')),
                              DataCell(
                                Text('Sri Chaitanya Junior College'),
                              ),
                              DataCell(Text('2024')),
                              DataCell(Text('927')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('B.Tech 1st Year')),
                              DataCell(Text('BVRIT Hyderabad')),
                              DataCell(Text('2024–2025')),
                              DataCell(Text('—')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('B.Tech 2nd Year')),
                              DataCell(Text('BVRIT Hyderabad')),
                              DataCell(Text('2025–2026')),
                              DataCell(Text('CGPA: 8.69')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Academic information and performance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
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



// ---------------- CERTIFICATIONS PAGE ----------------

class CertificationsPage extends StatelessWidget {
  const CertificationsPage({super.key});

  static const List<Map<String, String>> certificates = [
    {
      'name': 'Object-Oriented Programming in Java',
      'platform': 'Downloaded Certificate',
      'year': '2025',
      'assetPath': 'lib/assets/certificates/java_certificate.pdf',
    },
    {
      'name': 'Data Structures',
      'platform': 'Downloaded Certificate',
      'year': '2025',
      'assetPath': 'lib/assets/certificates/data_structures_certificate.pdf',
    },
    {
      'name': 'Learn SQL for Data Analysis with Google BigQuery',
      'platform': 'Udemy via Infosys Springboard',
      'year': '2026',
      'url':
          'https://infyspringboard.onwingspan.com/public-assets/infosysheadstart/cert/lex_auth_014157699928080384292/adbb517f-a0e8-471e-9c9e-15b737936048.pdf',
    },
  ];
  Future<void> openCertificate(
  BuildContext context,
  Map<String, String> certificate,
) async {
  final assetPath = certificate['assetPath'];
  final onlineUrl = certificate['url'];

  try {
    if (assetPath != null) {
      // Open a browser tab immediately to avoid popup blocking.
      final newWindow = web.window.open('about:blank', '_blank');

      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      final blob = web.Blob(
        [bytes.toJS].toJS,
        web.BlobPropertyBag(type: 'application/pdf'),
      );

      final pdfUrl = web.URL.createObjectURL(blob);

      if (newWindow != null) {
        newWindow.location.href = pdfUrl;
      } else {
        web.window.open(pdfUrl, '_blank');
      }
    } else {
      await launchUrl(
        Uri.parse(onlineUrl!),
        mode: LaunchMode.platformDefault,
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to open certificate: $e'),
        ),
      );
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Certifications'),
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5FAFF),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              final certificate = certificates[index];

              return Card(
                color: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Color(0xFFBBDEFB),
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(18),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFB3E5FC),
                    child: Icon(
                      Icons.workspace_premium,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                  title: Text(
                    certificate['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${certificate['platform']} • '
                      '${certificate['year']} • Completed',
                    ),
                  ),
                  trailing: IconButton(
                    tooltip: 'Open Certificate',
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xFF0288D1),
                    ),
                    onPressed: () => openCertificate(
                      context,
                      certificate,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



// ---------------- EXTRA-CURRICULAR ACTIVITIES PAGE ----------------


class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  static const List<Map<String, dynamic>> activities = [
    {
      'title': 'Teamwork',
      'description':
          'Collaborating with team members and contributing to shared goals.',
      'icon': Icons.groups,
    },
    {
      'title': 'Communication Skills',
      'description':
          'Sharing ideas clearly and communicating effectively with others.',
      'icon': Icons.forum,
    },
    {
      'title': 'Technical Workshops',
      'description':
          'Learning new technologies and exploring new technical skills.',
      'icon': Icons.computer,
    },
    {
      'title': 'Project Participation',
      'description':
          'Participating in academic projects and solving problems as a team.',
      'icon': Icons.lightbulb,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extra-Curricular Activities'),
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5FAFF),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Icon(
                Icons.interests,
                size: 55,
                color: Color(0xFF0288D1),
              ),
              const SizedBox(height: 12),
              const Text(
                'My Activities & Skills',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0288D1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Skills and experiences that support my personal '
                'and professional growth.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 28),

              ...activities.map((activity) {
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color(0xFFBBDEFB),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(18),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: const Color(0xFFB3E5FC),
                      child: Icon(
                        activity['icon'] as IconData,
                        color: const Color(0xFF0288D1),
                        size: 28,
                      ),
                    ),
                    title: Text(
                      activity['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF0277BD),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        activity['description'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


// ---------------- ACHIEVEMENTS PAGE ----------------

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _cardsController;

  late Animation<double> _headerFade;
  late Animation<Offset> _headerSlide;

  static const List<Map<String, dynamic>> achievements = [
    {
      'title': 'Power BI Learning',
      'description':
          'Learning data visualization and dashboard development.',
      'icon': Icons.bar_chart,
    },
    {
      'title': 'Java Programming',
      'description':
          'Building programming knowledge and problem-solving skills.',
      'icon': Icons.code,
    },
    {
      'title': 'Academic Projects',
      'description':
          'Applying technical knowledge through practical projects.',
      'icon': Icons.school,
    },
    {
      'title': 'Continuous Learning',
      'description':
          'Exploring new technologies and improving technical skills.',
      'icon': Icons.emoji_events,
    },
  ];

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _headerFade = CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeIn,
    );

    _headerSlide = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: Curves.easeOutCubic,
      ),
    );

    _cardsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    _headerController.forward();
    _cardsController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEDE7F6),
              Color(0xFFB3E5FC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FadeTransition(
              opacity: _headerFade,
              child: SlideTransition(
                position: _headerSlide,
                child: const Column(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 90,
                      color: Color(0xFF0288D1),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'My Learning Journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0288D1),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'A showcase of my learning and development.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ...List.generate(achievements.length, (index) {
              final achievement = achievements[index];

              final start = index * 0.20;
              final end = (start + 0.45).clamp(0.0, 1.0);

              final cardAnimation = CurvedAnimation(
                parent: _cardsController,
                curve: Interval(
                  start,
                  end,
                  curve: Curves.easeOutCubic,
                ),
              );

              return AnimatedBuilder(
                animation: cardAnimation,
                builder: (context, child) {
                  final progress = cardAnimation.value;

                  return Opacity(
                    opacity: progress,
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        60 * (1 - progress),
                      ),
                      child: Transform.scale(
                        scale: 0.85 + (0.15 * progress),
                        child: child,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0.2,
                        end: 1.0,
                      ),
                      duration: Duration(
                        milliseconds: 900 + (index * 200),
                      ),
                      curve: Curves.elasticOut,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F5FE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          achievement['icon'] as IconData,
                          color: const Color(0xFF0288D1),
                          size: 35,
                        ),
                      ),
                    ),
                    title: Text(
                      achievement['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF0288D1),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        achievement['description'] as String,
                        style: const TextStyle(
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 12),

            FadeTransition(
              opacity: _headerFade,
              child: const Text(
                'Every step forward is an achievement!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0288D1),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _fadeController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _fadeAnimation;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroSection(),
              _buildAboutSection(),
              _buildProjectsSection(),
              _buildSkillsSection(),
              _buildContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _floatingAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _floatingAnimation.value),
                    child: child,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: const Color(0xFF00ff41), width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00ff41).withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Text(
                    '👾',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildPixelText(
                'PLAYER ONE',
                60,
                const Color(0xFFffd700),
              ),
              const SizedBox(height: 20),
              _buildPixelText(
                'Full Stack Developer & Game Creator',
                24,
                const Color(0xFF00ff41),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGameButton('VIEW PROJECTS', Icons.gamepad, () {
                    // Navigate to projects
                  }),
                  const SizedBox(width: 20),
                  _buildGameButton('CONTACT ME', Icons.mail, () {
                    // Navigate to contact
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildSectionTitle('ABOUT ME'),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(color: const Color(0xFF00d4ff), width: 4),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00d4ff).withOpacity(0.3),
                  blurRadius: 15,
                ),
              ],
            ),
            child: _buildPixelText(
              'I\'m a passionate developer who loves creating games and applications. '
                  'With expertise in Flutter, Firebase, and game development, I bring '
                  'ideas to life with vibrant designs and smooth animations.',
              20,
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildSectionTitle('PROJECTS'),
          const SizedBox(height: 40),
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('projects').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return _buildProjectCard(
                  'Epic Adventure Game',
                  'A multiplayer game built with Unity and Firebase',
                  ['Unity', 'C#', 'Firebase'],
                  const Color(0xFFff6b6b),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Color(0xFF00ff41),
                );
              }

              // If no Firebase data, show default projects
              return Column(
                children: [
                  _buildProjectCard(
                    'Epic Adventure Game',
                    'A multiplayer game built with Unity and Firebase',
                    ['Unity', 'C#', 'Firebase'],
                    const Color(0xFFff6b6b),
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'Portfolio App',
                    'Beautiful portfolio with Minecraft aesthetics',
                    ['Flutter', 'Dart', 'Firebase'],
                    const Color(0xFF4ecdc4),
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'Task Manager',
                    'Real-time task management application',
                    ['Flutter', 'Firebase', 'Firestore'],
                    const Color(0xFFffd700),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
      String title, String description, List<String> tech, Color color) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(color: color, width: 4),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPixelText(title, 28, color),
            const SizedBox(height: 15),
            _buildPixelText(description, 18, Colors.white70),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tech
                  .map((t) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  border: Border.all(color: color, width: 2),
                ),
                child: _buildPixelText(t, 16, color),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    final skills = [
      {'name': 'Flutter', 'level': 0.9, 'color': const Color(0xFF00d4ff)},
      {'name': 'Firebase', 'level': 0.85, 'color': const Color(0xFFffa500)},
      {'name': 'Dart', 'level': 0.88, 'color': const Color(0xFF00ff41)},
      {'name': 'Unity', 'level': 0.75, 'color': const Color(0xFFff6b6b)},
      {'name': 'UI/UX', 'level': 0.8, 'color': const Color(0xFFffd700)},
    ];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildSectionTitle('SKILLS'),
          const SizedBox(height: 40),
          ...skills.map((skill) => _buildSkillBar(
            skill['name'] as String,
            skill['level'] as double,
            skill['color'] as Color,
          )),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String name, double level, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPixelText(name, 22, color),
          const SizedBox(height: 10),
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1500),
            tween: Tween<double>(begin: 0, end: level),
            builder: (context, double value, child) {
              return Stack(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(color: color, width: 3),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: value,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.7),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildSectionTitle('CONTACT'),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.email, const Color(0xFFff6b6b)),
              const SizedBox(width: 20),
              _buildSocialButton(Icons.code, const Color(0xFF00ff41)),
              const SizedBox(width: 20),
              _buildSocialButton(Icons.link, const Color(0xFF00d4ff)),
            ],
          ),
          const SizedBox(height: 60),
          _buildPixelText(
            '© 2024 Player One. Game On!',
            18,
            Colors.white54,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildGameButton(String text, IconData icon, VoidCallback onPressed) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 1, end: 1),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: GestureDetector(
            onTapDown: (_) {},
            onTapUp: (_) {
              onPressed();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00ff41), Color(0xFF00cc33)],
                ),
                border: Border.all(color: Colors.black, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00ff41).withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                  const BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.black, size: 24),
                  const SizedBox(width: 10),
                  _buildPixelText(text, 20, Colors.black),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: color, width: 3),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(color: const Color(0xFFffd700), width: 4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFffd700).withOpacity(0.5),
            blurRadius: 15,
          ),
        ],
      ),
      child: _buildPixelText(title, 36, const Color(0xFFffd700)),
    );
  }

  Widget _buildPixelText(String text, double size, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.8),
            offset: const Offset(3, 3),
          ),
        ],
      ),
    );
  }
}
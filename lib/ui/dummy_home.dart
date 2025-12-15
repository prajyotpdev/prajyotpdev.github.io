// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PP\'s Portfolio',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//         fontFamily: 'Cormorant',
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             fontSize: 72,
//             fontWeight: FontWeight.w300,
//             letterSpacing: -2,
//             color: Color(0xFF2C3E50),
//           ),
//           displayMedium: TextStyle(
//             fontSize: 48,
//             fontWeight: FontWeight.w300,
//             letterSpacing: -1,
//             color: Color(0xFF2C3E50),
//           ),
//           bodyLarge: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             letterSpacing: 0.5,
//             height: 1.8,
//             color: Color(0xFF5D6D7E),
//           ),
//         ),
//       ),
//       home: const PortfolioHomePage(),
//     );
//   }
// }
//
// class PortfolioHomePage extends StatefulWidget {
//   const PortfolioHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<PortfolioHomePage> createState() => _PortfolioHomePageState();
// }
//
// class _PortfolioHomePageState extends State<PortfolioHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildNavBar(),
//             _buildHeroSection(),
//             _buildAboutSection(),
//             _buildFooter(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNavBar() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'PP',
//             style: Theme.of(context).textTheme.displayMedium?.copyWith(
//               fontSize: 28,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           Row(
//             children: [
//               _buildNavItem('Work'),
//               const SizedBox(width: 50),
//               _buildNavItem('About'),
//               const SizedBox(width: 50),
//               _buildNavItem('Contact'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(String text) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () {},
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Color(0xFF5D6D7E),
//             letterSpacing: 1,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeroSection() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
//         constraints: const BoxConstraints(maxWidth: 1400),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFE1E1E1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Text(
//                       'Flutter Developer',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF494949),
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Text(
//                     'Building Projects with Passion',
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                   const SizedBox(height: 30),
//                   Text(
//                     'A minimalist approach to design, inspired by\nItalian elegance and contemporary aesthetics.',
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   const SizedBox(height: 50),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF838383),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 40,
//                             vertical: 20,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           'View Projects',
//                           style: TextStyle(
//                             fontSize: 16,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF5D6D7E),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 40,
//                             vertical: 20,
//                           ),
//                         ),
//                         child: const Row(
//                           children: [
//                             Text(
//                               'Get in Touch',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 letterSpacing: 1,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Icon(Icons.arrow_forward, size: 20),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 80),
//             Expanded(
//               flex: 4,
//               child: Container(
//                 height: 500,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF818181),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 40,
//                       offset: const Offset(0, 20),
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: const Center(
//                     child: Icon(
//                       Icons.person_outline,
//                       size: 120,
//                       color: Color(0xFFD6D6D6),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAboutSection() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
//       color: const Color(0xFFEFEFEF),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'About',
//                       style:
//                       Theme.of(context).textTheme.displayMedium?.copyWith(
//                         fontSize: 36,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       'Blending creativity with functionality',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 80),
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   'With years of experience in design and development, I create timeless digital experiences that resonate with users. My work is characterized by clean lines, thoughtful typography, and a deep appreciation for whitespace.',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 80),
//           Row(
//             children: [
//               _buildStatCard('10+', 'Projects'),
//               const SizedBox(width: 40),
//               _buildStatCard('2+', 'Years'),
//               const SizedBox(width: 40),
//               _buildStatCard('10000+', 'Hours of coding'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatCard(String number, String label) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF4F4F4),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             Text(
//               number,
//               style: const TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.w300,
//                 color: Color(0xFF888888),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF5D6D7E),
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFooter() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
//       color: const Color(0xFF2C3E50),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             '© 2024 Portfolio. All rights reserved.',
//             style: TextStyle(
//               color: Color(0xFFBDC3C7),
//               fontSize: 14,
//             ),
//           ),
//           Row(
//             children: [
//               _buildFooterLink('LinkedIn'),
//               const SizedBox(width: 30),
//               _buildFooterLink('Behance'),
//               const SizedBox(width: 30),
//               _buildFooterLink('Dribbble'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFooterLink(String text) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () {},
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Color(0xFFBDC3C7),
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
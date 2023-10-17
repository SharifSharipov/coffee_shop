// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MainApp());
// }
//
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: CoffeeScreen());
//   }
// }
//
// class CoffeeScreen extends StatefulWidget {
//   @override
//   _CoffeeScreenState createState() => _CoffeeScreenState();
// }
//
// class _CoffeeScreenState extends State<CoffeeScreen> {
//   late PageController _pageController;
//   double _currentPage = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coffee Menu'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: coffeeList.length,
//               itemBuilder: (context, index) {
//                 final coffee = coffeeList[index];
//                 final delta = index - _currentPage;
//                 final angle = -0.4 * delta + (_currentPage - index) * 0.03;
//
//                 return Transform(
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateY(angle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                             blurRadius: 6.0,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             coffee.imagePath,
//                             width: 200,
//                             height: 200,
//                           ),
//                           const SizedBox(height: 16.0),
//                           Text(
//                             coffee.name,
//                             style: const TextStyle(
//                               fontSize: 24.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             coffee.description,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (int i = 0; i < coffeeList.length; i++)
//                 if (i == _currentPage.round()) _buildDot(true) else _buildDot(false),
//             ],
//           ),
//           const SizedBox(height: 16.0),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDot(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       margin: const EdgeInsets.symmetric(horizontal: 6.0),
//       height: isActive ? 12.0 : 8.0,
//       width: isActive ? 12.0 : 8.0,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.brown : Colors.brown.withOpacity(0.5),
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//       ),
//     );
//   }
// }
//
// class Coffee {
//   final String name;
//   final String description;
//   final String imagePath;
//
//   Coffee({required this.name, required this.description, required this.imagePath});
// }
//
// final List<Coffee> coffeeList = [
//   Coffee(
//     name: 'Espresso',
//     description: 'A strong, concentrated coffee drink.',
//     imagePath: 'assets/images/1.png',
//   ),
//   Coffee(
//     name: 'Cappuccino',
//     description: 'Espresso with steamed milk and a layer of froth.',
//     imagePath: 'assets/images/2.png',
//   ),
//   Coffee(
//     name: 'Latte',
//     description: 'Espresso with steamed milk and a small amount of foam.',
//     imagePath: 'assets/images/3.png',
//   ),
//   Coffee(
//     name: 'Mocha',
//     description: 'Latte with chocolate syrup or powder.',
//     imagePath: 'assets/images/4.png',
//   ),
//   Coffee(
//     name: 'Americano',
//     description: 'Espresso diluted with hot water.',
//     imagePath: 'assets/images/5.png',
//   ),
//   Coffee(
//     name: 'Macchiato',
//     description: 'Espresso with a dollop of foamed milk.',
//     imagePath: 'assets/images/6.png',
//   ),
// ];
// -------------------------------------------------------------
// class CoffeeScreen extends StatefulWidget {
//   @override
//   _CoffeeScreenState createState() => _CoffeeScreenState();
// }
//
// class _CoffeeScreenState extends State<CoffeeScreen> {
//   late PageController _pageController;
//   double _currentPage = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coffee Menu'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: coffeeList.length,
//               itemBuilder: (context, index) {
//                 final coffee = coffeeList[index];
//                 final delta = index - _currentPage;
//                 final angle = -0.4 * delta + (_currentPage - index) * 0.03;
//
//                 return Transform(
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateX(angle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         color: Colors.white,
//                         boxShadow: [
//                           const BoxShadow(
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                             blurRadius: 6.0,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             coffee.imagePath,
//                             width: 200,
//                             height: 200,
//                           ),
//                           const SizedBox(height: 16.0),
//                           Text(
//                             coffee.name,
//                             style: const TextStyle(
//                               fontSize: 24.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             coffee.description,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (int i = 0; i < coffeeList.length; i++)
//                 if (i == _currentPage.round()) _buildDot(true) else _buildDot(false),
//             ],
//           ),
//           const SizedBox(height: 16.0),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDot(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       margin: const EdgeInsets.symmetric(horizontal: 6.0),
//       height: isActive ? 12.0 : 8.0,
//       width: isActive ? 12.0 : 8.0,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.brown : Colors.brown.withOpacity(0.5),
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//       ),
//     );
//   }
// }

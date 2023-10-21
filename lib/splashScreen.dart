// import 'package:flutter/material.dart';
// import 'package:metro_oct/Homepage/homepage.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Add any initialization logic here (e.g., data loading, API calls).
//     // You can use a timer to simulate a delay for the splash screen.
//
//
//     // Create a Stopwatch instance
//
//
//     // Start the stopwatch
//
//
//      Future.delayed(const Duration(seconds: 3), () {
//       // Navigate to the desired screen after the splash screen.
//       // For example, if you have a home screen widget called HomeScreen:
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const homepage()),
//       );
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Container(
//         color:Colors.grey,
//         child: Center(
//           child:Column(
//             children: [
//               Container(height:100,),
//               Image.asset('assets/images/delhi-metro.png'),
//               Text("Delhi Metro",style:
//                 const TextStyle(
//                     fontSize:30,
//                     shadows: [
//                       Shadow(
//                         color: Colors.white54,
//                         offset: Offset(2, 2),
//                         blurRadius: 3,
//                       ),
//                     ],
//                     color:Colors.white24,
//                   fontFamily:'fontmain'
//                 )
//                 ,
//
//
//               ),
//             ],
//           )
//         ),
//       )
//     );
//   }
// }

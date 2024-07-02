// // lib/screens/get_started_page.dart
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widgets/custom_button.dart';

// class GetStartedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background gradient
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.deepPurple, Colors.deepOrange],
//               ),
//             ),
//           ),
//           // Background image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/background.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Container(
//                 color: Colors.black.withOpacity(0.1),
//               ),
//             ),
//           ),
//           // Content in center
//           Center(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.white.withOpacity(0.8),
//                     Colors.deepOrange.withOpacity(0.8)
//                   ],
//                 ),
//                 // color: Colors.white.withOpacity(0.8),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Movie Time',
//                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Welcome to Movie Time, your ultimate destination for movies!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(height: 30),
//                   CustomButton(
//                     text: 'Get Started',
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/home');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/screens/get_started_page.dart

import 'dart:ui';

import 'package:biswajit_profile_web/themes/app_color.dart';
import 'package:flutter/material.dart';

import '../themes/app_assets.dart';
import '../widgets/background_shapes.dart';
import '../widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white.withOpacity(0.5),
        body: LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          bool isMobile = width < 600;
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    // 'assets/images/background.png',

                    AppAssets.kBackground,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Center(
              //   child: Container(
              //     width: isMobile ? width * 0.8 : width * 0.5,
              //     height: isMobile ? height * 0.6 : height * 0.8,
              //     child: Image.asset(
              //       'assets/images/marvel.png',
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
              // Content in center
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          focal: Alignment.topCenter,
                          radius: .85,
                          colors: [
                            AppColor.kGredientColor1.withOpacity(0.8),
                            AppColor.kGredientColor2.withOpacity(0.8)
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            offset: const Offset(0, 10),
                            blurRadius: 0,
                            spreadRadius: 0,
                          )
                        ],
                        // color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Movie Time',
                            style: TextStyle(
                              color: AppColor.kWhiteColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Welcome to Movie Time, your ultimate destination for movies!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.kWhiteColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: 'Get Started',
                            borderRadius: 16,
                            gradientColors: [
                              AppColor.kPrimary.withOpacity(0.5),
                              AppColor.kButtonColor
                            ],
                            borderColor: AppColor.kBorderColor,
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

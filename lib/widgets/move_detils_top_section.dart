import 'package:biswajit_profile_web/themes/app_color.dart';
import 'package:biswajit_profile_web/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsTopSection extends StatelessWidget {
  final Movie movie;

  const MovieDetailsTopSection({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return SizedBox(
          height: isMobile ? 300 : 500,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  movie.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(1.0),
                        Colors.black.withOpacity(0.1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: isMobile ? 200 : 300,
                    height: isMobile ? 300 : 500,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(movie.imagePath),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: isMobile ? 24 : 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie.description,
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 24,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const Spacer(),
                          CustomButton(
                            onPressed: () {},
                            borderRadius: 8,
                            height: isMobile ? 50 : 60,
                            width: isMobile ? 200 : 300,
                            fontSize: isMobile ? 14 : 18,
                            borderColor: Colors.white,
                            gradientColors: [
                              AppColor.kPurpleColor,
                              AppColor.kDarkPurpleColor,
                            ],
                            text: 'Book Ticket',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

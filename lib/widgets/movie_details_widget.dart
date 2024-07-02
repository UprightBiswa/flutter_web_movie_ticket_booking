import 'package:flutter/material.dart';
import 'cast_card.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About the Movie',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'When the world is taken over by darkness. A force will rise.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 20),
          //devider
          Divider(
            color: Colors.white,
            height: 1,
            thickness: 1,
          ),

          SizedBox(height: 20),

          Text(
            'Cast',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CastCard(
                  name: 'Prabhas',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'as Bhairava',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Deepika Padukone',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Actor',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Amitabh Bachchan',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'as Ashwatthama',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Kamal Haasan',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Actor',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Disha Patani',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Actor',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Pasupathy Ramasaamy',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Actor',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Saswata Chatterjee',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Actor',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white,
            height: 1,
            thickness: 1,
          ),
          SizedBox(height: 20),
          Text(
            'Crew',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CastCard(
                  name: 'Nag Ashwin',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Director, Writer',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'C. Ashwini Dutt',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Producer',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Priyanka Dutt',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Producer',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Swapna Dutt',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Producer',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Santhosh Narayanan',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Musician',
                ),
                SizedBox(width: 10),
                CastCard(
                  name: 'Kotagiri Venkateswara Rao',
                  imagePath: 'assets/images/tulsa.jpg',
                  role: 'Editor',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          //devider
          Divider(
            color: Colors.white,
            height: 1,
            thickness: 1,
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}

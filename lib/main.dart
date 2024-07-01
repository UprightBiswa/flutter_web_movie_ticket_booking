import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/movie.dart';
import 'providers/movie_provider.dart';
import 'screens/billing_page.dart';
import 'screens/get_started_page.dart';
import 'screens/movie_list_screen.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/seat_selection_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieProvider()),
      ],
      child: MaterialApp(
        title: 'Movie Ticket Booking',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => GetStartedPage(),
          '/home': (context) => MovieListScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/movie-detail') {
            final args = settings.arguments as Movie?;
            if (args == null) {
              // If the Movie data is missing, navigate to the home page
              return MaterialPageRoute(builder: (context) => MovieListScreen());
            } else {
              return MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movie: args));
            }
          } else if (settings.name == '/seat-selection') {
            final args = settings.arguments as SeatSelectionScreenArguments;
            return MaterialPageRoute(
              builder: (context) {
                return SeatSelectionScreen(
                  seatLayout: args.seatLayout,
                  totalPeople: args.totalPeople,
                );
              },
            );
          } else if (settings.name == '/billing') {
            final args = settings.arguments as BillingPageArguments;
            return MaterialPageRoute(
              builder: (context) {
                return BillingPage(
                  selectedSeats: args.selectedSeats,
                  seatLayout: args.seatLayout,
                  totalPrice: args.totalPrice,
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/action_movies_card.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/available_movie_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TrendingMovieEntity> availableMovie = [
    TrendingMovieEntity(
      id: 1,
      title: "Captain America",
      posterPath: 'assets/images/captain.jpg',
      rating: 7.7,
      releaseDate: "2011-07-22",
    ),
    TrendingMovieEntity(
      id: 2,
      title: "Black Panther",
      posterPath: 'assets/images/black.png',
      rating: 8.3,
      releaseDate: "2018-02-16",
    ),
    TrendingMovieEntity(
      id: 2,
      title: "The Dark",
      posterPath: 'assets/images/dark.png',
      rating: 8.3,
      releaseDate: "2018-02-16",
    ),
  ];

  final List<ActionMovieEntity> actionMovies = [
    ActionMovieEntity(
      title: 'Captain America',
      assetPath: AppAssets.captain,
      rating: 7.7,
    ),
    ActionMovieEntity(title: 'black', assetPath: AppAssets.black, rating: 8.3),
    ActionMovieEntity(
      title: 'The Dark ',
      assetPath: AppAssets.dark,
      rating: 6.3,
    ),

    // Add more movies here
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppPalette.gradient2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.Available, width: screenWidth * 0.7),

            const SizedBox(height: 16),
            SizedBox(
              height: 351,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AvailableMovieCard(
                    trendingMovieEntity: availableMovie[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: availableMovie.length,
              ),
            ),
            //  Image.asset(AppAssets.watch, width: screenWidth * 0.7),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Action",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See More",
                    style: TextStyle(color: AppPalette.gradient2, fontSize: 22),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220, // ارتفاع ثابت علشان البوسترات
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // هنا التغيير الأساسي
                itemCount: actionMovies.length,
                itemBuilder: (context, index) {
                  return ActionMoviesCard(
                    actionMovieEntity: actionMovies[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

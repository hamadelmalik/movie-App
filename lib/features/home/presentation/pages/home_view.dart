import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  final List<ActionMovieEntity> actionMovies = [
    ActionMovieEntity(title: 'Captain America', assetPath: AppAssets.captain, rating: 7.7),
    ActionMovieEntity(title: 'black', assetPath: AppAssets.black, rating: 8.3),
    ActionMovieEntity(title: 'The Dark ', assetPath: AppAssets.dark, rating: 6.3),

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
            Image.asset(AppAssets.available, width: screenWidth * 0.7),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AppAssets.a1917,
                  width: screenWidth * 0.6, height: 361, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Image.asset(AppAssets.watch, width: screenWidth * 0.7),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Action",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                TextButton(
                  onPressed: () {},
                  child: Text("See More",
                      style: TextStyle(
                          color: AppPalette.gradient3, fontSize: 22)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220, // ارتفاع ثابت علشان البوسترات
              child: ListView.builder(
                scrollDirection: Axis.horizontal,   // هنا التغيير الأساسي
                itemCount: actionMovies.length,
                itemBuilder: (context, index) {
                  final movie = actionMovies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            movie.assetPath,
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  movie.rating.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 22),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.star, color: Colors.yellow, size: 30),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
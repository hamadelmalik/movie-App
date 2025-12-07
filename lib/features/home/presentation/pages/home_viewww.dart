import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_sate.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/action_movies_card.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/available_movie_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrendingCubit>().fetchTrendingMovies();
    });
  }

  final List<ActionMovieEntity> actionMovies = [
    ActionMovieEntity(
      title: 'Captain America',
      assetPath: AppAssets.captain,
      rating: 7.7,
    ),
    ActionMovieEntity(
      title: 'Black Panther',
      assetPath: AppAssets.black,
      rating: 8.3,
    ),
    ActionMovieEntity(
      title: 'The Dark Knight',
      assetPath: AppAssets.dark,
      rating: 6.3,
    ),
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

            // 🔥 Trending Movies Section
            BlocBuilder<TrendingCubit, TrendingState>(
              builder: (context, state) {
                if (state is GetTrendingLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetTrendingFailure) {
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is GetTrendingSuccessfully) {
                  final movies = state.trendingMovies;
                  return SizedBox(
                    height: 351,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return AvailableMovieCard(trendingMovieEntity: movie);
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            const SizedBox(height: 16),

            // 🎬 Action Movies Section
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
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
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

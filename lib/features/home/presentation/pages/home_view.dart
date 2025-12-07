import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_sate.dart'
    hide TrendingCubit;
import 'package:movie_app/features/home/presentation/pages/widgets/action_movies_card.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/available_movie_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final actionMovies = [
      ActionMovieEntity(title: 'Captain America',
          assetPath: 'assets/images/captain.jpg',
          rating: 7.7),
      ActionMovieEntity(title: ' The Dark Knight',
          assetPath: 'assets/images/dark.png',
          rating: 8.3),
      ActionMovieEntity(title: 'Black Panther',
          assetPath: 'assets/images/black.png',
          rating: 6.3),
    ];
    return BlocProvider(
      create: (_) => sl<TrendingCubit>()..fetchTrendingMovies(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: const Text('Home'), backgroundColor: Colors.deepPurple),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text("Trending Movies", style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 270,
                child: BlocBuilder<TrendingCubit, TrendingState>(
                  builder: (context, state) {
                    if (state is GetTrendingLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetTrendingFailure) {
                      return Center(child: Text(state.errMessage,
                          style: const TextStyle(color: Colors.red)));
                    } else if (state is GetTrendingSuccessfully) {
                      final movies = state.trendingMovies;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return AvailableMovieCard(
                              trendingMovieEntity: movies[index]);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Action",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  TextButton(onPressed: () {},
                      child: const Text("See More", style: TextStyle(
                          color: Colors.deepPurple, fontSize: 22))),
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
                        actionMovieEntity: actionMovies[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/available_movie_card.dart';
import 'package:movie_app/features/home/presentation/pages/widgets/action_movies_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final movieCubit = context.read<MovieCubit>();

    // Fetch trending movies
    movieCubit.fetchMovies('trending', MovieParams(endpoint: EndPoints.trending));

    // Fetch action movies
    movieCubit.fetchMovies('action', MovieParams(endpoint: EndPoints.action));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Section
            const SizedBox(height: 16),
            const Text(
              "Trending Movies",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 270,
              child: BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieError) {
                    return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ));
                  } else if (state is MovieSuccess) {
                    final trendingMovies =
                        state.moviesByEndpoint['trending'] ?? [];
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          AvailableMovieCard(movieEntity: trendingMovies[index]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),

            // Action Section
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Action",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See More",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 22),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 270,
              child: BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieError) {
                    return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ));
                  } else if (state is MovieSuccess) {
                    final actionMovies = state.moviesByEndpoint['action'] ?? [];
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: actionMovies.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          ActionMoviesCard(movieEntity: actionMovies[index]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

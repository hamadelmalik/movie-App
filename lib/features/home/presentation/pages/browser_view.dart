import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/presentation/cubit/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/genres_sate.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';

class BrowserView extends StatefulWidget {
  const BrowserView({super.key});

  @override
  State<BrowserView> createState() => _BrowserViewState();
}

class _BrowserViewState extends State<BrowserView> {
  @override
  void initState() {
    super.initState();
    final genresCubit = context.read<GenresCubit>();
    if (genresCubit.state is! GenresSuccess) {
      genresCubit.fetchGenres();
      log("Fetching genres from API...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(builder: (context, state) {
      if (state is GenresLoading){
        return  Center(child: CircularProgressIndicator());}
      if (state is GenresError) {return Center(child: Text(state.message));}
      if (state is GenresSuccess) {
        final genres = state.genres;
        return DefaultTabController(
          length: genres.length,
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    tabs: genres.map((g) =>
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppPalette.gradient2,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(g.name, style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        )).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    children: genres.map((g) {
                      return BlocBuilder<MovieCubit, MovieState>(
                        builder: (context, state) {
                          // fetch for this genre
                          context.read<MovieCubit>().fetchMoviesByGenre(g.id);

                          if (state is MovieLoading) {return const Center(
                              child: CircularProgressIndicator());}
                          if (state is MovieError){
                            return Center(child: Text(state.message));}
                          if (state is MovieSuccess) {
                            final movies = state.movies;
                            return GridView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: movies.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${movie
                                        .posterPath}",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

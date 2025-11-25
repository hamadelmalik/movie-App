import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/movie/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/movie/presentation/cubit/movie_state.dart';
import 'package:movie_app/features/movie/presentation/widgets/custom_bottom.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppPalette.gradient3),
          onPressed: () {},
        ),
        title: const Text('Movie Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark, color: AppPalette.gradient3),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (state is MovieDetailsFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
        
            if (state is MovieDetailsLoaded) {
              final movie = state.movieDetails;
        
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      /// Poster
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.posterPath.isNotEmpty
                        ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                        : "https://via.placeholder.com/500x750?text=No+Image",
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.broken_image, size: 50));
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
        
              ),
        
                      const SizedBox(height: 16),
        
                      /// Wrap for Likes, Time, Rating
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
        
                          /// Likes
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppPalette.gradient2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.favorite, color: Colors.amber, size: 22),
                                const SizedBox(width: 6),
                                Text(
                                  movie.runtime.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
        
                          /// Time
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppPalette.gradient2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.access_time, color: Colors.amber, size: 22),
                                SizedBox(width: 6),
                                Text(
                                  "90",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
        
                          /// Rating
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppPalette.gradient2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 22),
                                const SizedBox(width: 6),
                                Text(
                                  movie.runtime.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
        
                      const SizedBox(height: 20),
        
                      /// Overview Title
                      const Text(
                        "Overview",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
        
                      const SizedBox(height: 10),
        
                      /// Overview Text
                      Text(
                        movie.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
        
                      const SizedBox(height: 10),
        
                      CustomBottom(btnText: "watch"),
                    ],
                  ),
                ),
              );
            }
        
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

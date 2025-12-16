import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/presentation/cubit/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/genres_sate.dart';

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
      // call once only if data not yet loaded
      genresCubit.fetchGenres();
      log("Fetching trending movies from API...");
    } else {
      log("Data already fetched, skipping API call");
    }
  }

  // صور لكل فئة (يمكنك تعديلها حسب حاجتك)
  final Map<int, List<String>> categoryImages = {
    28: [AppAssets.black, AppAssets.captain], // Action
    12: [AppAssets.dark, AppAssets.watch], // Adventure
    16: [AppAssets.filmPoster], // Animation
    36: [AppAssets.timeIsEnemy], // Biography
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(builder: (context, state) {
      if (state is GenresLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is GenresError) {
        return Center(child: Text(state.message));
      }
      if (state is GenresSuccess) {
        final genres = state.genres;
        return DefaultTabController(
          length: genres.length,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // ✅ TabBar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                      tabs: genres.map((category) {
                        return Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppPalette.gradient2,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ✅ TabBarView مع Grid
                  Expanded(
                    child: TabBarView(
                      children: genres.map((category) {
                        final images = categoryImages[category.id] ?? [];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            itemCount: images.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    },);
  }
}

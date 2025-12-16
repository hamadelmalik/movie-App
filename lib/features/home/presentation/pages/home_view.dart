import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/cubit/action_move_state.dart';
import 'package:movie_app/features/home/presentation/cubit/action_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_sate.dart'
    hide TrendingCubit;
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
    final trendingCubit = context.read<TrendingCubit>();
    if (trendingCubit.state is! GetTrendingSuccessfully) {
      // call once only if data not yet loaded
      trendingCubit.fetchTrendingMovies();
      log("Fetching trending movies from API...");
    } else {
      log("Data already fetched, skipping API call");
    }
    final actionCubit = context.read<ActionCubit>();
    if (actionCubit.state is! ActionSuccess) {
      actionCubit.fetchActionMovies();
    } else {
      log("Data already fetched, skipping API call");
    }
  }

  //   log('"🟢 HomeView initState called log');

  @override
  Widget build(BuildContext context) {
    log("🔵 HomeView rebuilt log");

    // <- will log every rebuild

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text('Home'), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Trending Movies",
              style: TextStyle(color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 270,
              child: BlocBuilder<ActionCubit, ActionState>(
                builder: (context, state) {
                  if (state is ActionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ActionFailure) {
                    return Center(
                      child: Text(state.errMessage,
                          style: const TextStyle(color: Colors.red)),
                    );
                  } else if (state is ActionSuccess) {
                    final actionMovies = state.actionMovies;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: actionMovies.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          ActionMoviesCard(
                            actionMovieEntity: actionMovies[index],
                          ),
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
                TextButton(
                  onPressed: () {},
                  child: const Text("See More",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 22)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 270,
              child: BlocBuilder<ActionCubit, ActionState>(
                builder: (context, state) {
                  if (state is GetTrendingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetTrendingFailure) {
                    return Center(
                      child: Text("massage ",
                          style: const TextStyle(color: Colors.red)),
                    );
                  } else if (state is ActionSuccess) {
                    final actionMovies = state.actionMovies;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: actionMovies.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          ActionMoviesCard(
                            actionMovieEntity: actionMovies[index],
                          ),
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
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/domain/entity/genres_entity.dart';

class CustomDefaultTabController extends StatelessWidget {
  final List<GenresEntity> GenresList;

  const CustomDefaultTabController({super.key, required this.GenresList});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: GenresList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
            tabs: GenresList.map((element) {
              return Tab(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    minWidth: 110, // 👈 عرض ثابت
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppPalette.gradient2,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppPalette.gradient3),
                  ),
                  child: Text(
                    element.name, // ← هنا النص اللي بيظهر
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              );
            }).toList(),
          ),

          Expanded(
            child: TabBarView(
              children: GenresList.map((element) {
                return Center(
                  child: Text(
                    element.name,
                    style: const TextStyle(fontSize: 22),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

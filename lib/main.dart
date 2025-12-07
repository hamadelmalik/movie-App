import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/route/app_route.dart';
import 'package:movie_app/core/route/page_route_name.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // ⭐ مهم جداً{
  // سيعطي خطأ هنا إذا لم يُسجّل Repository
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TrendingCubit>(create: (context) => sl<TrendingCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppTheme.darkThemeMode,

      // ✅ HomeView تحت الـ Provider
      initialRoute: PageRouteName.layoutView,

      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}

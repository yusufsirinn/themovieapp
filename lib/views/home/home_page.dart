import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovieapp/core/utils/debouncer_mixin.dart';
import 'package:themovieapp/desing_system/atoms/tmdb_image.dart';
import 'package:themovieapp/models/movie_model.dart';

import '../../blocs/search_movies_bloc/search_movies_bloc.dart';
import '../../core/desing_system/atoms/indicator.dart';
import '../../core/enums/status_enum.dart';

part 'bone/home_view.dart';
part 'bone/movie_grid_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchMoviesBloc>(
      create: (context) => SearchMoviesBloc(client: Dio()),
      child: const HomeView(),
    );
  }
}

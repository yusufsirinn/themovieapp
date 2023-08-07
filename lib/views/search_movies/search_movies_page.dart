import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_movies_bloc/search_movies_bloc.dart';
import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../../design_system/molecules/tmdb_app_updater.dart';
import '../../models/movie_model.dart';
import '../../services/tmdb_search_movies_service/tmdb_search_movies_service.dart';
import '../movie_details/movie_details_page.dart';

part 'bone/movie_grid_tile.dart';
part 'bone/movies_grid_view.dart';
part 'bone/search_movie_info_text.dart';
part 'bone/search_movies_text_field.dart';
part 'bone/search_movies_view.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({Key? key}) : super(key: key);

  @override
  State<SearchMoviesPage> createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchMoviesPage> with AutomaticKeepAliveClientMixin<SearchMoviesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SearchMoviesBloc>(
      create: (context) => SearchMoviesBloc(service: TMDBSearchMoviesService()),
      child: const SearchMoviesView(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

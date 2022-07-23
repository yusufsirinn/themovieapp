import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/search_movies_bloc/search_movies_bloc.dart';
import '../../core/enums/padding_enum.dart';
import '../../core/enums/status_enum.dart';
import '../../core/extensions/scroll_controller_extensions.dart';
import '../../core/utils/debouncer_mixin.dart';
import '../../desing_system/atoms/atoms/indicator.dart';
import '../../desing_system/atoms/atoms/tmdb_image.dart';
import '../../models/movie_model.dart';
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
      create: (context) => SearchMoviesBloc(client: Dio()),
      child: const SearchMoviesView(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

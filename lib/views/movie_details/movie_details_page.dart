import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/movie_details_bloc/movie_details_bloc.dart';
import '../../core/enums/padding_enum.dart';
import '../../core/enums/size_enum.dart';
import '../../core/enums/status_enum.dart';
import '../../desing_system/atoms/atoms/indicator.dart';
import '../../desing_system/atoms/atoms/tmdb_image.dart';
import '../../models/movie_details_model.dart';

part 'bone/movie_backdrop.dart';
part 'bone/movie_details_app_bar.dart';
part 'bone/movie_details_view.dart';
part 'bone/movie_overview.dart';
part 'bone/movie_poster.dart';

class MovideDetailsPage extends StatefulWidget {
  final MovieDetails movieDetails;
  const MovideDetailsPage({Key? key, required this.movieDetails}) : super(key: key);

  @override
  State<MovideDetailsPage> createState() => _MovideDetailsPageState();
}

class _MovideDetailsPageState extends State<MovideDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => MovieDetailsBloc(client: Dio(), movie: widget.movieDetails),
      child: MovieDetailsView(movieDetails: widget.movieDetails),
    );
  }
}

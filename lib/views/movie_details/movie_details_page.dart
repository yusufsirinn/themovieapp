import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/movie_details_bloc/movie_details_bloc.dart';
import '../../core/core.dart';
import '../../desing_system/desing_system.dart';
import '../../models/movie_details_model.dart';
import '../../services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

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
      create: (context) => MovieDetailsBloc(service: TMDBMovieDetailsService(), movie: widget.movieDetails),
      child: MovieDetailsView(movieDetails: widget.movieDetails),
    );
  }
}

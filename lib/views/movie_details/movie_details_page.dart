import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/movie_details_bloc/movie_details_bloc.dart';
import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../../models/movie_details_model.dart';
import '../../services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

part 'bone/movie_backdrop.dart';
part 'bone/movie_details_app_bar.dart';
part 'bone/movie_details_view.dart';
part 'bone/movie_overview.dart';
part 'bone/movie_poster.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetails movieDetails;
  const MovieDetailsPage({Key? key, required this.movieDetails}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => MovieDetailsBloc(service: TMDBMovieDetailsService(), movie: widget.movieDetails),
      child: MovieDetailsView(movieDetails: widget.movieDetails),
    );
  }
}

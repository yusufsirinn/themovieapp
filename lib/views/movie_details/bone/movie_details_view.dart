part of '../movie_details_page.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieDetails movieDetails;
  const MovieDetailsView({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MovieDetailsBloc>().add(
            MovieDetailsFetched(id: widget.movieDetails.id),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (_) => AppNavigator.instance.pop(),
      child: Scaffold(
        appBar: MovieDetailsAppBar(title: widget.movieDetails.title),
        body: Center(
          child: Stack(
            children: [
              MovieBackdrop(
                backdropPath: context.watch<MovieDetailsBloc>().state.movie?.backdropPath,
              ),
              SafeArea(
                child: Padding(
                  padding: AppPadding.large.all,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MoviePoster(
                        posterPath: widget.movieDetails.posterPath,
                        voteAverage: widget.movieDetails.voteAverage,
                      ),
                      AppDimension.s.width,
                      BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                        builder: (context, state) {
                          return ViewStateWidget(
                            status: state.status,
                            success: MovieOverview(
                              overview: state.movie?.overview,
                              names: state.movie?.genresNames,
                            ),
                            failure: Center(
                              child: Text(context.tr.somethingWentWrong),
                            ),
                            loading: const Expanded(child: Indicator()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

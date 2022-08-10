part of '../movie_details_page.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieDetails movieDetails;
  const MovieDetailsView({Key? key, required this.movieDetails}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<MovieDetailsBloc>().add(MovieDetailsFetched(id: widget.movieDetails.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MovieDetailsAppBar(title: context.read<MovieDetailsBloc>().state.movie?.title),
      body: Center(
        child: Stack(
          children: [
            const MovieBackdrop(),
            SafeArea(
              child: Padding(
                padding: AppPadding.large.value(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MoviePoster(),
                    SizedBox(width: AppSize.s.value()),
                    BlocBuilder<MovieDetailsBloc, MovieDetailsState>(builder: (context, state) {
                      return ViewStateWidget(
                        status: state.status,
                        success: const MovieOverview(),
                        failure: Center(
                          child: Text(AppLocalizations.of(context).somethingWentWrong),
                        ),
                        loading: const Expanded(child: Indicator()),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

part of '../movie_details_page.dart';

class MovieDetailsView extends StatefulWidget {
  final int id;
  const MovieDetailsView({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<MovieDetailsBloc>().add(MovieDetailsFetched(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(builder: (context, state) {
        switch (state.status) {
          case Status.success:
            return _success(state.movie!);
          case Status.failure:
            return Center(
              child: Text(AppLocalizations.of(context).somethingWentWrong),
            );
          default:
            return const Indicator();
        }
      }),
    );
  }

  Widget _success(MovieDetails movie) {
    return Center(
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
                  const MovieOverview(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

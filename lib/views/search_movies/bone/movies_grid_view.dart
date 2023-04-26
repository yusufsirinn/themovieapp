part of '../search_movies_page.dart';

class MoviesGridView extends StatelessWidget {
  final ScrollController scrollController;
  const MoviesGridView({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.read<SearchMoviesBloc>().state;
    var count = state.movies.length;
    if (!state.hasMax) count++;
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: GridView.builder(
          padding: AppPadding.medium.all,
          gridDelegate: _moviesGridViewDelegate,
          controller: scrollController,
          itemCount: count,
          itemBuilder: ((context, index) {
            if (index >= state.movies.length) {
              return const Indicator();
            } else {
              return MovieGridTile(movie: state.movies[index]);
            }
          }),
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount get _moviesGridViewDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2 / 3,
    );
  }
}

part of '../search_movies_page.dart';

class MovieGridTile extends StatelessWidget {
  final Movie movie;
  const MovieGridTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = context.theme.textTheme;
    return GestureDetector(
      onTap: () {
        AppNavigator.instance.go(MovideDetailsPage(movieDetails: movie.toMovieDetail()));
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(child: TMDBImage(path: movie.posterPath)),
            Container(
              color: Colors.black45,
              padding: AppPadding.medium.all,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                    Text(
                      movie.title.toString(),
                      style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
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

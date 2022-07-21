part of '../home_page.dart';

class MovieGridTile extends StatelessWidget {
  final Movie movie;
  const MovieGridTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(child: TMDBImage(path: movie.posterPath)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.voteAverage.toString()),
                Text(
                  movie.title.toString(),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of '../search_movies_page.dart';

class MovieGridTile extends StatelessWidget {
  final Movie movie;
  const MovieGridTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (movie.id != null) {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => MovideDetailsPage(id: movie.id!))));
        }
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(child: TMDBImage(path: movie.posterPath)),
            Container(
              color: Colors.black45,
              padding: AppPadding.medium.value(),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.headline6?.copyWith(color: Colors.white),
                    ),
                    Text(
                      movie.title.toString(),
                      style: textTheme.caption?.copyWith(color: Colors.white),
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

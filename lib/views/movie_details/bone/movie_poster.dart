part of '../movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var movie = context.read<MovieDetailsBloc>().state.movie;
    return SizedBox(
      width: size.width * .3,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            TMDBImage(path: movie?.posterPath),
            Container(
              margin: AppPadding.large.value(),
              width: AppSize.xxl.value(),
              height: AppSize.xxl.value(),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.center,
              child: Text(movie?.voteAverage.toString() ?? ''),
            )
          ],
        ),
      ),
    );
  }
}

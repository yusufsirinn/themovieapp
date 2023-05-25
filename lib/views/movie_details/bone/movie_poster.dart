part of '../movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  final MovieDetails movieDetails;

  const MoviePoster({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.msize.width * .3,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            TMDBImage(path: movieDetails.posterPath),
            Container(
              margin: AppPadding.large.all,
              width: AppDimension.xxl.size,
              height: AppDimension.xxl.size,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.center,
              child: Text(movieDetails.vote),
            )
          ],
        ),
      ),
    );
  }
}

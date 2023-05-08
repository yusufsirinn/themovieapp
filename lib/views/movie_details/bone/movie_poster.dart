part of '../movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  final String? posterPath;
  final num? voteAverage;

  const MoviePoster({
    Key? key,
    required this.posterPath,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = context.msize;
    return SizedBox(
      width: size.width * .3,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            TMDBImage(path: posterPath),
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
              child: Text(voteAverage?.toString() ?? ''),
            )
          ],
        ),
      ),
    );
  }
}

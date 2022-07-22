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
      child: TMDBImage(path: movie?.posterPath),
    );
  }
}

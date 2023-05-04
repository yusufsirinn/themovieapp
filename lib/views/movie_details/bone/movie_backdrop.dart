part of '../movie_details_page.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movie = context.watch<MovieDetailsBloc>().state.movie;
    var size = context.msize;

    return Stack(
      children: [
        SizedBox.fromSize(size: size, child: TMDBImage(path: movie?.backdropPath)),
        SizedBox.fromSize(size: size, child: const ColoredBox(color: Colors.black38))
      ],
    );
  }
}

part of '../movie_details_page.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movie = context.watch<MovieDetailsBloc>().state.movie;
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: TMDBImage(path: movie?.backdropPath),
        ),
        SizedBox(
          width: size.width,
          height: size.height,
          child: const ColoredBox(color: Colors.black38),
        )
      ],
    );
  }
}

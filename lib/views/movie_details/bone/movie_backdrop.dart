part of '../movie_details_page.dart';

class MovieBackdrop extends StatelessWidget {
  final String? backdropPath;

  const MovieBackdrop({Key? key, required this.backdropPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.fromSize(size: context.msize, child: TMDBImage(path: backdropPath)),
        SizedBox.fromSize(size: context.msize, child: const ColoredBox(color: Colors.black38))
      ],
    );
  }
}

part of '../movie_details_page.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movie = context.read<MovieDetailsBloc>().state.movie;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              movie?.overview ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            AppDimension.m.height,
            for (var genre in movie?.genres ?? [])
              Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Colors.white,
                    size: AppDimension.s.size,
                  ),
                  AppDimension.s.width,
                  Text(
                    genre.name ?? '',
                    style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

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
            SizedBox(height: AppSize.m.value()),
            for (var genre in movie?.genres ?? [])
              Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Colors.white,
                    size: AppSize.s.value(),
                  ),
                  SizedBox(width: AppSize.s.value()),
                  Text(
                    genre.name ?? '',
                    style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

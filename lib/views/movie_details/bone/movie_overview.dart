part of '../movie_details_page.dart';

class MovieOverview extends StatelessWidget {
  final String? overview;
  final List<String?>? names;
  const MovieOverview({
    super.key,
    required this.overview,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              overview ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            AppDimension.m.height,
            for (var name in names ?? [])
              Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Colors.white,
                    size: AppDimension.s.size,
                  ),
                  AppDimension.s.width,
                  Text(
                    name ?? '',
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

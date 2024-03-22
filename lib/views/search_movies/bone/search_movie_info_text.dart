part of '../search_movies_page.dart';

class SearchMoviesInfoText extends StatelessWidget {
  final String? text;
  const SearchMoviesInfoText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text ?? '',
          style: context.theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

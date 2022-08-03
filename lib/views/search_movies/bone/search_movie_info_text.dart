part of '../search_movies_page.dart';

class SearchMoviesInfoText extends StatelessWidget {
  final String? text;
  const SearchMoviesInfoText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ));
  }
}

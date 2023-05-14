part of '../search_movies_page.dart';

class SearchMoviesTextField extends StatefulWidget {
  final void Function(String) onChange;
  final int minLengthForWordToSearch;

  const SearchMoviesTextField({
    Key? key,
    required this.onChange,
    this.minLengthForWordToSearch = 2,
  }) : super(key: key);

  @override
  State<SearchMoviesTextField> createState() => _SearchMoviesTextFieldState();
}

class _SearchMoviesTextFieldState extends State<SearchMoviesTextField> with DebounceMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.large.all,
      child: TextField(
        key: const ValueKey(SearchMoviesTextField),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: context.tr.query,
          focusColor: Colors.grey,
          focusedBorder: _border(),
          border: _border(),
        ),
        onChanged: _onChanged,
      ),
    );
  }

  OutlineInputBorder _border() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );
  }

  void _onChanged(String value) {
    debounce(
      () {
        if (value.length >= widget.minLengthForWordToSearch) {
          widget.onChange(value);
          Analytics.log(event: Event.movieSearched, parameters: EventParameter(value: value));
        }
      },
    );
  }
}

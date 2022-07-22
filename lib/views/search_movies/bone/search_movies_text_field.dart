part of '../search_movies_page.dart';

class SearchMoviesTextField extends StatelessWidget with DebounceMixin {
  final void Function(String) onChange;
  final int minLengthForWordToSearch;

  SearchMoviesTextField({Key? key, required this.onChange, this.minLengthForWordToSearch = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.large.value(),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).query,
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

  _onChanged(String value) {
    debounce(
      () {
        if (value.length >= minLengthForWordToSearch) {
          onChange(value);
        }
      },
    );
  }
}

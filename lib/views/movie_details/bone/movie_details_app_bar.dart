part of '../movie_details_page.dart';

class MovieDetailsAppBar extends AppBar {
  MovieDetailsAppBar({String? title, Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(title ?? ''),
        );
}

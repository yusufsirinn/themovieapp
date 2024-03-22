part of '../movie_details_page.dart';

class MovieDetailsAppBar extends AppBar {
  MovieDetailsAppBar({String? title, super.key})
      : super(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(title ?? ''),
        );
}

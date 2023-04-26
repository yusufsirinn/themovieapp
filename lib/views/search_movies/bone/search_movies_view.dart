part of '../search_movies_page.dart';

class SearchMoviesView extends StatefulWidget {
  const SearchMoviesView({Key? key}) : super(key: key);

  @override
  State<SearchMoviesView> createState() => _SearchMoviesViewState();
}

class _SearchMoviesViewState extends State<SearchMoviesView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  _onScroll() {
    if (isBottom) {
      context.read<SearchMoviesBloc>().add(const MoreMovies());
    }
  }

  bool get isBottom {
    if (!_scrollController.hasClients) return false;
    var maxScroll = _scrollController.position.maxScrollExtent;
    var currentScroll = _scrollController.offset;
    return currentScroll == maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SearchMoviesTextField(
              onChange: (value) {
                context.read<SearchMoviesBloc>().add(SearchMovies(query: value));
                _scrollController.jumpToTop();
              },
            ),
            BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
              builder: (context, state) {
                return ViewStateWidget(
                  status: state.status,
                  initial: SearchMoviesInfoText(text: context.tr.searchMovie),
                  loading: const Expanded(child: Indicator()),
                  success: MoviesGridView(scrollController: _scrollController),
                  failure: SearchMoviesInfoText(text: context.tr.somethingWentWrong),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

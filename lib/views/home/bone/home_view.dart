part of '../home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with DebounceMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (isBottom) {
      context.read<SearchMoviesBloc>().add(const MoviesPagination());
    }
  }

  bool get isBottom {
    if (!_scrollController.hasClients) return false;
    var maxScroll = _scrollController.position.maxScrollExtent;
    var currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: TextField(onChanged: (value) {
              debounce(() {
                context.read<SearchMoviesBloc>().add(SearchMoviesQuery(query: value));
                _scrollController.jumpTo(0);
              });
            }),
          ),
          BlocBuilder<SearchMoviesBloc, SearchMoviesState>(builder: (context, state) {
            switch (state.status) {
              case Status.failure:
                return const Center(
                  child: Text('Bir hata oluştu!'),
                );
              case Status.success:
                return _success(state);
              case Status.loading:
                return _success(state);
              default:
                return const Indicator();
            }
          }),
        ],
      ),
    );
  }

  Widget _success(SearchMoviesState state) {
    var count = state.movies.length;
    if (!state.hasMax) count++;
    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: count,
          itemBuilder: ((context, index) {
            if (index >= state.movies.length) {
              return const Indicator();
            } else {
              return MovieGridTile(movie: state.movies[index]);
            }
          }),
        ),
      ),
    );
  }
}

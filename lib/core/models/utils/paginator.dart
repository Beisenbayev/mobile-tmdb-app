class PaginatorResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;

  PaginatorResult({
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });
}

class Paginator<T> {
  final List<T> _data = [];
  int _currentPageIndex = 0;
  int _totalPageCount = 1;
  bool _isLoadingInProgress = false;
  final Future<PaginatorResult<T>> Function(int) _loader;

  List<T> get data => _data;

  Paginator(this._loader);

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPageIndex >= _totalPageCount) {
      _data.clear();
      return;
    }

    _isLoadingInProgress = true;
    final nextPageIndex = _currentPageIndex + 1;

    try {
      final result = await _loader(nextPageIndex);
      _currentPageIndex =
          result.currentPage == 0 ? nextPageIndex : result.currentPage;
      _totalPageCount = result.totalPages;
      _data.clear();
      _data.addAll(result.data);
    } catch (_) {
    } finally {
      _isLoadingInProgress = false;
    }
  }

  void reset() {
    _currentPageIndex = 0;
    _totalPageCount = 1;
    _isLoadingInProgress = false;
    _data.clear();
  }
}

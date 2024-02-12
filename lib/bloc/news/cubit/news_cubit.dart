import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/api/models/news/article.dart';
import 'package:nasa_api_app/api/models/news/paginated_article_list.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final List<Article> loadedArticles = [];
  void getNews(int currentPage, int pageSize, String? paginationUrl) async {
    try {
      PaginatedArticleList news = paginationUrl != null
          ? await ApiRepository().getNewsPaginated(paginationUrl)
          : await ApiRepository().getInitialNews(currentPage, pageSize);
      loadedArticles.addAll(news.results);
      news.results = loadedArticles;
      emit(NewsLoaded(news));
    } catch (error) {
      emit(NewsError(error));
    }
  }
}

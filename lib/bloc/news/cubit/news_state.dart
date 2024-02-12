part of 'news_cubit.dart';

@immutable
sealed class NewsState {
  const NewsState();
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final PaginatedArticleList paginatedNews;
  const NewsLoaded(this.paginatedNews);
  @override
  List<Object> get props => [paginatedNews];
}

final class NewsError extends NewsState {
  final Object error;
  const NewsError(this.error);
  @override
  List<Object> get props => [error];
}

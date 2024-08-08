part of 'search_bloc_cubit.dart';

@immutable
sealed class SearchBlocState {}

final class SearchBlocInitial extends SearchBlocState {}


final class SearchBlocLodaing extends SearchBlocState {}


final class SearchBlocsucsses extends SearchBlocState {

  SearchModel Proudacts;

  SearchBlocsucsses({required this.Proudacts});
}



final class SearchBlocfaliur extends SearchBlocState {
  String errorMasege;
  SearchBlocfaliur({required this.errorMasege});
}

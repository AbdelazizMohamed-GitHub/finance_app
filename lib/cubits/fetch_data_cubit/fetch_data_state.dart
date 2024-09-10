part of 'fetch_data_cubit.dart';

@immutable
sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}
final class FetchDataLoading extends FetchDataState {}
final class FetchDataSuccess extends FetchDataState {
  final List<FinanceModel> list;
  FetchDataSuccess({required this.list});
}
final class FetchDataFailure extends FetchDataState {
  final String error;
  FetchDataFailure({required this.error});
}

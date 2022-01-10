part of 'data_cubit.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoaded extends DataState {
  // final Data datas;
  final List<Data> datas;

  DataLoaded(this.datas);

  @override
  List<Object> get props => [datas];
}

class DataLoadingFailed extends DataState {
  final String message;

  DataLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

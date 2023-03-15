import 'package:bloc/bloc.dart';

class Counter extends Cubit{
  Counter({this.num = 0}) : super(num);

  int num;

  void incrementData(){
    emit(state+1);
  }

  void decrementData(){
    emit(state-1);
  }

  @override
  void onChange(Change change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
import 'package:basketball_points_counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(initialState());

  int teamAScore = 0;

  int teamBScore = 0;



  void TeamAIncrement(int buttonNumber){
    teamAScore += buttonNumber;
    emit(CounterAIncrementState());
  }

  void TeamBIncrement(int buttonNumber){
    teamBScore += buttonNumber;
    emit(CounterBIncrementState());
  }

  void ResetPoint(){
    teamAScore = 0;
    teamBScore = 0;
    emit(initialState());
  }
}
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  var lastLocationHistory=<Map<String, double>>[];
  double a =0.0;
  double b =0.0;

  HomeBloc() :super(HomeInitialState()){
    on<HomeSendPositionEvent>(_sendUserAPosition);
    on<HomeReceivePositionEvent>(_getUserBPosition);
  }




  FutureOr<void> _sendUserAPosition(HomeSendPositionEvent event, Emitter<HomeState> emit)async {

  }

  FutureOr<void> _getUserBPosition(HomeReceivePositionEvent event, Emitter<HomeState> emit) async{
    emit(HomeInitialState());

    var receivedData = await Future.delayed(Duration(seconds: 5));
    a=10.0;
    b=20.0;

    lastLocationHistory.add({
      "lat":a,
      "lan":b
    });

    emit(HomeLoadedState(a, b, lastLocationHistory));
  }
}
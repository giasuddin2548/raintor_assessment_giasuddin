import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/user_tracking_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final UserTrackingUseCase _userTrackingUseCase;
  var lastLocationHistory=<Map<String, double>>[];
  double a =0.0;
  double b =0.0;

  HomeBloc(this._userTrackingUseCase) :super(HomeInitialState()){
    on<HomeSendPositionEvent>(_sendUserAPosition);
    on<HomeReceivePositionEvent>(_getUserBPosition);
  }




  FutureOr<void> _sendUserAPosition(HomeSendPositionEvent event, Emitter<HomeState> emit)async {

  }

  FutureOr<void> _getUserBPosition(HomeReceivePositionEvent event, Emitter<HomeState> emit) async{
    emit(HomeInitialState());

    var receivedData = await _userTrackingUseCase.getUserBPosition();

    a=receivedData.lat??0.0;
    b=receivedData.lon??0.0;

    lastLocationHistory.add({
      "lat":a,
      "lan":b
    });

    emit(HomeLoadedState(a, b, lastLocationHistory));
  }
}
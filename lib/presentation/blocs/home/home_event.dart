

import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{}

class HomeSendPositionEvent extends HomeEvent{

  double currentLat;
  double currentLan;
  HomeSendPositionEvent(this.currentLat, this.currentLan);

  @override
  List<Object?> get props => [];
}


class HomeReceivePositionEvent extends HomeEvent{


  @override
  List<Object?> get props => [];
}


import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{}

class HomeInitialState extends HomeState{

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{

 @override
 List<Object?> get props => [];
}

class HomeLoadedState extends HomeState{

 double lastLat;
 double lastLan;
 List<Map<String, double>> historyList;

 HomeLoadedState(this.lastLat, this.lastLan, this.historyList);

 @override
 List<Object?> get props => [];
}

class HomeErrorState extends HomeState{
 String msg;
 HomeErrorState(this.msg);
 @override
 List<Object?> get props => [msg];
}

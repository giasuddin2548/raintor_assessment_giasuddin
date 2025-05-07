import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/UserBResponse.dart';
import '../../../domain/use_cases/user_tracking_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserTrackingUseCase _userTrackingUseCase;

  final List<Map<String, double>> lastLocationHistory = [];
  StreamSubscription<UserBResponse>? _subscription;

  HomeBloc(this._userTrackingUseCase) : super(HomeInitialState()) {
    on<HomeSendPositionEvent>(_sendUserAPosition);
    on<HomeReceivePositionEvent>(_listenToUserBPositions);
  }
  
  
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> _listenToUserBPositions(HomeReceivePositionEvent event, Emitter<HomeState> emit) async {
    print("Bloc received : ");
    await _subscription?.cancel();
    emit(HomeLoadingState());
    _subscription = _userTrackingUseCase.getUserBStream().listen((data) {
      final lat = data.lat ?? 0.0;
      final lon = data.lon ?? 0.0;
      print("Bloc received : ${data.lat}");

      lastLocationHistory.add({"lat": lat, "lan": lon});
      emit(HomeLoadedState(lat, lon, List.from(lastLocationHistory)));
    });
  }

  Future<void> _sendUserAPosition(HomeSendPositionEvent event, Emitter<HomeState> emit) async{
    await _userTrackingUseCase.sendUserALocation(event.currentLat, event.currentLan);
  }
}

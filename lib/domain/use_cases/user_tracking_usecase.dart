
import '../entities/UserBResponse.dart';
import '../repositories/user_tracker_repo.dart';

class UserTrackingUseCase{
  final UserTrackerRepo _userTrackerRepo;

  UserTrackingUseCase(this._userTrackerRepo);


  Future<String> sendUserALocation(double lat, double lan) async{
    return await _userTrackerRepo.sendUserAData(lat, lan);
  }


  Stream<UserBResponse> getUserBStream() {
    return _userTrackerRepo.getUserBData();
  }


}

import 'package:raintor_assessment_giasuddin/domain/entities/UserBResponse.dart';

import '../../domain/repositories/user_tracker_repo.dart';
import '../source/socket_client.dart';

class UserTrackerRepoImpl extends UserTrackerRepo{

  SocketClient socketClient;

  UserTrackerRepoImpl(this.socketClient);

  @override
  Stream<UserBResponse> getUserBData() {

    return socketClient.onUserBLocation;
  }

  @override
  Future<String> sendUserAData(double lat, double lan)async {
   var response = await socketClient.sendUserALocation(lat, lan);
   return response;
  }





}


import 'package:raintor_assessment_giasuddin/domain/entities/UserBResponse.dart';

abstract class UserTrackerRepo{

  Future<String> sendUserAData(double lat, double lan);
  Future<UserBResponse> getUserBData();
}
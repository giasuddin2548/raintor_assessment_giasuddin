
import 'package:raintor_assessment_giasuddin/domain/entities/UserBResponse.dart';
import 'package:signalr_netcore/hub_connection.dart';

class SocketClient{
  final HubConnection _hubConnection;
  SocketClient(this._hubConnection);

  Future<UserBResponse> getUserBLocation()async{

      return UserBResponse(lat: 100.0, lon: 200.0);

  }


  Future<String> sendUserALocation()async{

      return '';

  }

}
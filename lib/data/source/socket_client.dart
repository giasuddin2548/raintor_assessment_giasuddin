import 'dart:async';
import 'package:raintor_assessment_giasuddin/domain/entities/UserBResponse.dart';
import 'package:signalr_netcore/hub_connection.dart';


class SocketClient {
  final HubConnection _hubConnection;
  final _receivedLocationController = StreamController<UserBResponse>.broadcast();

  Stream<UserBResponse> get onUserBLocation => _receivedLocationController.stream;

  SocketClient(this._hubConnection) {
    _registerHandlers();
  }

  void _registerHandlers() {

    try{
      _hubConnection.on("ReceiveLatLon", (arguments) {
        if (arguments != null && arguments.isNotEmpty) {
          final data = arguments[0];
          if (data is Map) {
            final lat = data["lat"];
            final lon = data["lon"];
            if (lat is double && lon is double) {
              final response = UserBResponse(lat: lat, lon: lon);
              _receivedLocationController.add(response);
            }
          }
        }
      });
    }catch(e){
      print(e);
    }
  }

  Future<String> sendUserALocation(double lat, double lon) async {
    try {
      await _hubConnection.invoke("SendLatLon", args: [lat, lon]);
      return 'Location sent';
    } catch (e) {
      return 'Error sending location: $e';
    }
  }

  void dispose() {
    _receivedLocationController.close();
  }
}

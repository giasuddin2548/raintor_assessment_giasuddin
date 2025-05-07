import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_bloc.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_state.dart';
import '../../constant/service_locator.dart';
import '../blocs/home/home_event.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (_) =>_getLocation);
  }

  _getLocation()async{

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low
    );
    sl<HomeBloc>().add(HomeSendPositionEvent(position.latitude, position.longitude));
  }

  @override
  Widget build(BuildContext context) {

    // context.read<HomeBloc>().add(HomeReceivePositionEvent());
    // context.read<HomeBloc>().add(HomeSendPositionEvent(41.6145583, 41.5355567));

    return Scaffold(
      appBar: AppBar(title: Text("Home"), actions: [
        IconButton(onPressed: (){
          sl<HomeBloc>().add(HomeReceivePositionEvent());
        }, icon: Icon(Icons.upload))
      ],),
      body: BlocConsumer<HomeBloc, HomeState>(builder: (_, state){

        if(state is HomeLoadedState){
          return ListView.builder(
            itemCount: state.historyList.length,
            itemBuilder: (c,i){
            var d=state.historyList[i];
            return ListTile(title: Text("${d['lat']} - ${d['lan']}"));
          });
        }else{
          return Text("No Data found");
        }

      }, listener: (_, state){

      }),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

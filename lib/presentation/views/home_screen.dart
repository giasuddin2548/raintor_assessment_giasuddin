import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_bloc.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_state.dart';

import '../blocs/home/home_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    context.read<HomeBloc>().add(HomeReceivePositionEvent());

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
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

}

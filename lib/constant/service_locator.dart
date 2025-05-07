
import 'package:get_it/get_it.dart';
import 'package:raintor_assessment_giasuddin/data/source/socket_client.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_bloc.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../data/repositories/user_tracker_repo_impl.dart';
import '../domain/repositories/user_tracker_repo.dart';
import '../domain/use_cases/user_tracking_usecase.dart';

final sl = GetIt.instance;

Future<void> setup() async {

  final String hubUrl = "https://raintor-api.devdata.top/hub";
  final httpOptions = HttpConnectionOptions();
  HubConnection client = HubConnectionBuilder()
      .withUrl(hubUrl, options: httpOptions)
      .build();



  sl.registerSingleton<HubConnection>(client);
  sl.registerSingleton<SocketClient>(SocketClient(sl()));
  sl.registerLazySingleton<UserTrackerRepo>(()=>UserTrackerRepoImpl(sl()));
  sl.registerLazySingleton<UserTrackingUseCase>(()=>UserTrackingUseCase(sl()));

  sl.registerFactory<HomeBloc>(()=>HomeBloc(sl()));

}



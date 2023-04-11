import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription<ConnectivityResult> connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    //checkInternet();
    monitorSubscription();
  }
  void monitorSubscription() async {
    connectivityStreamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        emit(const InternetConnected(connectionType: ConnectionType.wifi));
      } else if (result == ConnectivityResult.mobile) {
        emit(const InternetConnected(connectionType: ConnectionType.mobile));
      } else if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else {
        emit(InternetDisconnected());
      }
    });
  }
  //Be sure to cancel subscription after you are done

  void dispose() {
    connectivityStreamSubscription.cancel();
  }
}

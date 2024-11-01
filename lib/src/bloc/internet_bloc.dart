import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
 StreamSubscription? _subscription;
  InternetBloc() : super(InternetInitial()) {
   
    on<InternetEvent>((event, emit) {
      if(event is ConnectedEvent){
        emit(ConnectedState(msg: "connected"));
      }
      else if(event is NotConnectedEvent){
        emit(NotConnectedState(msg: "Not Connected to internet"));
      }
    });
  _subscription=Connectivity().onConnectivityChanged.listen(( result){
    if(result.contains(ConnectivityResult.mobile)||result.contains(ConnectivityResult.wifi)||result.contains(ConnectivityResult.vpn)){
      add(ConnectedEvent());
    }else{
      add(NotConnectedEvent());
    }

  });

  }
  @override
  Future<void> close() {
     _subscription!.cancel();
    return super.close();
  }
  
}

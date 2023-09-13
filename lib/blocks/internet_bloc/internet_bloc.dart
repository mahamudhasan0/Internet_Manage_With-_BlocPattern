import 'dart:async';
import 'package:blocpractice/blocks/internet_bloc/internet_event.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<internetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InitialState()){
   on<internetOnEvent>((event, emit) => emit(InternetOnState()));
   on<internetOffEvent>((event, emit) => emit(InternetOffState()));

   connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
     if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
       add(internetOnEvent());
     }else{
       add(internetOffEvent());
     }
   });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
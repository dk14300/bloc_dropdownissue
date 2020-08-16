import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/sukumar/StudioProjects/flutter_bloc_app/lib/sevaBlocRepository.dart';

part 'sevadetail_event.dart';
part 'sevadetail_state.dart';

class SevadetailBloc extends Bloc<SevadetailEvent, SevadetailState> {
  final  SevaBlocRepository _sevablocrepository;


  SevadetailBloc({SevaBlocRepository sevablocrepository})
      : _sevablocrepository = sevablocrepository, super();

  final RegExp _nameRegExp = RegExp(
    r'^[a-zA-Z]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  final RegExp _gothramRegExp = RegExp(
    r'^[a-zA-Z0-9.]+[a-zA-Z]',
  );


  @override
  SevadetailState get initialState => SevadetailState.initial();

    @override
  void onTransition(Transition<SevadetailEvent, SevadetailState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  bool _isnameValid(String name) {
    return _nameRegExp.hasMatch(name);
  }

  bool _isgothramValid(String gothram) {
    return _gothramRegExp.hasMatch(gothram);
  }


  @override
  Stream<SevadetailState> mapEventToState(
    SevadetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is nameChanged) {
      yield state.copyWith(
        name: event.name,
        isnameValid: _isnameValid(event.name),
      );
    }
    if (event is gothramChanged) {
      yield state.copyWith(
        gothram: event.gothramname,
        isgothramValid: _isgothramValid(event.gothramname),
      );
    }
    if (event is NewSevaFormLoaded) {
      yield* _mapNewSevaFormLoadedToState();
    } else if (event is NewSevaModelChanged) {
      yield* _mapNewSevaDetailBrandChangedToState(event, state);
    } else if (event is NewSevadetailModelChanged) {
      yield* _mapNewSevaTimingsChangedToState(event, state);
    } else if (event is NewSevaTimingsChanged) {
      yield* _mapNewRatesChangedToState(event, state);
    } else if (event is NewTimeYearChanged) {
      yield _mapNewRateCotrollerChangedToState(event);
    }
  }

    Stream<SevadetailState> _mapNewSevaFormLoadedToState() async* {
      yield SevadetailState.brandsLoadInProgress();
      final sevas = await _sevablocrepository.fetchSeva();
      yield SevadetailState.brandsLoadSuccess(sevasstate: sevas);
    }

    Stream<SevadetailState> _mapNewSevaDetailBrandChangedToState(
        NewSevaModelChanged event,
        SevadetailState state,
        ) async* {
      yield SevadetailState.modelsLoadInProgress(
        sevasstate: state.sevas,
        seva: event.seva,
      );
      final sevadetail = await _sevablocrepository.fetchSevadetails(seva: event.seva);
      yield SevadetailState.modelsLoadSuccess(
        sevasstate: state.sevas,
        seva: event.seva,
        sevadetails: sevadetail,
      );
    }

    Stream<SevadetailState> _mapNewSevaTimingsChangedToState(NewSevadetailModelChanged event,
        SevadetailState state,)async*{
      yield SevadetailState.sevadetailLoadInProgress(
        sevasstate: state.sevas,
        seva: state.seva,
        sevadetails: state.sevadetails,
        sevadetail: event.sevadetail,
      );
      final timings = await _sevablocrepository.fetchTimings(
        seva: state.seva,
        sevadetail:event.sevadetail,
      );
      yield SevadetailState.timeLoadSucess(
          sevasstate:state.sevas,
          seva:state.seva,
          sevadetails:state.sevadetails,
          sevadetail:state.sevadetailed,
          timings:timings,
      );
    }

    Stream<SevadetailState> _mapNewRatesChangedToState(NewSevaTimingsChanged event,SevadetailState state,)async*{
      yield SevadetailState.timingsLoadProgress(
        sevasstate: state.sevas,
        seva: state.seva,
        sevadetails: state.sevadetails,
        sevadetail: state.sevadetailed,
        times: state.times,
        time:event.timings,
      );
      final rates = await _sevablocrepository.fetchTimingswiserate(
        seva:state.seva,
        sevadetail:state.sevadetailed,
        time:event.timings,
      );
      yield SevadetailState.rateLoadSucess(
        sevasstate:state.sevas,
        seva:state.seva,
        sevadetails:state.sevadetails,
        sevadetail:state.sevadetailed,
        times:state.times,
        time: state.time,
        rates: rates,
      );

    }
    SevadetailState _mapNewRateCotrollerChangedToState(NewTimeYearChanged event){
        return state.copyWith(rate : event.rate);
    }



}
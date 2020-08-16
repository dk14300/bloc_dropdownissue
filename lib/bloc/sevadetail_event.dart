part of 'sevadetail_bloc.dart';

abstract class SevadetailEvent extends Equatable {
    @override
  List<Object> get props => [];
  const SevadetailEvent();
}

class NewSevaFormLoaded extends SevadetailEvent {}

class NewSevaTimingsChanged extends SevadetailEvent {
  const NewSevaTimingsChanged({this.timings});

  final String timings;
}

class NewSevaModelChanged extends SevadetailEvent {
  const NewSevaModelChanged({this.seva});

  final String seva;
}

class NewSevadetailModelChanged extends SevadetailEvent {
  const NewSevadetailModelChanged({this.sevadetail});

  final String sevadetail;
}


class NewTimeYearChanged extends SevadetailEvent {
  const NewTimeYearChanged({this.rate});

  final String rate;
}




class nameChanged extends SevadetailEvent {
  final String name;

  const nameChanged({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'nameChanged { name: $name }';
}


class gothramChanged extends SevadetailEvent {
  final String gothramname;

  const gothramChanged({@required this.gothramname});

  @override
  List<Object> get props => [gothramname];

  @override
  String toString() => 'nameChanged { name: $gothramname }';
}

class ssevadetailChanged extends SevadetailEvent {
  final String ssevadetail;

  const ssevadetailChanged({this.ssevadetail});
}



class FormSubmitted extends SevadetailEvent {}

class FormReset extends SevadetailEvent {}

class FormLoaded extends SevadetailEvent {}

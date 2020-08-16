part of 'sevadetail_bloc.dart';

class SevadetailState extends Equatable {

  final String name;
  final bool isnameValid;
  final String gothram;
  final bool isgothramValid;
  final DateTime date;
  final String value;
  final bool isvalue;
  final String buttonvalue;
  final bool isbuttonvalue;
  final bool formSubmittedSuccessfully;
  final String rate;
  final String seva;
  final String time;
  final String sevadetailed;
  final List<String> rates;
  final List<String> sevas;
  final List<String> times;
  final List<String> sevadetails;


  bool get isComplete => seva != null && rate != null && time != null && sevadetailed != null;


  SevadetailState( { this.name, this.gothram, this.date, this.value,this.rate, this.seva, this.time,this.rates, this.sevas, this.times,this.sevadetails,this.sevadetailed,
    this.buttonvalue,this.isnameValid, this.isgothramValid, this.isvalue, this.isbuttonvalue,this.formSubmittedSuccessfully,});

   SevadetailState.brandsLoadInProgress()
      : this(
    sevas: const <String>[],
    seva: null,
    times: const <String>[],
    time: null,
    sevadetails: const <String>[],
    sevadetailed: null,
    rates:const <String>[],
    rate:null,
  );


   SevadetailState.brandsLoadSuccess({@required List<String> sevasstate})
      : this(
    sevas: sevasstate,
    seva: null,
    times: const <String>[],
    time: null,
    sevadetails: const <String>[],
    sevadetailed: null,
    rates: const <String>[],
    rate: null,
  );

  SevadetailState.modelsLoadInProgress({
    @required List<String> sevasstate,
    @required String seva,
  }) : this(
    sevas:sevasstate,
    seva: seva,
    times: const <String>[],
    time: null,
    sevadetails: const <String>[],
    sevadetailed: null,
    rates: const <String>[],
    rate: null,
  );


  SevadetailState.modelsLoadSuccess({
    @required List<String> sevasstate,
    @required String seva,
    @required List<String> sevadetails,
}) : this(
   sevas:sevasstate,
    seva:seva,
    sevadetails: sevadetails,
    sevadetailed: null,
    times:const <String>[],
    time:null,
    rates: const <String>[],
    rate: null,
  );

  SevadetailState.sevadetailLoadInProgress({
    @required List<String> sevasstate,
    @required String seva,
    @required List<String> sevadetails,
    @required String sevadetail,
  }) : this(
    sevas:sevasstate,
    seva:seva,
    sevadetails: sevadetails,
    sevadetailed: sevadetail,
    times:const <String>[],
    time:null,
    rates: const <String>[],
    rate: null,
  );


  SevadetailState.timeLoadSucess({
    @required List<String> sevasstate,
    @required String seva,
    @required List<String> sevadetails,
    @required String sevadetail,
    @required List<String> timings,
  }) : this(
    sevas:sevasstate,
    seva:seva,
    sevadetails: sevadetails,
    sevadetailed: sevadetail,
    times:timings,
    time:null,
    rates: const <String>[],
    rate: null,
  );

  SevadetailState.timingsLoadProgress({
    @required List<String> sevasstate,
    @required String seva,
    @required List<String> sevadetails,
    @required String sevadetail,
    @required List<String> times,
    @required String time,
  }) : this(
    sevas:sevasstate,
    seva:seva,
    sevadetails: sevadetails,
    sevadetailed: sevadetail,
    times:times,
    time:time,
    rates: const <String>[],
    rate: null,
  );

  SevadetailState.rateLoadSucess({
    @required List<String> sevasstate,
    @required String seva,
    @required List<String> sevadetails,
    @required String sevadetail,
    @required List<String> times,
    @required String time,
    @required List<String> rates,
  }) : this(
    sevas:sevasstate,
    seva:seva,
    sevadetails: sevadetails,
    sevadetailed: sevadetail,
    times:times,
    time:time,
    rates:rates,
    rate: null,
  );



  factory SevadetailState.initial() {
    return SevadetailState(name:'',gothram:'',date:DateTime.parse("1969-07-20 20:18:04Z"),value: '',buttonvalue:'',isnameValid: false,isgothramValid: false,isvalue: false,isbuttonvalue: false,formSubmittedSuccessfully: false,rates:const<String>[],rate:null,times:const<String>[],time:null,sevas : const <String>[], seva:null,sevadetails : const <String>[], sevadetailed:null,);}


  @override
  String toString() {
    return 'SevadetailState{name: $name, isnameValid: $isnameValid, gothram: $gothram, isgothramValid: $isgothramValid, date: $date, value: $value, isvalue: $isvalue, buttonvalue: $buttonvalue, isbuttonvalue: $isbuttonvalue, formSubmittedSuccessfully: $formSubmittedSuccessfully, rate: $rate, seva: $seva, time: $time, rates: $rates, sevas: $sevas, times: $times}';
  }


  @override
  List<Object> get props => [name,isnameValid,gothram,isgothramValid,date,value,buttonvalue,isvalue,isbuttonvalue,rate!=null && seva != null && time != null,];

  SevadetailState copyWith({
    String name,String gothram,DateTime date,String value,String buttonvalue, bool isnameValid, isgothramValid,List<String> sevadetail,
    String ssevadetail,final String rate,final String seva,final String time,final String sevadetailed,final List<String> rates,final List<String> sevas,final List<String> times,final List<String> sevadetails,
  }) {
    return SevadetailState(
      name: name??this.name,
      isnameValid: isnameValid??this.isnameValid,
      gothram: gothram??this.gothram,
      isgothramValid: isgothramValid??this.isgothramValid,
      date: date??this.date,
      value: value??this.value,
      isvalue: value??this.isvalue,
      buttonvalue: buttonvalue??this.buttonvalue,
      isbuttonvalue: buttonvalue??this.isbuttonvalue,
      rate:rate??this.rate,
      seva:seva??this.seva,
      time:time??this.time,
      sevadetailed:sevadetailed??this.sevadetailed,
      rates:rates??this.rates,
      sevas:sevas??this.sevas,
      times:times??this.times,
      sevadetails:sevadetails??this.sevadetails,
    );
  }
}
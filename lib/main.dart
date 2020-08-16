import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/sukumar/StudioProjects/flutter_bloc_app/lib/sevaBlocRepository.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'bloc/sevadetail_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (_) => SevadetailBloc(sevablocrepository: SevaBlocRepository())..add(FormLoaded()),
              child: MyHomePage(),
            ),
        ),
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate;
  Razorpay _razorpay;



  // String value = 'usa'; Don't use value which doesn't exist in dropdown list
  String value; //Better to initialize with null

  String buttonvaluetext = '';

  String sevadetailtext = '', buttonvalue1 = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gothramController = TextEditingController();
  SevadetailBloc _sevadetailBloc;

  void _onnameChanged() {
    _sevadetailBloc.add(nameChanged(name: _nameController.text));
  }

  void _ongothramChanged() {
    _sevadetailBloc.add(gothramChanged(gothramname: _gothramController.text));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sevadetailBloc = BlocProvider.of<SevadetailBloc>(context);
    _nameController.addListener(_onnameChanged);
    _gothramController.addListener(_ongothramChanged);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void _onSevaModelChanged(String seva) =>
        context.bloc<SevadetailBloc>().add(NewSevaModelChanged(seva: seva));

    void _onSevadetailChanged(String sevadetail) =>
        context.bloc<SevadetailBloc>().add(NewSevadetailModelChanged(sevadetail: sevadetail));

    void _onTimeChanged(String timings) =>
        context.bloc<SevadetailBloc>().add(NewSevaTimingsChanged(timings: timings));

    void _onRateChanged(String rate) =>
        context.bloc<SevadetailBloc>().add(NewTimeYearChanged(rate: rate));

    void _onFormSubmitted({String seva, String sevadetail, String timings,String rate}) {
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Submitted $seva $sevadetail $timings $rate')),
        );
    }




    // TODO: implement build
    return BlocBuilder<SevadetailBloc, SevadetailState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your username'),
            ),
            TextFormField(
              controller: _gothramController,
              decoration: InputDecoration(labelText: 'Enter your gothram'),
            ),
            DropdownButton<String>(
              items: state.sevas?.isNotEmpty == true
                  ? state.sevas.map((seva) {
                return DropdownMenuItem(value: seva, child: Text(seva));
              }).toList()
                  : const [],
              value: state.seva,
              hint: Text('Select a seva'),
              onChanged: _onSevaModelChanged,
            ),
            DropdownButton<String>(
              items: state.sevadetails?.isNotEmpty == true
                  ? state.sevadetails.map((sevadetailed) {
                return DropdownMenuItem(value: sevadetailed, child: Text(sevadetailed));
              }).toList()
                  : const [],
              value: state.sevadetailed,
              hint: Text('Select a sevadetailed'),
              onChanged: _onSevadetailChanged,
            ),
            DropdownButton<String>(
              items: state.times?.isNotEmpty == true
                  ? state.times.map((time) {
                return DropdownMenuItem(value: time, child: Text(time));
              }).toList()
                  : const [],
              value: state.time,
              hint: Text('Select a time'),
              onChanged: _onTimeChanged,
            ),
            DropdownButton<String>(
              items: state.rates?.isNotEmpty == true
                  ? state.rates.map((rate) {
                return DropdownMenuItem(value: rate, child: Text(rate));
              }).toList()
                  : const [],
              value: state.rate,
              hint: Text('Select a rate'),
              onChanged: _onRateChanged,
            ),
              Text(state.rate,),
            RaisedButton(
              onPressed: state.isComplete
                  ? () {
                return _onFormSubmitted(
                  seva: state.seva,
                  sevadetail: state.sevadetailed,
                  timings: state.time,
                  rate: state.rate,
                );
              }
                  : null,
              child: const Text('Submit'),
            ),
            MaterialButton(
              child: Text('$buttonvalue1'),
              shape: Border.all(width: 2.0, color: Colors.redAccent),
              onPressed: () {openCheckout();},
            ),
          ],
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("SUCCESS: " + response.paymentId)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("ERROR: " + response.code.toString() + " - " + response.message,)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("EXTERNAL_WALLET: " + response.walletName)));
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_7Ie8SGczM1KO0d',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }
}
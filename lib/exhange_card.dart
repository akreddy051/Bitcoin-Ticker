import 'package:flutter/material.dart';
class ExchangeCard extends StatelessWidget {
  final String cryptoCurrency;
  final String exChangeRate;
  final String selectedItem;
  ExchangeCard({@required this.cryptoCurrency,@required this.exChangeRate,@required this.selectedItem});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $exChangeRate $selectedItem',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

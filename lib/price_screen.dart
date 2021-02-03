import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'data_of_coins.dart';
import 'exhange_card.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String btc;
  double exchangeRate;
  double ethExchangeRate;
  double ltcExchangeRate;
  String exChangeRate;
  String eTHExchangeRate;
  String lTCExchangeRate;

  String selectedItem='USD';
  BitCoinData bitCoinData=BitCoinData();
  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownMenuItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedItem,
      elevation: 5,
      items: dropDownMenuItems,
      onChanged: (value1) {
        setState((){
          selectedItem = value1;
          loadData();
          loadETHData();
          loadLTCData();
        });
      },
    );
  }


  CupertinoPicker iosPicker(){
    List<Widget> textWidgets = [];
    for (String currency in currenciesList) {
      var newItem = Text(
        currency,
        style: TextStyle(
          color: Colors.white,
        ),
      );
      textWidgets.add(newItem);
    }

    return CupertinoPicker(
      itemExtent: 30.0,
      onSelectedItemChanged: (value) {
        print(value);
      },
      children: textWidgets,
    );
  }

  Future loadData()async{
    var data= await bitCoinData.getApiData('BTC',selectedItem);
    exchangeRate=data['rate'];
    setState(() {
      exChangeRate=exchangeRate.toStringAsFixed(0);
    });
  }
  Future loadETHData()async{
    var data= await bitCoinData.getApiData('ETH',selectedItem);
    ethExchangeRate=data['rate'];
    setState(() {
      eTHExchangeRate=ethExchangeRate.toStringAsFixed(0);
    });
  }
  Future loadLTCData()async{
    var data= await bitCoinData.getApiData('LTC',selectedItem);
    ltcExchangeRate=data['rate'];
    setState(() {
      lTCExchangeRate=ltcExchangeRate.toStringAsFixed(0);
    });
  }
  @override
  void initState() {
    super.initState();
    loadData();
    loadETHData();
    loadLTCData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: ExchangeCard(cryptoCurrency: cryptoList[0],exChangeRate: exChangeRate, selectedItem: selectedItem),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: ExchangeCard(cryptoCurrency: cryptoList[1],exChangeRate: eTHExchangeRate, selectedItem: selectedItem),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: ExchangeCard(cryptoCurrency: cryptoList[2],exChangeRate: lTCExchangeRate, selectedItem: selectedItem),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isAndroid?getDropdownButton():iosPicker(),
          ),
        ],
      ),
    );
  }
}


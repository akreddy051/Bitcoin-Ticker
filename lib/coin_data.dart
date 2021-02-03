import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  Future getBitCoinData(String crypto,String currency)async{
    var curr=currency;
    http.Response response=await http.get('https://rest.coinapi.io/v1/exchangerate/$crypto/$curr?apikey=BAA6A4E3-CEFB-4832-9AEB-F8967FE9D10A');
    // print(response.body);
    print(response.statusCode);
    print(currency);
    var data=response.body;
    return jsonDecode(data);
  }
}

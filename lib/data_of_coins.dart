import 'coin_data.dart';

class BitCoinData{


  Future getApiData(String crypto,String currency) async{

    var data=await CoinData().getBitCoinData(crypto,currency);
    return data;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String SelectedCurrency = 'USD';
  List<DropdownMenuItem> GetDropdownMenu() {
    List<DropdownMenuItem> dropdownMenuItems = [];
    for (String data in CoinData().GetcoinList()) {

      dropdownMenuItems.add(DropdownMenuItem(
          child: Text(data.toString()), value: data.toString()));
    }
    return dropdownMenuItems;
  }
  List<Text> GetText() {
    List<Text> dropdownMenuItems = [];
    for (String data in CoinData().GetcoinList()) {

      dropdownMenuItems.add(Text(data));
    }
    return dropdownMenuItems;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:CupertinoPicker(itemExtent: 32.0,onSelectedItemChanged:(selectedIndex){
              print(selectedIndex);
            },children: GetText(),),
          ),
        ],
      ),
    );
  }
}

//
//    : DropdownButton<dynamic>(
//onChanged: (value) {
//setState(() {
//SelectedCurrency = value;
//print(SelectedCurrency);
//});
//},
//value: SelectedCurrency,
//items: GetDropdownMenu(),
//)
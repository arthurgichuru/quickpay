import 'package:flutter/material.dart';


class PayMerchantTill extends StatefulWidget{

  _PayMerchantTill createState()=> _PayMerchantTill();
}

class _PayMerchantTill extends State<PayMerchantTill> {

  List _MerchantProviders = [
    "M-PESA TILL",
    "AIRTEL TILL"
  ];

  List<DropdownMenuItem<String>>_dropDownMenuItems;

  String _currentMerchantProvider;


  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentMerchantProvider = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String tvprovider in _MerchantProviders) {
      items.add(
          new DropdownMenuItem(
              value: tvprovider, child: new Text(tvprovider)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {

    final DropDownMerchantTills = Container(
      margin: EdgeInsets.all(10),
      width: 80.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.grey)
      ),
      child: Padding(padding: const EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            value: _currentMerchantProvider,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          ),
        ),
      ),
    );




    //MerchantTill
    final MerchantTill = Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 70,
          width: 310,
          child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(Icons.apps, color: Color(0xFF89c24c),),
              ),
              helperText: 'Key in Merchant Till',
              labelText: 'Merchant Till Number',
            ),
          ),
        )
    );



    //Amount
    final MerchantTillAmount = Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 70,
          width: 310,
          child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(Icons.monetization_on, color: Color(0xFF89c24c),),
              ),
              helperText: 'Charge KES: 1000.00',
              labelText: 'Amount',
            ),
          ),
        )
    );


    //Description Text
    final descriptionText = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 250.0,
            height: 50.0,
            child: new Text('Pay your Merchant.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight:
                FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ]
    );


    //Next Button

    final BillerPayButton = new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250.0,
                height: 40.0,
                child: new RaisedButton(
                    child: const Text(
                      'PAY', style: TextStyle(color: Colors.white),),
                    elevation: 4.0,
                    color: Color(0xFF89c24c),
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),),
                    onPressed: () {
                      //Navigator.of(context).push(new MaterialPageRoute(
                          //builder: (context) => SendMoneyOneTimePin()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );


    return MaterialApp(
      title: 'PayMerchant',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Pay Merchant', style: TextStyle(color: Colors.white), ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.cancel,),
                onPressed: (){
                  //Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SoleProprietorBottomNavPage()));
                },
              )
            ],
            backgroundColor: Color(0xFF89c24c)
        ),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10, width: 300,),
                  descriptionText,
                  SizedBox(height: 10, width: 300,),
                  DropDownMerchantTills,
                  SizedBox(height: 30, width: 310,),
                  MerchantTill,
                  SizedBox(height: 20, width: 310,),
                  MerchantTillAmount,
                  SizedBox(height: 10, width: 300,),
                  BillerPayButton

                ],
              )
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedDocument){
    setState(() {
      _currentMerchantProvider = selectedDocument;
    });
  }
}





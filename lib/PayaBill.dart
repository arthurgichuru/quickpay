import 'package:flutter/material.dart';



class PayTvBilling extends StatefulWidget{

  _PayTvBilling createState()=> _PayTvBilling();
}

class _PayTvBilling extends State<PayTvBilling> {

  List _TvProviders = [
    "ZUKU",
    "GO TV",
    "DSTV",
    "KPLC PRE-PAID",
    "KPLC POST-PAID",
    "NAIROBI WATER"
  ];

  List<DropdownMenuItem<String>>_dropDownMenuItems;

  String _currentTvProvider;


  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentTvProvider = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String tvprovider in _TvProviders) {
      items.add(
          new DropdownMenuItem(
              value: tvprovider, child: new Text(tvprovider)));
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    //DropDown

    final DropDownDocuments = Container(
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
            value: _currentTvProvider,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          ),
        ),
      ),
    );



    //AccountNumberWithBiller
    final AccountNumberWithBiller = Padding(
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
              helperText: 'Account number with biller',
              labelText: 'Account Number',
            ),
          ),
        )
    );



    //Amount
    final SendMoneyAmount = Padding(
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
              helperText: 'Charge UGX: 1000.00',
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
            child: new Text('TOP BILLERS.',
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
      title: 'PayTv',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('TOP BILLERS', style: TextStyle(color: Colors.white), ),
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
                 // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SoleProprietorBottomNavPage()));
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
                  DropDownDocuments,
                  SizedBox(height: 30, width: 310,),
                  AccountNumberWithBiller,
                  SizedBox(height: 20, width: 310,),
                  SendMoneyAmount,
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
      _currentTvProvider = selectedDocument;
    });
  }
}





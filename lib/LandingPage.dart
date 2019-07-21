import 'package:flutter/material.dart';
import 'package:quickpay/PayMerchant.dart';
import 'package:quickpay/PaymentsPage.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:quickpay/SendtoMobile.dart';


class LogInPersonal extends StatefulWidget{

  _LogInPersonal createState()=> _LogInPersonal();
}

class _LogInPersonal extends State<LogInPersonal>{
  @override

  void initState() {
    super.initState();

    final QuickActions quickActions =  QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'Send_to_Mobile_Money') {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SendMoneyToMobile()));
      } else if (shortcutType =='Pay_a_abill'){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayMerchantTill()));
        }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'Send_to_Mobile_Money', localizedTitle: 'Mobile Money', icon: 'minus'),
      const ShortcutItem(
          type: 'Pay_a_abill', localizedTitle: 'Pay Bill', icon: 'plus')
    ]);
  }




  Widget build(BuildContext context) {
    //Country Field
    final PhoneNumber = Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 70,
          width: 300,
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            maxLength: 10,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.green,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color:Colors.white)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(Icons.phone, color: Colors.deepOrange,),
              ),
              labelText: 'Phone', labelStyle: TextStyle(color: Colors.white)),
            ),
          ),
        );


    //Customer PassWord
    final CustomerPassword = Padding(
      padding: EdgeInsets.all(10),
      child:SizedBox(
        height: 70,
        width: 300,
        child: TextField(
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          obscureText: true,
          maxLength: 4,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.white)),
              labelText: 'Enter Password',labelStyle: TextStyle(color: Colors.white)
          ),


          ),
        ),
      );

//Log in Button

    final loginButton = new Container(
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
                    child: const Text('LOG IN'),
                    elevation: 4.0,
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0),),
                    onPressed: () {
                      Navigator.pushNamed(context, '/0_PersonalProductsPage');
                    }),
              ),
            ],
          ),
        ),
      ),
    );

    //Branding Text

    final descriptionText = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 250.0,
            height: 100.0,
            child: new Text('WELCOME TO LOOP.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight:
                FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ]
    );


    return MaterialApp(
      title: 'LandingPage',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.amber,
        body: PageView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:
                [
                  const Color(0xF018aaa3),
                  const Color(0xFF23ac9a),
                  const Color(0xFF89c24c),
                  const Color(0xFF31ccc7),
                ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    stops:[0.0,0.0,1.0,1.0]
                ),
              ),
              child:Padding(
                padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10,width: 300,),
                    descriptionText,
                    SizedBox(height: 15,width: 300,),
                    PhoneNumber,
                    SizedBox(height: 5.0,width: 300,),
                    CustomerPassword,
                    SizedBox(height: 5.0,width: 300,),
                    loginButton,
                  ],
                ),
              ),
            ),
            PersonalMokashBankPaymentsPage(),

          ],
          scrollDirection: Axis.horizontal,
        ),
        /*floatingActionButton: FloatingActionButton.extended(
          onPressed: (){ _quickpayModalBottomSheet(context);},
          icon: Icon(Icons.call_made),
          shape: StadiumBorder(side: BorderSide(color: Colors.white,width: 1.0)),
          label: Text('Quick Pay'),
          backgroundColor: Color(0xFF89c24c),
        ),*/

      ),
    );
  }


/*
  void _quickpayModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(

            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone_android,color: Colors.orange,),
                  title: Text('Mobile money'),
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SendMoneyToMobile()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.amber,),
                  title: Text('Pay Merchant Till'),
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayMerchantTill()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.apps,color: Colors.indigoAccent,),
                  title: Text('Pay Merchant QR'),
                  onTap: ()=>{

                  },
                ),
                ListTile(
                  leading: Icon(Icons.add_shopping_cart, color: Colors.red,),
                  title: Text('Top Billers'),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayTvBilling()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.all_inclusive,color: Colors.brown,),
                  title: Text('Loop 2 Loop'),
                  onTap: ()=>{

                  },
                )
              ],
            ),
          );
        }

    );
  }*/
}



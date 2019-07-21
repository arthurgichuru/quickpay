import 'package:flutter/material.dart';
import 'package:quickpay/LandingPage.dart';
import 'package:quickpay/SendtoMobile.dart';
import 'package:quickpay/PayaBill.dart';
import 'package:quickpay/PayMerchant.dart';

class PersonalMokashBankPaymentsPage extends StatefulWidget {

  _PersonalMokashBankPaymentsPage createState() =>
      _PersonalMokashBankPaymentsPage();
}

class _PersonalMokashBankPaymentsPage
    extends State<PersonalMokashBankPaymentsPage> {


  @override
  Widget build(BuildContext context) {

    //Send Money
    final SendMoney = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
          onTap: () {
            _settingModalBottomSheetSendMoney(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.attach_money, color: Colors.white,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Send Money',
                    style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                )
              ],
            ),
          )
      ),
    );


    //Pay a Bill
    final PayBill = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          _settingModalBottomSheetPayBill(context);
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.assignment, color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Pay a Bill',
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              )
            ],
          ),
        ),
      ),
    );


    final PayMerchant = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
          onTap: () {
            _settingModalBottomSheetPayMerchant(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Material(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.shopping_cart, color: Colors.white,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Pay a Merchant',
                    style: TextStyle(color: Colors.black87, fontSize: 12.0),),
                )
              ],
            ),
          )
      ),
    );

    final DebitOrders = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          _settingModalBottomSheetDebitOrders(context);
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Material(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.calendar_today, color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Debit Orders',
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              )
            ],
          ),
        ),
      ),
    );

    final PayLaterCard = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          _settingModalBottomSheetPayLater(context);
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.calendar_today, color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Pay Later',
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              )
            ],
          ),
        ),
      ),
    );

    final PaymentsInfoCard = Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.info_outline, color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Info',
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),),
              )
            ],
          ),
        ),
      ),
    );

    final PaymentCards = GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        SendMoney,
        PayBill,
        PayMerchant,
        DebitOrders,
        //PayLaterCard,
        //PaymentsInfoCard
      ],
    );


    return MaterialApp(
        title: 'PersonalMokashBankPaymentsPage',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF89c24c),
            title: Text('Quick Payments'),
//            leading: IconButton(
//          icon: Icon(Icons.arrow_back, color: Colors.white,),
//          onPressed: () {
//            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> LogInPersonal()));
//          },
       // ),
          ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PaymentCards,
            )
        )
    );
  }


  //This code is being temporarily being hosted here. it should be abstracted to its
  //own class in the SendMoneyLandingPage

  //Send Money
  void _settingModalBottomSheetSendMoney(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.mobile_screen_share, color: Colors.green,),
                    title: new Text('Transfer to Mobile Money'),
                    onTap: ()  {
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SendMoneyToMobile()));
                    }
                ),
                new ListTile(
                  leading: new Icon(Icons.call_made, color: Colors.orangeAccent,),
                  title: new Text('Transfer to Local Bank',),
                  onTap: ()  {},
                ),
                new ListTile(
                  leading: new Icon(Icons.flight_takeoff,color: Colors.deepPurpleAccent,),
                  title: new Text('Transfer Abroad'),
                  onTap: () {},
                ),
                new ListTile(
                  leading: new Icon(Icons.face,color: Colors.deepPurpleAccent,),
                  title: new Text('Withdraw from Agent'),
                  onTap: ()  {},
                ),
              ],
            ),
          );
        }
    );
  }

  //PayBill
  void _settingModalBottomSheetPayBill(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.tv, color: Colors.green,),
                    title: new Text('Pay TV'),
                    onTap: () {
                     Navigator.of(context).push(new MaterialPageRoute(builder: (context) => PayTvBilling()));
                    }
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.format_color_fill, color: Colors.orangeAccent,),
                  title: new Text('Pay Water',),
                  onTap: ()  {},
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.lightbulb_outline, color: Colors.deepPurpleAccent,),
                  title: new Text('Pay Electricity'),
                  onTap: ()  {},
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.airplanemode_active, color: Colors.deepPurpleAccent,),
                  title: new Text('Jambo Jet'),
                  onTap: ()  {},
                ),

              ],
            ),
          );
        }
    );
  }


  //PayMerchant
  void _settingModalBottomSheetPayMerchant(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.filter_1, color: Colors.orangeAccent,),
                  title: new Text('Till',),
                 onTap: () {Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayMerchantTill()));
                   },
                ),
                new ListTile(
                    leading: new Icon(Icons.blur_linear, color: Colors.green,),
                    title: new Text('QR'),
                    onTap: ()  {

                    }
                ),
              ],
            ),
          );
        }
    );
  }



  //DebitOrders
  void _settingModalBottomSheetDebitOrders(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.access_time, color: Colors.green,),
                    title: new Text('Weekly'),
                    onTap: ()  {
                      //Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayTvBilling()));
                    }
                ),
                new ListTile(
                  leading: new Icon(Icons.calendar_today, color: Colors.orangeAccent,),
                  title: new Text('Monthly',),
                  onTap: ()  {},
                ),
                new ListTile(
                  leading: new Icon(Icons.perm_contact_calendar, color: Colors.orangeAccent,),
                  title: new Text('Quarterly',),
                  onTap: ()  {},
                ),
              ],
            ),
          );
        }
    );
  }

  //Paylater
  void _settingModalBottomSheetPayLater(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.date_range, color: Colors.green,),
                    title: new Text('Pay your merchant later'),
                    onTap: ()  {
                      //Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PayLater()));
                    }
                ),
              ],
            ),
          );
        }
    );
  }


}
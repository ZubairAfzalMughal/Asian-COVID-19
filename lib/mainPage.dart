import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronaapp/components/top_of__screen.dart';
import 'constant.dart';
import 'package:coronaapp/components/http_values.dart';
import 'package:coronaapp/components/countries.dart';
class CoronaApp extends StatefulWidget {
  @override
  _CoronaAppState createState() => _CoronaAppState();
}

class _CoronaAppState extends State<CoronaApp> {
  Choice selectChoice;
  Death selectDeath;
  String selectedCountry='Pakistan';
  // taking drop down menu item
  List<DropdownMenuItem> getItems(){
    List<DropdownMenuItem<String>>countryItems=[];
    for(String country in myCountries){
      var items=DropdownMenuItem(
        value: country,
        child: Text(country,style: kText,
        overflow: TextOverflow.ellipsis,),
      );
      // adding the items
      countryItems.add(items);
    }
    return countryItems;
  }

  @override
  void initState() {
    getData(selectedCountry);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF282A36),
          //primaryColor: Colors.red
      ),
      home: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 50.0,

                  child: DropdownButton<String>(
                    elevation: 10,
                    value: selectedCountry, // that value will be updated
                      items:
                        getItems(),
                      onChanged: (value){
                      setState(() {
                        selectedCountry=value;
                        getData(selectedCountry);
                      });
                      }),
                ),
                ScreenTop(onTap: (){
                    setState(() {
                      selectDeath=Death.notDeath;
                    });
                },
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Cases'.toUpperCase(),textAlign: TextAlign.center,
                        style: kStyle
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(confirmedCases.toString(),textAlign: TextAlign.center,style: kText,)
                    ],
                  ),color: selectDeath==Death.notDeath?Color(0xFF008000):Colors.pinkAccent,
                  ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ScreenTop(onTap: (){
                        setState(() {
                          selectChoice=Choice.punjab;
                        });
                      },
                        cardChild:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New Cases'.toLowerCase(),textAlign: TextAlign.center,
                            style: kStyle,),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(newConfirmed.toString(),style: kText,)
                          ],
                        ) ,color: selectChoice==Choice.punjab?kActiveColor:kInActiveColor,
                      ),
                    ),
                    Expanded(
                      child: ScreenTop(onTap: (){
                        setState(() {
                          selectChoice=Choice.sindh;
                        });
                      },
                        cardChild:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New Recovered'.toLowerCase(),textAlign: TextAlign.center,
                            style: kStyle,),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(newRecovered.toString(),style: kText,)
                          ],
                        ) ,
                          color: selectChoice==Choice.sindh?kActiveColor:kInActiveColor),
                    ),
                    ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ScreenTop(onTap: (){
                        setState(() {
                          selectChoice=Choice.kpk;
                        });
                      },
                        cardChild:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('total recovered'.toLowerCase(),textAlign: TextAlign.center,
                              style: kStyle,),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(totalRecovered.toString(),style: kText,)
                          ],
                        ) ,
                          color: selectChoice==Choice.kpk?kActiveColor:kInActiveColor),
                    ),
                    Expanded(
                      child: ScreenTop(onTap: (){
                        setState(() {
                          selectChoice=Choice.balochestan;
                        });
                      },
                        cardChild:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New Deaths'.toLowerCase(),textAlign: TextAlign.center,
                              style: kStyle,),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(newDeath.toString(),style: kText,)
                          ],
                        ) ,
                          color: selectChoice==Choice.balochestan?kActiveColor:kInActiveColor),
                    ),
                  ],
                ),
                ScreenTop(onTap: (){
                  setState(() {
                    selectDeath=Death.death;
                  });

                  }, cardChild:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Deaths'.toUpperCase(),textAlign: TextAlign.center,
                        style: kStyle
                    ),
                    Text(
                      totalDeath.toString(),textAlign: TextAlign.center,
                      style: kText,
                    ),
                  ],
                ), color: selectDeath==Death.death?kDeathColor:Colors.pink,),
              ],
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              getData(selectedCountry);
            });
          },
          backgroundColor: Color(0xFF282A36),
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        ),
    );
  }
}
enum Choice{
  punjab,
  sindh,
  kpk,
  balochestan

}
enum Death{
   death,
   notDeath
}

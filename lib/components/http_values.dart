import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coronaapp/constant.dart';
//variable for getting data live
int confirmedCases=0;
int newConfirmed=0;
int totalDeath=0;
int newDeath=0;
String country;
int totalRecovered=0;
int newRecovered=0;

void getData(String selectedCountry)async{
  try{
    http.Response response=await http.get(url);
    if(response.statusCode==200){
      String data=response.body;
      /// same as
      var decodeData=jsonDecode(data);
      /// confirmedDeath=decodeData['Countries'][i]['Total Deaths];
      for(int i=0;i<200;i++){
        country=decodeData['Countries'][i]['Country'];
        //print(decodeData);
        if(country==selectedCountry){
          // confirmed cases
          confirmedCases=decodeData['Countries'][i]['TotalConfirmed'];
          newConfirmed=decodeData['Countries'][i]['NewConfirmed'];
          // Confirmed Deaths
          totalDeath=decodeData['Countries'][i]['TotalDeaths'];
          newDeath=decodeData['Countries'][i]['NewDeaths'];
          // Confirmed Recover
          totalRecovered=decodeData['Countries'][i]['TotalRecovered'];
          newRecovered=decodeData['Countries'][i]['NewRecovered'];
          break;
        }
      }

    }
    else{
      print(response.statusCode);
    }
  }catch(e){
    print(e);
  }
}


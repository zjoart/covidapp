import 'package:flutter/material.dart';
class MostAffected extends StatelessWidget {
  final List countrydata;
  MostAffected({this.countrydata});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context,index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
        child: Row( 
          //cause we want to how rowise data of each country
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          
          children: <Widget>[
            Image.network(countrydata[index]['countryInfo']['flag'],height: 23,),
            SizedBox(width:6),
            Text(countrydata[index]['country'],style: TextStyle(fontWeight: FontWeight.w800, fontFamily: 'Poppins-Medium'),),
             SizedBox(width:6),
            Text('Deaths:'+countrydata[index]['deaths'].toString(),style: TextStyle(color:Colors.red[800],fontWeight: FontWeight.w700, fontFamily: 'Poppins-Medium'),),//0.country0.deaths
          ],
        ),
      ),
      ),
    );
  }
}
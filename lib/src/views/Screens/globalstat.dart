import 'package:covidapp/src/models/word_data_model.dart';
import 'package:flutter/material.dart';

class GlobalData extends StatelessWidget {
  final WorldDataModel data;
  const GlobalData({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true, //to avoid grid view to expand all the size
      physics: const NeverScrollableScrollPhysics(), //to not let it scroll
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio:
              3 //height is double the width a good rectangle here) ,
          ),
      children: <Widget>[
        StatusPanel(
          panelTitle: 'CONFIRMED',
          panelColor: Colors.yellow.shade800,
          textColor: Colors.white,
          count: data.cases.toString(),
        ),
        StatusPanel(
          panelTitle: 'ACTIVE',
          panelColor: Colors.blue.shade900,
          textColor: Colors.white,
          count: data.active.toString(),
        ),
        StatusPanel(
          panelTitle: 'RECOVERED',
          panelColor: Colors.green.shade800,
          textColor: Colors.white,
          count: data.recovered.toString(),
        ),
        StatusPanel(
          panelTitle: 'DEATHS',
          panelColor: Colors.red.shade800,
          textColor: Colors.white,
          count: data.deaths.toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final String panelTitle;
  final Color textColor;
  final String count;

  const StatusPanel(
      {super.key,
      required this.count,
      required this.panelColor,
      required this.panelTitle,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //getting the device width

    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: panelColor,
        ),
        margin: const EdgeInsets.all(7),
        height: 200.0,
        width: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                panelTitle,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    fontFamily: 'Poppins-Medium',
                    color: textColor),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                count,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    fontFamily: 'Poppins-Regular',
                    color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

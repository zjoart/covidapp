import 'package:covidapp/src/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SyHelp extends StatelessWidget {
  const SyHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade900,
          ],
        ),
        image: DecorationImage(
            image: const AssetImage('images/background2.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.35), BlendMode.dstOut),
            fit: BoxFit.cover),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Row(children: <Widget>[
        SizedBox(
          width: 100,
          height: 200.0,
          //color: Colors.red,
          child: Image.asset(
            'images/doctor.png',
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 200,
          // height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Do you?',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Poppins-Medium'),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Have any symptoms of Covid-19 call  NCDC Toll-free Number: 080097000010',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Poppins-Medium'),
              ),
              const SizedBox(height: ySpaceMin),
              GestureDetector(
                onTap: () {
                  try {
                    launch('https://www.ncdc.gov.ng');
                  } catch (e) {
                    //
                  }
                },
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      'Visit NCDC site',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins-Regular'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

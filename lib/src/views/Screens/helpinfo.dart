import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SyHelp extends StatelessWidget {
  const SyHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[900],
            Colors.blue[900],
          ],
        ),
        image: DecorationImage(
            image: const AssetImage('images/background2.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.35), BlendMode.dstOut),
            fit: BoxFit.fitHeight),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      height: 200.0,
      padding: const EdgeInsets.all(10),
      child: Row(children: <Widget>[
        // SizedBox(height:100.0, width: 15.0),
        SizedBox(
          width: 100.0,
          height: 200.0,
          //color: Colors.red,
          child: Image.asset(
            'images/doctor.png',
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(width: 2.0),
        SizedBox(
          width: 220.0,
          height: 200.0,
          //color: Colors.red,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.only(right: 118),
                child: Text(
                  'Do you?',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontFamily: 'Poppins-Medium'),
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Have any symptoms of Covid-19 call  NCDC Toll-free Number: 080097000010',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Poppins-Medium'),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  try {
                    launch('https://www.ncdc.gov.ng');
                  } catch (e) {
                    print(e);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 68.0),
                  child: Container(
                    width: 120,
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
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

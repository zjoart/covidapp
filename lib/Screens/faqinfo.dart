import 'package:covid19update/pages/faqpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AllYouKnow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[900],
            Colors.blue[900],
          ],
        ),
        image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.35), BlendMode.dstOut),
            fit: BoxFit.fitHeight),
      ),
      width: 340,
      alignment: Alignment.center,
      height: 190.0,
      padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:100.0, width: 15.0),
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text('All you need to\nknow about\ncoronavirus!', style:TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.normal ,
                      fontFamily: 'Poppins-Medium'),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: MaterialButton(
                      color: Colors.blue[900],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FaqPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Know more',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-Regular'),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/doc3.png',
                      width: 150,
                    // alignment: Alignment.topLeft,
                      fit: BoxFit.cover,
                      height: 150,
                     // matchTextDirection: true,
                    ),
                  ],
                ),
              ),

            ]
        ),
      ),

    );
  }
}
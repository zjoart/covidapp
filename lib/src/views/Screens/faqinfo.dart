import 'package:covidapp/src/views/pages/faqpage.dart';
import 'package:flutter/material.dart';

class AllYouKnow extends StatelessWidget {
  const AllYouKnow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade900,
          ],
        ),
        image: DecorationImage(
            image: const AssetImage('images/background.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.35), BlendMode.dstOut),
            fit: BoxFit.fitHeight),
      ),
      width: 340,
      alignment: Alignment.center,
      height: 190.0,
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0, width: 15.0),
              Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    'All you need to\nknow about\ncoronavirus!',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: MaterialButton(
                      color: Colors.blue.shade900,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FaqPage(),
                          ),
                        );
                      },
                      child: const Text(
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
              Column(
                children: <Widget>[
                  Image.asset(
                    'images/doc3.png',
                    width: 150,
                    // alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                    height: 150,
                    // matchTextDirection: true,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import './Screens/search.dart';
import './Screens/globalstat.dart';
import 'package:share/share.dart';
import 'package:pie_chart/pie_chart.dart';
import './Screens/helpinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  final String payload;
  const LandingPage({
    @required this.payload,
    Key key,
  }) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Map worldData;
  Future<dynamic> getWorldwideData() async {
    try {
      http.Response response = await http.get('$apiUrl/all');
      setState(() {
        worldData = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }

  List countrydata;
  Future<dynamic> mostAffectedCountries() async {
    try {
      http.Response response =
          await http.get('$apiUrl/countries?yesterday=false&sort=deaths');
      setState(() {
        countrydata = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }

  Future<dynamic> allData() async {
    getWorldwideData();
    mostAffectedCountries();
  }

  @override
  void initState() {
    super.initState();
    allData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              disabledColor: Colors.white,
              onPressed: () {
                countrydata == null
                    ? CircularProgressIndicator(
                        semanticsLabel: 'Please wait',
                      )
                    : showSearch(
                        context: context,
                        delegate: Search(countrylist: countrydata),
                      );
              }),
        ],
        title: Text(
          'Covid-19 Updates',
          style: TextStyle(
              //fontSize: 25,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.blue[900],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50.0,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.blue[900],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  ),
                  SizedBox(width: 143),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                DynamicTheme.of(context).setBrightness(
                    Theme.of(context).brightness == Brightness.light
                        ? Brightness.dark
                        : Brightness.light);
              },
              child: Container(
                child: ListTile(
                  title: Text(
                    'Theme',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Theme.of(context).brightness == Brightness.light
                          ? Icons.lightbulb_outline
                          : Icons.highlight,
                    ),
                    onPressed: () {
                      DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.light
                              ? Brightness.dark
                              : Brightness.light);
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  launch('https://forms.gle/Mz9An8WFjdLo3BrGA');
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                child: ListTile(
                  title: Text(
                    'Found bugs? Review this App',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.rate_review),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1.0,
              child: GestureDetector(
                onTap: () {
                  Share.share(
                      'Check out my Covid19 update app \n https://www.jossaysblog.com.ng/2020/05/covid-19coronavirus-update-app.html');
                },
                child: Container(
                  child: ListTile(
                    title: Text(
                      'Share this App',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Share.share(
                            'Check out my Covid19 update app \n https://www.jossaysblog.com.ng/2020/05/covid-19coronavirus-update-app.html');
                      },
                      icon: Icon(Icons.share),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: allData,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  countrydata == null
                      ? CircularProgressIndicator(
                          semanticsLabel: 'Please wait',
                        )
                      : showSearch(
                          context: context,
                          delegate: Search(countrylist: countrydata),
                        );
                },
                child: Container(
                  //margin: EdgeInsets.all(10.0),
                  height: 40.0,
                  width: 240.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.blue[900],
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 25),
                        Text(
                          'Search for countries update',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins-Regular'),
                        ),
                        IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            disabledColor: Colors.white,
                            onPressed: () {
                              countrydata == null
                                  ? CircularProgressIndicator(
                                      semanticsLabel: 'Please wait',
                                    )
                                  : showSearch(
                                      context: context,
                                      delegate:
                                          Search(countrylist: countrydata),
                                    );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            AllYouKnow(),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 300,
                          height: 30,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10.0),
                                Icon(Icons.flag),
                                SizedBox(width: 10.0),
                                Text(
                                  'Most Affected Countries',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins-Medium'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 3.0,
                        color: Colors.blue[900],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            countrydata == null
                ? CircularProgressIndicator(
                    semanticsLabel: 'Please wait',
                  )
                : MostAffected(
                    countrydata: countrydata,
                  ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 300,
                          height: 30,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 10.0),
                                Icon(Icons.score),
                                SizedBox(width: 10.0),
                                Text(
                                  'Global Covid-19 Updates',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins-Medium'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 3.0,
                        color: Colors.blue[900],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            worldData == null
                ? CircularProgressIndicator()
                : GlobalData(
                    data: worldData,
                  ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                width: 300,
                height: 30,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //SizedBox(width: 20),
                        Icon(Icons.pie_chart),
                        SizedBox(width: 10),
                        Text(
                          'Global Covid-19 Chart',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, top: 1.0),
                      child: Container(
                        width: 300,
                        height: 3.0,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: worldData == null
                  ? CircularProgressIndicator(
                      semanticsLabel: 'Please wait',
                    )
                  : PieChart(dataMap: {
                      'Confirmed': worldData['cases'].toDouble(),
                      'Active': worldData['active'].toDouble(),
                      'Recovered': worldData['recovered'].toDouble(),
                      'Death': worldData['deaths'].toDouble(),
                    }, colorList: [
                      Colors.yellow[800],
                      Colors.blue[800],
                      Colors.green[800],
                      Colors.red[800],
                    ]),
            ),
            SyHelp(),
            SizedBox(height: 5),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 30.0,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[800]
              : Colors.blue[900],
          child: Padding(
            padding: const EdgeInsets.only(top: 7.0, left: 10.0),
            child: Text(
              'Last updated ${DateTime.now()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

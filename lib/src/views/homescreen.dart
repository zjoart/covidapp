// ignore: import_of_legacy_library_into_null_safe
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covidapp/src/viewmodels/home_vm.dart';
import 'package:covidapp/src/views/Screens/faqinfo.dart';
import 'package:covidapp/src/views/Screens/mostaffected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './Screens/search.dart';
import './Screens/globalstat.dart';
import 'package:share/share.dart';
import 'package:pie_chart/pie_chart.dart';
import './Screens/helpinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              disabledColor: Colors.white,
              onPressed: () {
                _viewModel.countryDataModel == null
                    ? const CircularProgressIndicator(
                        semanticsLabel: 'Please wait',
                      )
                    : showSearch(
                        context: context,
                        delegate:
                            Search(countrylist: _viewModel.countryDataModel!),
                      );
              }),
        ],
        title: const Text(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  ),
                  const SizedBox(width: 143),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: IconButton(
                      icon: const Icon(
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
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              child: ListTile(
                title: const Text(
                  'Theme',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                ),
                trailing: Icon(
                  Theme.of(context).brightness == Brightness.light
                      ? Icons.lightbulb_outline
                      : Icons.highlight,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  launch('https://forms.gle/Mz9An8WFjdLo3BrGA');
                } catch (e) {
                  //
                }
              },
              child: ListTile(
                title: const Text(
                  'Found bugs? Review this App',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.rate_review),
                  onPressed: () {},
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
                child: ListTile(
                  title: const Text(
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
                    icon: const Icon(Icons.share),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(homeViewModelProvider.notifier).getALLData(),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  _viewModel.countryDataModel == null
                      ? const CircularProgressIndicator(
                          semanticsLabel: 'Please wait',
                        )
                      : showSearch(
                          context: context,
                          delegate:
                              Search(countrylist: _viewModel.countryDataModel!),
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
                        const SizedBox(width: 25),
                        const Text(
                          'Search for countries update',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins-Regular'),
                        ),
                        IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.white,
                            disabledColor: Colors.white,
                            onPressed: () {
                              _viewModel.countryDataModel == null
                                  ? const CircularProgressIndicator(
                                      semanticsLabel: 'Please wait',
                                    )
                                  : showSearch(
                                      context: context,
                                      delegate: Search(
                                          countrylist:
                                              _viewModel.countryDataModel!),
                                    );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            const AllYouKnow(),
            const SizedBox(height: 7.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
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
            _viewModel.countryDataModel == null
                ? const CircularProgressIndicator(
                    semanticsLabel: 'Please wait',
                  )
                : MostAffected(
                    countrydata: _viewModel.countryDataModel!,
                  ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
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
            const SizedBox(height: 2),
            _viewModel.worldDataModel == null
                ? const CircularProgressIndicator()
                : GlobalData(
                    data: _viewModel.worldDataModel!,
                  ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: SizedBox(
                width: 300,
                height: 30,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const [
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
              padding: const EdgeInsets.all(10),
              child: _viewModel.worldDataModel == null
                  ? const CircularProgressIndicator(
                      semanticsLabel: 'Please wait',
                    )
                  : PieChart(dataMap: {
                      'Confirmed': _viewModel.worldDataModel!.cases,
                      'Active': _viewModel.worldDataModel!.active,
                      'Recovered': _viewModel.worldDataModel!.recovered,
                      'Death': _viewModel.worldDataModel!.deaths,
                    }, colorList: [
                      Colors.yellow.shade800,
                      Colors.blue.shade800,
                      Colors.green.shade800,
                      Colors.red.shade800,
                    ]),
            ),
            const SyHelp(),
            const SizedBox(height: 5),
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
              style: const TextStyle(
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

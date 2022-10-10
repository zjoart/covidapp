import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covidapp/src/utils/constvalues.dart';
import 'package:covidapp/src/viewmodels/home_vm.dart';
import 'package:covidapp/src/views/home/widgets/faq.dart';
import 'package:covidapp/src/views/home/widgets/globalstat.dart';
import 'package:covidapp/src/views/home/widgets/helpinfo.dart';
import 'package:covidapp/src/views/home/widgets/mostaffected.dart';
import 'package:covidapp/src/widgets/search.dart';
import 'package:covidapp/src/views/home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
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
      drawer: const HomeDrawerWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeViewModelProvider.notifier).getALLData();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              vertical: ySpace2, horizontal: ySpace1),
          child: Column(children: <Widget>[
            const FaqWidget(),
            const SizedBox(height: ySpace2),
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

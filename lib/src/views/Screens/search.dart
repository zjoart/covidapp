import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countrylist;
  Search({required this.countrylist});
  @override
  List<Widget> buildActions(BuildContext context) {
    //action like app bar search  return list of widget after you search
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ) //query is already present inside the delegate
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.blue[900],
      brightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.light
          : Brightness.dark,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List suggestionlist = query.isEmpty
        ? countrylist
        : countrylist
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 140,
        decoration: Theme.of(context).brightness == Brightness.light
            ? BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1,
                    offset: const Offset(0, 7),
                  ),
                ],
              )
            : BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 2,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
        child: Row(
          children: <Widget>[
            Container(
              //container1
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    suggestionlist[index]['country'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    (suggestionlist[index]['countryInfo']['flag']),
                    height: 50,
                    width: 60,
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Text(
                    'CONFIRMED: ' + suggestionlist[index]['cases'].toString(),
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  Text('ACTIVE: ' + suggestionlist[index]['active'].toString(),
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 15)),
                  Text(
                      'RECOVERED: ' +
                          suggestionlist[index]['recovered'].toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 15)),
                  Text(
                      'CRITICAL: ' +
                          suggestionlist[index]['critical'].toString(),
                      style: TextStyle(
                          color: Colors.orangeAccent.shade700,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 15)), //0.critical
                  Text('DEATH: ' + suggestionlist[index]['deaths'].toString(),
                      style: Theme.of(context).brightness == Brightness.light
                          ? TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Medium',
                              fontSize: 15)
                          : TextStyle(
                              color: Colors.grey.shade100,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

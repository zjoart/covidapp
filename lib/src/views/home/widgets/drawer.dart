import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

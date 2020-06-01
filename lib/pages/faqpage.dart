import 'package:flutter/material.dart';
import './const.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ & Answers'),
        centerTitle: true,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.dark ? Colors.grey[900]: Colors.blue[900],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          //for faq view
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              )),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(DataSource.questionAnswers[index]['answer'])),
          ],
        ),
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'book_model.dart';
import 'book_widget.dart';

class NewTabWidget extends StatefulWidget {
  @override
  _NewTabWidgetState createState() => _NewTabWidgetState();
}

class _NewTabWidgetState extends State<NewTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 230,
            //above view screen added here
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                BookModel model = bookList[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      child: Image.asset(model.image),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Popular",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  BookModel model = bookList[index];
                  return BookWidget(model);
                }),
          ))
        ],
      ),
    );
  }
}

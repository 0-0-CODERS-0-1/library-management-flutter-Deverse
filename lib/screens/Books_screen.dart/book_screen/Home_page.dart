import 'package:flutter/material.dart';
import 'package:flutter_animated_onboarding/screens/Books_screen.dart/book_screen/issue.dart';
import 'package:flutter_animated_onboarding/screens/Books_screen.dart/book_screen/profile_page.dart';
//import 'package:flutter_animated_onboarding/screens/news/ArticleScreen.dart';
import 'package:flutter_animated_onboarding/screens/news/NewsMode.dart';

import 'book_model.dart';
import 'common.dart';
import 'new_tab_widget.dart';
import '';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 158, 247),
        title: Text("AIT E-LIBRARY"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 50, 158, 247)),
              accountName: Text(
                "Pinkesh Darji",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "pinkesh.earth@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('HOME'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
              ),
              title: const Text('profile'),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hi, Ravi",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Discover Latest Book",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            // Search Box
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search book..",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2.5),
                insets: EdgeInsets.fromLTRB(0.0, 00.0, 30.0, 0.0),
              ),
              unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
              unselectedLabelColor: Colors.grey[500],
              labelColor: Colors.black,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 0, right: 20),
              tabs: [
                _tabWidget("New"),
                _tabWidget("Trending"),
                _tabWidget("Best Sellar"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
                child: Container(
              child: TabBarView(controller: _tabController, children: [
                NewTabWidget(),
                NewTabWidget(), // added the pages here to add other pages
                NewTabWidget(),
              ]),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Material(
          elevation: 7.0,
          color: Colors.white,
          child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.home,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.newspaper,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.book,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.account_box,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }

  Widget _tabWidget(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(title),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Authenticate/methods_page.dart';
import 'package:flutter_demo_project/Data/product_data.dart';
import 'package:flutter_demo_project/pages/about_me.dart';
import 'package:flutter_demo_project/Data/constants_page.dart';
import 'package:flutter_demo_project/pages/one_product_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd0ebf7),
      // backgroundColor: Color(0xFF111328),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'Flutter Application',
                style: kDrawerHeaderTextStyle,
              )),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('About me'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutMe()));
              },
            ),
            SizedBox(
              height: 2.0,
              child: Container(
                color: Color(0xFFC6C6C6),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Flutter Project',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () => LogOut(context), icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.all(5),
                child: GridView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.7),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // ontap of each card, set the defined int to the grid view index
                            selectedCard = index;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => One_Product(
                                product: products[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          // check if the index is equal to the selected Card integer
                          color: selectedCard == index
                              ? Color(0xffaeddf1)
                              : Color(0xFFc7e5f2),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xff76cfef),
                                        radius: 100.0,
                                        child: ClipRRect(
                                          child: Image.asset(
                                              products[index].imageUrl),
                                          borderRadius:
                                              BorderRadius.circular(70.0),
                                        ),
                                      ),
                                    ),
                                    // color: Colors.lightGreen,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 3, right: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Color(0xFF013814),
                                    ),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      products[index].name,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF082F5C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xff4aa3ce),
                                    ),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      products[index].price,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xff9cd3ec),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(5),
                  // color: Colors.black,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

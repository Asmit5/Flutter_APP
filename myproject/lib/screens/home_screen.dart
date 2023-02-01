import 'package:flutter/material.dart';
import 'package:myproject/screens/post_Screen.dart';
import 'package:myproject/widgets/home_app_bar.dart';
import 'package:myproject/widgets/home_bottom_bar.dart';

class HomePage extends StatelessWidget {
  var category = [
    'Best Places',
    'Most Visited',
    'Favourites',
    'New Added',
    'Camping House',
    'Resturants',
  ];

  @override
  Widget build(BuildContext context) {
    final lst = List.generate(100, (index) => "$index");
    final lst1 = [
      "Mt.Everest",
      "Daulagiri",
      "Annapurna",
      "Manaslu",
      "Ganesh Himal",
      "Api"
    ];
    final lst2 = [
      "Mt.Everest",
      "Daulagiri",
      "Annapurna",
      "Manaslu",
      "Ganesh Himal",
      "Api"
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: lst1.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "images/downlaod${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        lst1[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        for (int i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Text(
                              category[i],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lst2.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "images/downlaod${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lst2[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(Icons.more_vert, size: 30),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}

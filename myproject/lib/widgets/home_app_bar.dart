import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('images/downlaod1.jpg'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            title: Text('Asmit Tiwari'),
                            tileColor: Colors.green.withOpacity(0.05),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/welcome", (route) => false);
                            },
                            leading: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text('logout'),
                            tileColor: Colors.green.withOpacity(0.05),
                          ),
                          TextButton(
                            child: Text("Book"),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/book");
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.sort_rounded,
                size: 28,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFFF65959),
              ),
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

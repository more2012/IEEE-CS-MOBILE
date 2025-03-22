import 'package:e_commerceui/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List categories = [
    {"iconName": "assets/icons8-sneakers-50.png", "title": "Shoes"},
    {"iconName": "assets/icons8-women-shoes-50.png", "title": "Women"},
    {"iconName": "assets/icons8-lightning-bolt-50.png", "title": "Electrical"},
    {"iconName": "assets/watchicon.png", "title": "Watches"},
    {"iconName": "assets/caricon.png", "title": "Cars"},
  ];
  List items = [
    {
      "image": "assets/iphone.png",
      "title": "iphone",
      "subtitle": "HHHHHHHH",
      "price": "350\$",
    },
    {
      "image": "assets/car.png",
      "title": "BMW M8",
      "subtitle": "MMMMM",
      "price": "100,0000\$",
    },
    {
      "image": "assets/watch.png",
      "title": "Watch",
      "subtitle": "FFFFFFFFFF",
      "price": "60\$",
    },
    {
      "image": "assets/shoes.png",
      "title": "Sneakers",
      "subtitle": "JJJJJJ",
      "price": "80\$",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "*"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "*",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "*"),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.menu, size: 30),
                ),
              ],
            ),
            Container(height: 20),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(height: 30),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(categories[i]["iconName"]),
                        ),
                        Text(
                          categories[i]["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GridView.builder(
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemsDetails(data: items[i]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 200,
                          color: Colors.grey[200],
                          child: Image.asset(
                            items[i]["image"],
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          items[i]["title"],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          items[i]["subtitle"],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(height: 2),
                        Text(
                          items[i]["price"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

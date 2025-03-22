import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final data;

  const ItemsDetails({super.key, this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
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
      endDrawer: const Drawer(),
      appBar: AppBar(
        //centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, color: Colors.black),
            Text(" E -", style: TextStyle(color: Colors.black)),
            Text(" Commerce", style: TextStyle(color: Colors.orange)),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(height: 300, child: Image.asset(widget.data['image'])),
          //  by widget. i can access all Var in statefull widget(data)
          Container(
            child: Text(
              widget.data['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              widget.data['subtitle'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              widget.data['price'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color :", style: TextStyle(color: Colors.grey)),
              SizedBox(width: 10),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
              ),
              Text("  Grey"),
              SizedBox(width: 20),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
              ),
              Container(width: 10),
              Text("Black"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Size :     34   35   40   41",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            //padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Add To Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border, size: 30, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.ios_share, size: 30, color: Colors.white),
              ),
            ],
          ),
          body: Stack(
            children: [
              DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.3,
                maxChildSize: 0.6,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child:SingleChildScrollView(
                      controller: scrollController,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chicken Avocado Salad",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              Row(
                                children: [
                                  Icon(Icons.stars_rounded,size: 30,color: Colors.yellow,),
                                  Text(" 4.5",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.av_timer_rounded,color: Colors.cyan,size: 40,),
                              Icon(Icons.person,color: Colors.cyan,size: 40),
                              Icon(Icons.local_fire_department,color: Colors.cyan,size: 40)
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("3 hr 30 min",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              Text("4 Serves",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
                              Text("Intermediate",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              const Text("Ingredients     " ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Icon(Icons.add_shopping_cart_outlined,color: Colors.cyan)
                            ],
                          ),
                          SizedBox(height: 15),

                          Row(
                            children: const [
                              SizedBox(width: 80, child: Text("8 Cups", textAlign: TextAlign.start)),
                              Expanded(child: Text("Low sodium Chicken broth")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 80, child: Text("16", textAlign: TextAlign.start)),
                              Expanded(child: Text("Dried Shiitake mushrooms")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 80, child: Text("30 g", textAlign: TextAlign.start)),
                              Expanded(child: Text("Kombu (about 10 Square piece)")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 80, child: Text("20 g", textAlign: TextAlign.start)),
                              Expanded(child: Text("Dried Bonito flakes")),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              const Text("For Tare and Chashu" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 90, child: Text("1 1/4 Cups", textAlign: TextAlign.start)),
                              Expanded(child: Text("Low sodium soy souce")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 90, child: Text("1 1/4 Cups", textAlign: TextAlign.start)),
                              Expanded(child: Text("Mirin")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 90, child: Text("1/2 Cups", textAlign: TextAlign.start)),
                              Expanded(child: Text("sake")),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(width: 90, child: Text("1 1/2 Cups", textAlign: TextAlign.start)),
                              Expanded(child: Text("Water")),
                            ],
                          ),


                        ],
                      ),
                    ) ,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
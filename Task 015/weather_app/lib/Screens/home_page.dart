import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var list = widget.weatherModel.forecastDay[0].hour;
    return Scaffold(
      backgroundColor: HexColor('#96b0c1'),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor('#738491'),
                ),
                child: Text(
                  'Today\'s Weather',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: isClicked == true ? 500 : 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor('#56636a'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.weatherModel.name,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${widget.weatherModel.tempC}°C',
                      style: TextStyle(
                        fontSize: 65,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https:${widget.weatherModel.mainIcon}',
                          ),
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          '${widget.weatherModel.text}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                'See details',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder:
                            (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index > 11
                                    ? Text(
                                      '${list[index].time.split(' ')[1].split(':')[0]} PM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                    : Text(
                                      '${list[index].time.split(' ')[1].split(':')[0]} AM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                Text(
                                  '${list[index].temp}°C',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Image(
                                  image: NetworkImage(
                                    'https:${list[index].icon}',
                                  ),
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            ),
                        separatorBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor('#738491'),
                ),
                child: Text(
                  'Weather this weak',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        padding: EdgeInsets.all(8),
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor('#56636a'),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            DateFormat('EEEE').format(
                          DateTime.parse(widget.weatherModel.forecastDay[index].data),
                        ),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.weatherModel.forecastDay[index].data,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image(
                              image: NetworkImage(
                                'https:${widget.weatherModel.forecastDay[index].listIcon}',
                              ),
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              '${widget.weatherModel.forecastDay[index].avgT}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  itemCount: widget.weatherModel.forecastDay.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

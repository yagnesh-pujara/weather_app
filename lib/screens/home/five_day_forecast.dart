import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/home/models/weather_model.dart';

class FiveDayForecast extends StatelessWidget {
  const FiveDayForecast({super.key, required this.groupedWeather});

  final Map<int, List<WeatherList>> groupedWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey.shade300,
      ),
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          //    Headings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Text(
                  '5-day Forecast',
                  style: GoogleFonts.robotoSlab(fontSize: 14.0),
                ),
              ),
              Row(
                children: [
                  Text(
                    'More Details ',
                    style: GoogleFonts.robotoSlab(fontSize: 14.0),
                  ),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            ],
          ),

          //    Details Of 3 Days
          ListView.builder(
            itemCount: groupedWeather.length > 3 ? 3 : groupedWeather.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<int> keys = groupedWeather.keys.toList();
              final item =
                  index == 0
                      ? groupedWeather[keys[index]]?.first
                      : groupedWeather[keys[index]]?[1];

              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/wn/${item?.weather.first.icon}@2x.png',
                          fit: BoxFit.cover,
                          scale: 2.0,
                        ),
                        Text(
                          getDay(item),
                          style: GoogleFonts.robotoSlab(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${item?.main.tempMin.round().toString()} / ${item?.main.tempMax.round().toString()}',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          //    5-day Forecast Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 100.0),
            ),
            onPressed: () {},
            child: Text('5-day forecast'),
          ),
        ],
      ),
    );
  }

  String getDay(WeatherList? item) {
    final now = DateTime.now();
    if (item?.dtTxt.day == now.day) {
      return 'Today';
    } else if (item?.dtTxt.day == now.day + 1) {
      return 'Tomorrow';
    } else {
      Map<int, String> days = {
        1: 'Monday',
        2: 'Tuesday',
        3: 'Wednesday',
        4: 'Thursday',
        5: 'Friday',
        6: 'Satursday',
        7: 'Sunday',
      };
      int day = now.weekday + 2;
      return days[day] ?? '';
    }
  }
}

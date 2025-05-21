import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/home/five_day_forecast.dart';
import 'package:weather_app/screens/home/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? _weather;
  final _weatherService = WeatherService("API_KEY");
  late Map<int, List<WeatherList>> groupedWeather = {};
  bool isLoading = true;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
        debugPrint('${_weather?.list.first.main.temp} ?? 0');
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
    debugPrint('${_weather?.list.first.main.temp} ?? 0');
  }

  Map<int, List<WeatherList>> groupByDay() {
    final Map<int, List<WeatherList>> grouped = {};

    for (var item in _weather?.list ?? []) {
      final int day = item.dtTxt.day;

      if (!grouped.containsKey(day)) {
        grouped[day] = [];
      }
      grouped[day]!.add(item);
    }

    return grouped;
  }

  Future<void> loadData() async {
    // Simulate API/data loading
    await Future.delayed(const Duration(seconds: 2), () => _fetchWeather());

    // Assume you already have your listWeather
    groupedWeather = groupByDay();
    // Replace with actual data
    setState(() {
      print(groupedWeather[20]?.first.dtTxt);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        title: Text(
          _weather?.city.name ?? "Loading...",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Stack(
        children: [
          if (!isLoading)
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.network(
                          'https://openweathermap.org/img/wn/${_weather?.list.first.weather.first.icon}@2x.png',
                          fit: BoxFit.cover,
                        ),
                      ),

                      Text(
                        '${((_weather?.list.first.main.temp)?.round() ?? 0)}°C',
                        style: GoogleFonts.bebasNeue(fontSize: 38),
                      ),

                      FiveDayForecast(groupedWeather: groupedWeather),
                    ],
                  ),
                ),
              ),
            ),

          // Loader overlay
          if (isLoading)
            Container(
              color: Colors.black38, // Optional dim background
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

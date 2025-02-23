import 'package:easy_weather_app/models/weather_model.dart';
import 'package:easy_weather_app/pages/search_weather_page.dart';
import 'package:easy_weather_app/providers/theme_provider.dart';
import 'package:easy_weather_app/services/weather_service.dart';
import 'package:easy_weather_app/utils/app_constant.dart';
import 'package:easy_weather_app/utils/app_text_style.dart';
import 'package:easy_weather_app/widgets/display_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env['WEATHER_API_KEY'] ?? "",
  );

  WeatherModel? _weather;

  //Method to Fetch the WeatherData
  void fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherByLocation();
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      debugPrint("Error fetching weather: $error");
      setState(() {
        _weather = null; // Or an error state variable
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Weather", style: AppTextStyle.mainTitle),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(
                context,
                listen: false,
              ).toggleTheme(Theme.of(context).brightness != Brightness.dark);
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,

              size: 35,
            ),
          ),
        ],
      ),
      body:
          _weather != null
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplayWeather(weather: _weather!),
                  SizedBox(height: AppConstant.kSizedBoxValue * 2),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 85, 255, 255),
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 106, 141, 255),
                            const Color.fromARGB(255, 85, 255, 255),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchWeatherPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Search Weather",
                          style: AppTextStyle.mainBodyText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Center(child: CircularProgressIndicator(color: Colors.blue)),
    );
  }
}

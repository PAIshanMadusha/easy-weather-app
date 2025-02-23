import 'package:easy_weather_app/models/weather_model.dart';
import 'package:easy_weather_app/services/weather_service.dart';
import 'package:easy_weather_app/utils/app_constant.dart';
import 'package:easy_weather_app/utils/app_text_style.dart';
import 'package:easy_weather_app/widgets/display_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env['WEATHER_API_KEY'] ?? "",
  );

  WeatherModel? _weather;
  String? _error;

  final TextEditingController _controller = TextEditingController();

  void _searchWeather() async {
    final city = _controller.text.trim();

    if (city.isEmpty) {
      setState(() {
        _error = "Please Enter a City Name";
      });
      return;
    }
    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (error) {
      setState(() {
        _error = "Couldn't Find Weather Data for $city";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstant.kPaddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  label: Text("Search"),
                  labelStyle: AppTextStyle.bodyText.copyWith(
                    color: Colors.blueGrey,
                    fontSize: 17,
                  ),
                  suffixIcon: IconButton(
                    onPressed: _searchWeather,
                    icon: Icon(Icons.search, size: 30, color: Colors.blueGrey),
                  ),
                  fillColor: const Color.fromARGB(255, 226, 242, 250),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 147, 170, 180),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                ),
                onSubmitted: (value) => _searchWeather(),
              ),
              SizedBox(height: AppConstant.kSizedBoxValue),
              _error != null
                  ? Text(
                    _error!,
                    style: AppTextStyle.bodyText.copyWith(
                      color: Colors.blue,
                      fontSize: 19,
                    ),
                  )
                  : _weather != null
                  ? DisplayWeather(weather: _weather!)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

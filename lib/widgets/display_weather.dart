import 'package:easy_weather_app/models/weather_model.dart';
import 'package:easy_weather_app/utils/app_constant.dart';
import 'package:easy_weather_app/utils/app_text_style.dart';
import 'package:easy_weather_app/utils/util_functions.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class DisplayWeather extends StatelessWidget {
  final WeatherModel weather;
  const DisplayWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppConstant.kPaddingValue),
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                UtilFunctions().getWeatherAnimation(
                  condition: weather.condition,
                ),
                width: 380,
                height: 380,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: AppConstant.kSizedBoxValue),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.kPaddingValue * 2,
                vertical: AppConstant.kPaddingValue * 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 224, 255, 84),
                    const Color.fromARGB(255, 204, 255, 85),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 254, 171),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(weather.cityName, style: AppTextStyle.mainBodyText),
                  Text(
                    "${weather.temperature.toStringAsFixed(1)}°C",
                    style: AppTextStyle.mainBodyText,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstant.kSizedBoxValue),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weather.condition.toUpperCase(),
                  style: AppTextStyle.bodyText,
                ),
                SizedBox(width: AppConstant.kSizedBoxValue),
                Text(
                  weather.description.toUpperCase(),
                  style: AppTextStyle.bodyText,
                ),
              ],
            ),
            SizedBox(height: AppConstant.kSizedBoxValue),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.kPaddingValue * 2,
                vertical: AppConstant.kPaddingValue * 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 224, 255, 84),
                    const Color.fromARGB(255, 204, 255, 85),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 254, 171),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildWeatherDetails("Humidity", "${weather.humidity} hPa"),
                  SizedBox(width: AppConstant.kSizedBoxValue),
                  _buildWeatherDetails("Pressure", "${weather.pressure} p"),
                  SizedBox(width: AppConstant.kSizedBoxValue),
                  _buildWeatherDetails("WindSpeed", "${weather.windSpeed} m/s"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(String label, String value) {
    return Column(
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyle.bodyText.copyWith(
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
        SizedBox(height: AppConstant.kSizedBoxValue),
        Text(value, style: AppTextStyle.bodyText),
      ],
    );
  }
}

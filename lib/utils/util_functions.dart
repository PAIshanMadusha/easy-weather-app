class UtilFunctions {
  //Get the Weather Animation Based on Condition
  String getWeatherAnimation({required String condition}) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/Animation4.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/Animation3.json";

      case "thunderstorm":
        return "assets/Animation2.json";

      case "clear":
        return "assets/Animation1.json";

      default:
        return "assets/Animation1.json";
    }
  }
}

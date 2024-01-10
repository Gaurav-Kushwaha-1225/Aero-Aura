// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/screens/home/local_widgets/current_weather_features_widget.dart';
import 'package:flutter/cupertino.dart';

class CurrentWeatherFeatures extends StatefulWidget {
  final Map<String, dynamic> current;
  final Map<String, dynamic> current_units;
  final Map<String, dynamic> daily;
  final Map<String, dynamic> daily_units;
  final Map<String, dynamic> hourly;
  final Map<String, dynamic> hourly_units;
  final bool isToday;
  const CurrentWeatherFeatures(
      {super.key,
      required this.current_units,
      required this.current,
      required this.daily_units,
      required this.daily,
      required this.hourly_units,
      required this.hourly,
      required this.isToday});

  @override
  State<CurrentWeatherFeatures> createState() => _CurrentWeatherFeaturesState();
}

class _CurrentWeatherFeaturesState extends State<CurrentWeatherFeatures> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      primary: false,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
      children: [
        CurrentWeatherFeaturesWidget(
            feature: "UV",
            icon: CupertinoIcons.sun_haze_fill,
            value: widget.isToday
                ? widget.hourly["uv_index"][0].toString()
                : widget.daily["uv_index_max"][1].toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Humidity",
            icon: CupertinoIcons.drop_fill,
            value: widget.isToday
                ? widget.current["relative_humidity_2m"].toString()
                : widget.hourly["relative_humidity_2m"].last.toString()),
        CurrentWeatherFeaturesWidget(
            feature: "S Wind",
            icon: CupertinoIcons.wind,
            value: widget.isToday
                ? widget.current["wind_speed_10m"].toString()
                : widget.daily["wind_speed_10m_max"][1].toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Air pressure",
            icon: CupertinoIcons.wind,
            value: widget.isToday
                ? widget.current["surface_pressure"].toString() : 
                widget.hourly["surface_pressure"].last.toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Cloud Cover",
            icon: CupertinoIcons.cloud_fill,
            value: widget.isToday
                ? widget.current["cloud_cover"].toString() : 
                widget.current["cloud_cover"].toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Visibility",
            icon: CupertinoIcons.eye_solid,
            value: widget.isToday
                ? widget.hourly["visibility"][0].toString():
                widget.hourly["visibility"].last.toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Rain's Odds",
            icon: CupertinoIcons.cloud_rain_fill,
            value: widget.isToday
                ? widget.hourly["precipitation_probability"][0].toString() :
                widget.daily["precipitation_probability_max"][1].toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Max Temp",
            icon: CupertinoIcons.sun_max_fill,
            value: widget.isToday
                ? widget.daily["temperature_2m_max"][0].toString()  :
                widget.daily["temperature_2m_max"][1].toString()),
        CurrentWeatherFeaturesWidget(
            feature: "Min Temp",
            icon: CupertinoIcons.sun_min_fill,
            value: widget.isToday
                ? widget.daily["temperature_2m_min"][0].toString() : 
                widget.daily["temperature_2m_min"][1].toString()),
      ],
    );
  }
}

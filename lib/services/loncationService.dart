import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as HTTP;

class Location {
  late List<LocationDto> data;
}

class LocationDto {
  late int? oid;
  late String? name;
  late String? remark;
  late int? dataByte;
  late double? lat;
  late double? lng;

  LocationDto({
    @required this.oid,
    @required this.name,
    @required this.remark,
    @required this.dataByte,
    @required this.lat,
    @required this.lng,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
        oid: json['oid'],
        name: json['name'],
        remark: json['remark'],
        dataByte: json['dataByte'],
        lat: json['lat'],
        lng: json['lng']);
  }
}

Future<List<LocationDto>?> getLocations(double lat, double lng, int layer,
    {int? page = 1, int? fetch = 10}) async {
  String _baseUrl = "localhost:5055";

  Uri uri = Uri.http(_baseUrl, '/api/location', {
    "Lat": "$lat",
    "Lng": "$lng",
    "Layer": "$layer",
    "DataType": "6",
    "Page": "$page",
    "Fetch": "$fetch"
  });

  try {
    final response = await HTTP.get(uri);

    if (response.statusCode == 200) {
      final services = jsonDecode(response.body)["data"]["result"];
      return services
          .map<LocationDto>((service) => LocationDto.fromJson(service))
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  } catch (e) {
    print("Exception throuwn $e");
  }
}

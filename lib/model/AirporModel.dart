class AirportsModel {
  String? code;
  String? airportName;
  String? cityName;
  String? countryName;
  String? searchContents;

  AirportsModel(
      {this.code,
        this.airportName,
        this.cityName,
        this.countryName,
        this.searchContents});

  AirportsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    airportName = json['airport_name'];
    cityName = json['city_name'];
    countryName = json['country_name'];
    searchContents = json['search_contents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['airport_name'] = this.airportName;
    data['city_name'] = this.cityName;
    data['country_name'] = this.countryName;
    data['search_contents'] = this.searchContents;
    return data;
  }
}

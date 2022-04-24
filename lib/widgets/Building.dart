
// Building represents a searchable location so that users can find a building based on
// building code given by class rosters
class Building {
  // Buildings have a code and a lat/long location
  late String code;
  late double lat;
  late double long;

  Building(String code, double lat, double long) {
    this.code = code;
    this.lat = lat;
    this.long = long;
  }

  reBuild(String code, double lat, double long) {
    this.code = code;
    this.lat = lat;
    this.long = long;
  }

  getCode() {
    return this.code;
  }

  getLat() {
    return this.lat;
  }

  getLong() {
    return this.long;
  }
}
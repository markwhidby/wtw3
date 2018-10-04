class StartingPoint {
  final String name;
  final double latitude;
  final double longitude;
  final String city;
  final String state;
  final String zip;

  StartingPoint({this.name, this.latitude, this.longitude, this.city, this.state, this.zip});

  static List<StartingPoint> allStartingPoints () {
    var lstOfSPs = new List<StartingPoint>();

    lstOfSPs.add(new StartingPoint(name:'Bassline', latitude:47.586, longitude:122.443, city:'Kirkland', state:'WA',zip:'98004'));
    lstOfSPs.add(new StartingPoint(name:'Home', latitude:47.726111, longitude:122.063056, city:'Woodinville', state:'WA',zip:'98004'));
    lstOfSPs.add(new StartingPoint(name:'Work', latitude:47.586, longitude:122.443, city:'Bellevue', state:'WA',zip:'98004'));
    lstOfSPs.add(new StartingPoint(name:'Downtown', latitude:47.586, longitude:122.443, city:'Seattle', state:'WA',zip:'98004'));
    lstOfSPs.add(new StartingPoint(name:'Keith AZ', latitude:42.586, longitude:122.443, city:'Glendale', state:'AZ',zip:'98004'));

    return lstOfSPs;
  }
}

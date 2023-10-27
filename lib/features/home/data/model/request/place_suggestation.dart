class PlaceSuggestation{
 late String placeId;
 late String description;
 PlaceSuggestation.fromJson(Map<String,dynamic>json) {
   placeId=json["place_id"].toString();
   description=json["description"].toString();
 }
}
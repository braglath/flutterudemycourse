class ImageModel {
  late String activity;
  late int  participants;
  ImageModel(this.activity, this.participants);
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    activity = parsedJson['activity'];
    participants = parsedJson['participants'];
  }
}

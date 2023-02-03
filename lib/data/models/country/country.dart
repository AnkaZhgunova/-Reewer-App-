class Country {
  int? id;
  String? name;
  String? emoji;
  String? emojiU;
  String? iso2;
  String? iso3;
  int? countryCode;

  Country({
    this.id,
    this.name,
    this.emoji,
    this.emojiU,
    this.iso2,
    this.iso3,
    this.countryCode,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    countryCode = json['countrycode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['emoji'] = emoji;
    data['emojiU'] = emojiU;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['countrycode'] = countryCode;

    return data;
  }
}

class Objects {
  int? id;
  String? name;
  int? regionId;
  int? companiesId;
  String? city;
  String? address;
  String? start;
  String? end;
  String? image;
  String? stage;
  String? padez;
  String? short;
  int? number;

  Objects({
    this.id,
    this.name,
    this.regionId,
    this.companiesId,
    this.city,
    this.address,
    this.start,
    this.end,
    this.image,
    this.stage,
    this.padez,
    this.short,
    this.number,
  });

  // Convert an Objects instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'regionId': regionId,
      'companiesId': companiesId,
      'city': city,
      'address': address,
      'start': start,
      'end': end,
      'image': image,
      'stage': stage,
      'padez': padez,
      'short': short,
      'number': number,
    };
  }

  // Convert a JSON map into an Objects instance
  factory Objects.fromJson(Map<String, dynamic> json) {
    return Objects(
      id: json['id'],
      name: json['name'],
      regionId: json['regionId'],
      companiesId: json['companiesId'],
      city: json['city'],
      address: json['address'],
      start: json['start'],
      end: json['end'],
      image: json['image'],
      stage: json['stage'],
      padez: json['padez'],
      short: json['short'],
      number: json['number'],
    );
  }
}

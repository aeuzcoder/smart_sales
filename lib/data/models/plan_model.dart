class Plan {
  int? id;
  int? objectId;
  String? name;
  String? link;
  String? createdAt;
  String? updatedAt;
  String? link2d;
  String? location;

  Plan({
    this.id,
    this.objectId,
    this.name,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.link2d,
    this.location,
  });

  // Convert a Plan instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object_id': objectId,
      'name': name,
      'link': link,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'link2d': link2d,
      'location': location,
    };
  }

  // Convert a JSON map into a Plan instance
  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      objectId: json['object_id'],
      name: json['name'],
      link: json['link'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      link2d: json['link2d'],
      location: json['location'],
    );
  }
}

class Custom {
  int? id;
  String? name;
  String? surname;
  String? middlename;
  int? clientType;
  String? phone;
  String? phone2;
  int? balance;
  int? valute;

  Custom({
    this.id,
    this.name,
    this.surname,
    this.middlename,
    this.clientType,
    this.phone,
    this.phone2,
    this.balance,
    this.valute,
  });
  factory Custom.fromJson(Map<String, dynamic> json) {
    return Custom(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
      middlename: json["middlename"],
      clientType: json["client_type"],
      phone: json["phone"],
      phone2: json["phone2"],
      balance: json["balance"],
      valute: json["valute"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "middlename": middlename,
        "client_type": clientType,
        "phone": phone,
        "phone2": phone2,
        "balance": balance,
        "valute": valute,
      };
}

class PaymentListModel {
  int? id;
  String? paymentDate;
  int? contractId;
  int? sum;
  int? isDefault;
  int? status;
  int? left;

  PaymentListModel({
    this.id,
    this.paymentDate,
    this.contractId,
    this.sum,
    this.isDefault,
    this.status,
    this.left,
  });

  // Десериализация из JSON
  factory PaymentListModel.fromJson(Map<String, dynamic> json) {
    return PaymentListModel(
      id: json['id'],
      paymentDate: json['payment_date'],
      contractId: json['contract_id'],
      sum: json['sum'],
      isDefault: json['default'],
      status: json['status'],
      left: json['left'],
    );
  }

  // Сериализация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'payment_date': paymentDate,
      'contract_id': contractId,
      'sum': sum,
      'default': isDefault,
      'status': status,
      'left': left,
    };
  }
}

class PaymentMethodModel {
  final String visaType;
  final int id;
  final String visaLastFour;
  final String paymentMethod;
  bool isSelected;

  PaymentMethodModel(
      {required this.visaType,
      required this.id,
      required this.visaLastFour,
      required this.paymentMethod,
      this.isSelected = false});

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      visaType: json['visatype'],
      id: json['id'],
      visaLastFour: json['visa_last_four'],
      paymentMethod: json['payment_method'],
    );
  }

  static String jsonString = '''
    [
      {"visatype": "Type A", "id": 1, "visa_last_four": "1234", "payment_method": "Mastercard"},
      {"visatype": "Type B", "id": 2, "visa_last_four": "5678", "payment_method": "Visa"},
      {"visatype": "Type C", "id": 3, "visa_last_four": "9012", "payment_method": "Mastercard"}
    ]
  ''';
}

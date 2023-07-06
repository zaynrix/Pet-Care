class Pharmacy {
  final String title;
  final String subtitle;
  final String estimatedArrival;
  final double price;
  final bool deliveryAvailable;
  final double deliveryFee; // New field for delivery fee

  // Constructor with the new deliveryFee parameter
  Pharmacy({
    required this.title,
    required this.subtitle,
    required this.estimatedArrival,
    required this.price,
    required this.deliveryAvailable,
    required this.deliveryFee,
  });
}

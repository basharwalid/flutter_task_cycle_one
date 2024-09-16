class ProductRating {
  final double rate;
  final int count;

  ProductRating({required this.rate, required this.count});

  // Constructor to initialize the class from JSON
  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

  // Convert the class to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

class ProductEntity {

  final int id;
  final String name;
  final String cover;
  final String description;
  final int price;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.cover,
    required this.description,
    required this.price
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
        id: json['id'],
        name: json['name'],
        cover: json['cover'],
        description: json['desc'],
        price: json['price']
    );
  }

}
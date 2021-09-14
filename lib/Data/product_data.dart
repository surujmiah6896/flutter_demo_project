class Product {
  final int id;
  final String name;
  final String imageUrl;
  final String price;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

List<Product> products = [a, b, c, d];

final Product a = Product(
    id: 1, name: 'Mi 34', imageUrl: 'assets/images/p_1.png', price: '200 tk');
final Product b = Product(
    id: 2, name: 'Nokia', imageUrl: 'assets/images/p_4.png', price: '105 tk');
final Product c = Product(
    id: 3, name: 'Samsung', imageUrl: 'assets/images/p_1.png', price: '100 tk');
final Product d = Product(
    id: 4, name: 'M1', imageUrl: 'assets/images/p_3.jpg', price: '50 tk');

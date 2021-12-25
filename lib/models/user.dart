class Listing {
  String name;
  String email;
  String uid;
  String? photoUrl;
  List<String>? itemsToSell;
  List<String>? itemsInCart;
  List<String>? watchList;

  Listing({
    required this.name,
    required this.email,
    required this.uid,
    this.itemsToSell,
    this.photoUrl,
  });
}

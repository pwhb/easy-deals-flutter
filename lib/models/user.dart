class UserModel {
  String? name;
  String email;
  String? photoUrl;
  List<String>? itemsToSell;
  List<String>? itemsInCart;
  List<String>? watchList;

  UserModel({
    this.name,
    required this.email,
    this.itemsToSell,
    this.photoUrl,
    this.itemsInCart,
    this.watchList
  });
}

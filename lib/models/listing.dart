class ListingModel {
  String itemName;
  String sellerUid;
  bool isUsed;
  DateTime createdAt;
  DateTime editedAt;
  int price;
  bool isActive;
  List<String>? comments;
  List<String>? votes;
  String? category;
  String? description;
  List<String>? itemPhotos;

  ListingModel({
    required this.itemName,
    required this.sellerUid,
    required this.createdAt,
    required this.editedAt,
    required this.isActive,
    required this.price,
    this.category,
    this.itemPhotos,
    this.isUsed = false,
    this.comments,
    this.description,
    this.votes,
  });
}

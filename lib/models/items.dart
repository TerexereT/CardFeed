class ItemCard {
  int? id;
  String? title;
  double? price;
  String? thumbnail;

  ItemCard({this.id, this.title, this.price, this.thumbnail});

  ItemCard.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

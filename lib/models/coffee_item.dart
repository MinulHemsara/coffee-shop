class CoffeeItem {
  double? rating;
  String? Itemimg;
  String? title;
  String? subtitle;
  double? price;

  CoffeeItem({
    this.rating,
    this.Itemimg,
    this.title,
    this.subtitle,
    this.price,
  });

  CoffeeItem.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    Itemimg = json['itemImg'];
    title = json['title'];
    subtitle = json['subtitle'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['itemImg'] = this.Itemimg;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['price'] = this.price;
    return data;
  }
}

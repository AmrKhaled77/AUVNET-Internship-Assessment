

class HomeModel {
  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'] ?? 'no message';
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Data = <String, dynamic>{};
    Data['status'] = status;
    Data['message'] = message;
    Data['data'] = data.toJson();
    return Data;
  }
}

class Data {
  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });
  late final List<Banners> banners;
  late final List<Products> products;
  late final String ad;

  Data.fromJson(Map<String, dynamic> json){
    banners = List.from(json['banners']).map((e)=>Banners.fromJson(e)).toList();
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banners'] = banners.map((e)=>e.toJson()).toList();
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['ad'] = ad;
    return _data;
  }
}

class Banners {
  Banners({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });
  late final int id;
  late final String image;
  late final Null category;
  late final Null product;

  Banners.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    category = null;
    product = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['category'] = category;
    _data['product'] = product;
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  late final int id;
  late final num? price;
  late final num? oldPrice;
  late final int discount;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool inFavorites;
  late final bool inCart;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}

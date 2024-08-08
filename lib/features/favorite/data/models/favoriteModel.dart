class FavoriteModel {
  FavoriteModel({
    required this.status,
    required this.message,
    required this.elemnt,
  });
  late final bool status;
  late final String message;
  late final Elemnt elemnt;

  FavoriteModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message =json['message']??'';
    elemnt = Elemnt.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = elemnt.toJson();
    return _data;
  }
}

class Elemnt {
  Elemnt({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  Elemnt.fromJson(Map<String, dynamic> json){

    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['data'] = data.map((e)=>e.toJson()).toList();

    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.product,
  });
  late final int id;
  late final Product product;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product'] = product.toJson();
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });
  late final int id;
  late final num price;
  late final num oldPrice;
  late final num  discount;
  late final String image;
  late final String name;
  late final String description;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['old_price'] = oldPrice;
    _data['discount'] = discount;
    _data['image'] = image;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}
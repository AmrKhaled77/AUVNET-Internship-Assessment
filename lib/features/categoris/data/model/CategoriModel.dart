class CategoriModel {
  CategoriModel({
    required this.status,
    required this.message,
    required this.elments,
  });
  late final bool status;
  late final String message;
  late final Elments elments;

  CategoriModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message']??'';
    elments = Elments.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['elments'] = elments.toJson();
    return _data;
  }
}

class Elments {
  Elments({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,

    required this.path,
    required this.perPage,

    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;

  late final String path;
  late final int perPage;

  late final int to;
  late final int total;

  Elments.fromJson(Map<String, dynamic> json){
    // currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    // firstPageUrl = json['first_page_url'];
    // from = json['from'];
    // lastPage = json['last_page'];
    // lastPageUrl = json['last_page_url'];
    //
    // path = json['path'];
    // perPage = json['per_page'];
    //
    // to = json['to'];
    // total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['current_page'] = currentPage;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    // _data['first_page_url'] = firstPageUrl;
    // _data['from'] = from;
    // _data['last_page'] = lastPage;
    // _data['last_page_url'] = lastPageUrl;
    //
    // _data['path'] = path;
    // _data['per_page'] = perPage;
    //
    // _data['to'] = to;
    // _data['total'] = total;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String image;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}
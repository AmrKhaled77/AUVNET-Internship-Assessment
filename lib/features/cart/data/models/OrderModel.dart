
class OrderModel {
  bool? status;
  String? message;
  Data? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = 'a';
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  num? currentPage;
  List<DataTWO>? data2;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;

  String? path;
  num? perPage;

  num? to;
  num? total;

  Data(
      {this.currentPage,
      this.data2,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,

      this.path,
      this.perPage,

      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data2 = <DataTWO>[];
      json['data'].forEach((v) {
        data2!.add(new DataTWO.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data2 != null) {
      data['data'] = this.data2!.map((v) => v.toJson()).toList();
    }

    data['from'] = this.from;

    data['path'] = this.path;
    data['per_page'] = this.perPage;

    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataTWO {
  num? id;
  num? total;
  String? date;
  String? status;

  DataTWO({this.id, this.total, this.date, this.status});

  DataTWO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}

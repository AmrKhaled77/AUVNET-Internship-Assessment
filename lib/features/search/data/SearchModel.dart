


class Data{

  num? id;
  num? price;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;


  Data(
      this.description,this.images,this.image,this.name,this.price,this.id

      );

factory Data.fromjson(Map<String,dynamic>json){



  return Data(json['description'],
      json['images'],
      json['image'],
      json['name'],
      json['price'],
      json['id'],


  );



}
}
class SearchModel {

  List<Data>? data;

  SearchModel({this.data});

  factory SearchModel.fromjson(Map<String,dynamic>json){


    return SearchModel(data:

    List.from(json['data']['data']).map((e)=>Data.fromjson(e)).toList()

    );


  }



}
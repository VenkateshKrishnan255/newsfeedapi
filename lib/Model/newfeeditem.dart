
import 'data.dart';

class NewFeedItem{
  String? status;
  List<Data>? data;

  NewFeedItem(String status, List<Data> listitem){
    this.status;
    this.data;
  }

  NewFeedItem.fromJson(Map<String, dynamic> json){
    status = json['status'];
    if(json['data'] == null){
      data = <Data>[];
      json['data'].forEach((v){
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> datas = new Map<String, dynamic>();
    datas['status'] = this.status;
    if(this.data != null){
      datas['data'] = this.data!.map((v) => toJson()).toList();
    }
    return datas;
  }
}
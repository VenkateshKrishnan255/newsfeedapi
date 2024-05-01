class Data{
  String? source;
  String? tittle;
  String? link;
  String? description;
  String? pubDate;

  ListItem(String source, String tittle, String link, String description, String pubDate){
    this.source = source;
    this.tittle = tittle;
    this.link = link;
    this.description = description;
    this.pubDate = pubDate;
  }

  Data.fromJson(Map<String, dynamic> json){
    source = json['source'];
    tittle = json['tittle'];
    link = json['link'];
    description = json['description'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['tittle'] = this.tittle;
    data['link'] = this.link;
    data['description'] = this.description;
    data['pudDate'] = this.pubDate;
    return data;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_newsfeedapi_venkat/Model/newfeeditem.dart';
import 'package:flutter_newsfeedapi_venkat/Server/newfeedserver.dart';

import '../Model/data.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {

  late List<Data> _data = [];

  @override
  void initState() {
    super.initState();
    _loadNewFeed();
  }
  Future<void> _loadNewFeed() async{
    try{
      NewFeedItem response = await NewFeedServer.fetchNewFeed();
      setState(() {
        _data = response.data!;
        print('---------------->RequiredId :${response.status}');
      });
    }catch (e){
      print("Error Loading Lesson: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Feed'),
        centerTitle: true,
      ),
      body: _data == null || _data.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                Text('Source : ${_data[index].source}'),
                Text('Tittle : ${_data[index].tittle}'),
                Text('Link : ${_data[index].link}'),
                Text('Description : ${_data[index].description}'),
                Text('PubDate : ${_data[index].pubDate}'),
              ],
            ),
          );
        },
      )
    );
  }
}

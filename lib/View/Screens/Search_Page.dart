import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _textEditingController = TextEditingController();
  final _databaseReference = FirebaseDatabase.instance.reference();

  List<Map<dynamic, dynamic>> _searchResults = [];

  void _search(String searchText) {
    List<Map<dynamic, dynamic>> searchResults = [];

    _databaseReference.child('your_database_path_here').onValue.listen((event) {
      if (event.snapshot.value != null) {
        Object? data = event.snapshot.value;
        data.hashCode;
      }

      setState(() {
        _searchResults = searchResults;
      });
    }, onError: (error) {
      print(error);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (searchText) {
                _search(searchText);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResults[index]['name']),
                  onTap: () {
                    // Navigate to the details page for the selected item
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

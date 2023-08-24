import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/Model/Search%20Model.dart';
import 'package:http/http.dart' as http;
import '../../components/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Search Example');


  Future<SearchModel> getData() async {
    final response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/search/charger"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      List tempList = [];

      for (int i = 0; i < SearchModel.fromJson(data).products.data.length; i++) {
        tempList.add(SearchModel.fromJson(data).products.data[i]);
      }
      print(tempList);
      return SearchModel.fromJson(data);

    } else {
      return SearchModel.fromJson(data);
    }
  }
  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }
  Widget _buildList()
  {
    if ((_searchText.isNotEmpty)) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount:  filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        leading:  IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return SizedBox(
              height: 500.0,
          child: ListView.builder(
          itemCount: snapshot.data!.products.data.length,
          itemBuilder: (BuildContext context,int index) {
          return SizedBox(
            height: 100.0,
            width: 200.0,
            child: ListTile(
            title: SizedBox(
              width: 200.0,
                child: Text(snapshot.data!.products.data[index].proName)),
            leading: Container(
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://readyelectronics.com.bd/${snapshot.data!.products.data[index].image.image}")
                )
              ),
            ),
            onTap: () {
            },
            ),
          );
          })

          );
          }
          else{
            return const CircularProgressIndicator();
          }
        },
      )

    );
  }
}

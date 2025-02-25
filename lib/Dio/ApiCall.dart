import 'dart:async';

import 'package:flutter/material.dart';
import "package:dio/dio.dart";


class _MyAPICallState extends StatefulWidget {
  const _MyAPICallState();

  @override
  State<_MyAPICallState> createState() => __MyAPICallStateState();
}

class __MyAPICallStateState extends State<_MyAPICallState> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {

 var jsonList;

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

void getData() async {
   try{
    
    var response = await Dio().get("https://protocoderspoint.com/jsondata/superheros.json");
    print(response);
    if (response.statusCode == 200) {
      setState(() {
        //final close = context.showLoading(msg: "Loading", textColor: Colors.white);
        //Future.delayed(2.seconds, close as FutureOr Function()?);
        jsonList = response.data["superheros"] as List;

      });
      
    }else{
      print(response.statusCode);
    }
   }catch(e){
    print(e);
   }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(jsonList[index]['url'], fit: BoxFit.fill, width: 50, height: 50,),
                ),
                title: Text(jsonList[index]['name']),
                subtitle: Text(jsonList[index]['power']),
                
              ),
            );
          },
          itemCount: jsonList == null ? 0 : jsonList.length,
          
          ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    // Simulate network fetch or database query
    await Future.delayed(const Duration(seconds: 2));
    // Update the list of items and refresh the UI
    setState(() {
      //items = List.generate(20, (index) => "Refreshed Item ${index + 1}");
    });

  }
}
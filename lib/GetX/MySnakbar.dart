import 'package:flutter/material.dart';
import 'package:flutter_travel_app/Dio/ApiCall.dart';
import 'package:get/get.dart';

class MySnakbarPage extends StatelessWidget {
  const MySnakbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Snakbar",
      home: Scaffold(
        appBar: AppBar(title: const Text("Snakbar App")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(onPressed: (){
                  Get.to(
                    const NetworkPage(),
                    //fullscreenDialog: true,
                  );
                }, child: const Text("Goto Marvel Character Screen")),
                
              ),
              TextButton(
              style: TextButton.styleFrom(
                //foregroundColor Colors.red,
                //foregroundBuilder: Colors.blue,
              ),
              onPressed: () {
                //---------snak bar work------------
                /*
                Get.snackbar(
                  "Title", "This is my message.",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.amber,
                  backgroundColor: Colors.blueGrey,
                  borderRadius: 30,
                  isDismissible: true,
                  forwardAnimationCurve: Curves.bounceInOut,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                  );*/

                  //-----------dialog bar--------------
                  /*
                  Get.defaultDialog(
                    textCancel: "Cancel",
                    onCancel: () {
                      Get.back();
                    },
                    textConfirm: "O.K",
                    onConfirm: () {
                      Get.back();
                    },
                    actions: [
                      ElevatedButton(
                      
                      //style: raisedButtonStyle,
                      onPressed: () { 
                        Get.back();
                      },
                      child: Text('RaisedButton'),
                    )
                                          
                    ]
                  );*/
                
                //----------Bottom-sheet-----------
                Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wb_sunny_outlined),
                          title: const Text("Light Theme"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.wb_sunny),
                          title: const Text("Dark Theme"),
                          onTap: () {  
                            Get.changeTheme(ThemeData.dark());   
                          },
                        )
                      ],
                    ),
                  ),
                  //barrierColor: Colors.greenAccent.shade100,
                  backgroundColor: Colors.greenAccent.shade200,

                );
               },
              child: const Text('Show Snakbar'),
              )
            ],
          ),
        ),
      ),

    );
  }
}
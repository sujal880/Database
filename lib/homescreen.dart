import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wslc_147_database/dbhelper.dart';
import 'package:wslc_147_database/uihelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  void addData(String title,String description)async{

    if(title=="" && description==""){
      UiHelper.CustomDialog(context, "Enter Required Fields");
    }
    else{
      DbHelper().addData(title, description);
      log("Data Inserted");
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        UiHelper.CustomTextField(titleController,"Title", Icons.title),
        UiHelper.CustomTextField(descriptionController,"Description", Icons.description),
        SizedBox(height: 30),
        ElevatedButton(onPressed: (){
          addData(titleController.text.toString(), descriptionController.text.toString());
        }, child: Text("Save"))
      ],),
    );
  }
}

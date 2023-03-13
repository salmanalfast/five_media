import 'package:flutter/material.dart';
import 'crud_request.dart';

class CrudFormClass extends StatefulWidget {
  const CrudFormClass({super.key});

  @override
  State<CrudFormClass> createState() => _CrudFormClassState();
}

class _CrudFormClassState extends State<CrudFormClass> {
  PostResult? postResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Exercise"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Text((postResult != null)
                  ? "${postResult!.id} | ${postResult!.name} | ${postResult!.job} | ${postResult!.created}"
                  : "No Data"),
            ),
            /*ElevatedButton(onPressed: (){
                PostResult.createPostResult("Carl", "Freelance").then((value){
                  postResult = value;
                  setState((){});
                });
              }, child: const Text("Submit")),*/
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Name"),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return "Please Input Your Name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Job"),
                    validator: (job) {
                      if (job == null || job.isEmpty) {
                        return "Please Input Your Job";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        PostResult.createPostResult;
                      },
                      child: const Text("Submit"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

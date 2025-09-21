import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("loginscreen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "USERNAME",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(decoration: InputDecoration(
                            hintText: "PASSWORD",
                            border: OutlineInputBorder()
            ),),
            ElevatedButton(onPressed: (){}, child: Text("login"))
          ],
        ),
      ),
    );
  }
}

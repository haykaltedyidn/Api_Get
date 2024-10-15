import 'package:flutter/material.dart';
import 'package:getapi_/screen/api1.dart'; 
import 'package:getapi_/screen/api2.dart'; 

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddUserPage(),
                    ),
                  );
                },
                child: const Text('Api 1'),
              ),
              SizedBox(height: 10), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageApiTwo(),
                    ),
                  );
                },
                child: const Text('Api 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

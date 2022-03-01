import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Form"),
        ),
        body: const MainForm(),
      ),
    );
  }
}

class MainForm extends StatefulWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {

  final formKey = GlobalKey<FormState>();

  String username = " ";
  String password = " ";
  String email = " ";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Username',
              ),
              onChanged: (value){
                setState(() {
                  username = value;
                });
              },
              validator: (value){
                if(value!.length < 8){
                  return 'Enter atleast 8 characters';
                }
                else{
                  return null;
                }
              },
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },
              validator: (value){
                if(value!.length == 0){
                  return 'Enter password';
                }
                else{
                  return null;
                }
              },
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email address',
              ),
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
              validator: (value){
                if(value!.length == 0
                ){
                  return 'Enter email address';
                }
                else{
                  return null;
                }
              },
            ),
            const SizedBox(height: 50.0,),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                  onPressed: (){
                    //Automatically gets executed in validator section
                    final isValid = formKey.currentState!.validate();
                    if(isValid){
                      formKey.currentState!.save();
                      final message = '$username your account is created successfully';
                      final snackBar = SnackBar(
                          content: Text(
                            message,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        backgroundColor: Colors.blueGrey,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('SUBMIT'),
                      SizedBox(width: 10.0,),
                      Icon(Icons.check),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


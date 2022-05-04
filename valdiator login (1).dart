import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: login()));
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
bool _validate = false;
//Late String name;
//Late String age;

class _State extends State<login> {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("images/bts.jpg"),
              fit: BoxFit.fill,
            )),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 180,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Form(
                key: _formKey,
                child: TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: InputBorder.none,
                      labelText: 'Email',
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      labelStyle: TextStyle(
                        fontFamily: 'Redressed',
                        fontSize: 30,
                      ),
                      icon: Icon(
                        Icons.mail,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(22),
              ),
              child: TextField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: InputBorder.none,
                    labelText: 'Password',
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    labelStyle: TextStyle(
                      fontFamily: 'Redressed',
                      fontSize: 30,
                    ),
                    icon: Icon(
                      Icons.lock,
                    )),
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width - 200,
              onPressed: () {
                setState(() {
                  _email.text.isEmpty ? _validate = true : _validate = false;
                  _password.text.isEmpty ? _validate = true : _validate = false;
                });
                if (_validate != true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            userName: _email.text,
                            userNumber: _password.text,
                          )));
                }
              },
              child: Text(
                "LogIn",
                style: TextStyle(
                  fontFamily: 'Redressed',
                  fontSize: 30,
                ),
              ),
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String userName = "";
  String userNumber = "";
  SecondScreen({required this.userNumber, required this.userName});

  // receive data from the FirstScreen as a parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Information')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName,
              style: TextStyle(fontSize: 24),
            ),
            //_sizedBox,
            Text(
              userNumber,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

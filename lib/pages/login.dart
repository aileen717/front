import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Padding (
          padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key:  formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          label: Text('Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value){
                          if(value == null|| value.isEmpty){
                            return 'Provide a valid email';
                          }
                          return null;
                        },
                        onSaved: (value){
                          email = value!;
                        }
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          label: Text('Password',),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value){
                          if(value == null|| value.isEmpty){
                            return 'Provide a password';
                          }
                          return null;
                        },
                        onSaved: (value){
                          password = value!;
                        }
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        print(email);
                        print(password);
                      }
                    },
                      child: Text('Log in',
                      style: TextStyle(
                        fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          'Don`t have an account?',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Sign up here',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue[900]
                            ),
                          ),
                          onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


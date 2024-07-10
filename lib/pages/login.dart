import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appkctechast/services/user.dart';

import '../services/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log In');

  Widget loadingDisplay = CircularProgressIndicator();

  login(User user )async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Context-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.email,
        'password': user.password
    }),
    );
    if(response.statusCode == 200) {
      return true;
    }
    return false;

   // print(response.body);
  }

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
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          label: Text('Password',),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureIcon),
                            onPressed: (){
                              setState(() {
                                _obscure = !_obscure;
                                if(_obscure){
                                  _obscureIcon = Icons.visibility_off;
                                }else {
                                  _obscureIcon = Icons.visibility_off;
                                }
                              });
                            },
                          ),
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
                      setState(() {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          User user = User(
                            username: '',
                            email: 'email',
                            password: 'password'
                          );
                          /*if(login(user)){
                            Navigator.pushReplacementNamed(context, '/');
                          }*/
                          setState(() {
                            buttonContent = FutureBuilder(
                                future: login(user),
                                builder: (context, snapshots){
                                  if(snapshots.connectionState == ConnectionState.waiting){
                                    return loadingDisplay;
                                  }
                                  if(snapshots.hasData){

                                  }
                                  return Text('Log in');
                                }
                            );
                          });
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      });
                    },
                      child: buttonContent,
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


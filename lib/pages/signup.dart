import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
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
                'Let`s Get Started!',
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
                      maxLength: 50,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text('Full Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null|| value.isEmpty){
                          return 'Provide a name';
                        }
                        if(value.length < 5){
                          return 'Name should be at least 5 characters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      }
                    ),
                    SizedBox(height: 15,),
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
                        if(value.length < 5){
                          return 'Email should be 5 characters long';
                        }
                        return null;
                      },
                        onSaved: (value){
                          email = value!;
                        }
                    ),
                    SizedBox(height: 35,),
                    TextFormField(
                        maxLength:20,
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
                        if(value.length < 8){
                          return 'Password should be at least 8 characters long';
                        }
                        if(value.length > 20){
                          return 'Password should be 20 characters long only';
                        }
                        return null;
                      },
                        onSaved: (value){
                          password = value!;
                        }
                    ),
                    SizedBox(height: 15.0,),
                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        print(name);
                        print(email);
                        print(password);
                      }
                    },
                        child: Text('Sign up',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                        ),
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

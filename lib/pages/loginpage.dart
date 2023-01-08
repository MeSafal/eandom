import 'package:flutter/material.dart';
// import 'package:testapp/Home/home.dart';
import 'package:testapp/folder/networkhelper.dart';
import 'package:testapp/folder/loginmodel.dart';
// import 'package:testapp/pages/showres.dart';
import 'package:testapp/pages/signin.dart';
import 'package:testapp/folder/navigation.dart' as nv;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  bool rem = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 16,
            ),
            children: [
              Image.asset(
                'images/img.png',
                width: 147,
                height: 135,
              ),
              Text(
                '    log in to conntinue',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: rem,
                    onChanged: (val) {
                      setState(
                        () {
                          rem = !rem;
                        },
                      );
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '       Forget Password?',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    var phoneData = phoneController.text.toString();
                    var passwordData = passwordController.text.toString();
                    //9849203704
                    //Nepal@12344
                    if (_formkey.currentState!.validate()) {
                      Login logindata = await NetworkHelper().getLogin(
                        phone: phoneData,
                        password: passwordData,
                      );
                      var status = logindata.status;
                      print('ERROR: $status');
                      if (status == 'success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return nv.NavigationPage();
                        }));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: AlertDialog(
                                title: Text(
                                    'Error Wrong Username or Password\n Please Enter agian'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        //print('error');
                      }
                    } else {
                      print('error');
                    }
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SigninPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign up.',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return nv.NavigationPage();
                    }));
                  },
                  child: Text(
                    'View as guest.',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

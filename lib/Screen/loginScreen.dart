import 'package:durianmeters/Modules/userPrfile.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  UserProfile userProfile = UserProfile();
  var _chkTextBox = false;
  var _hiddenPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).copyWith().size.width;
    double height = MediaQuery.of(context).copyWith().size.height;


    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 50),
        width: width,
        height: height,
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //-----------------------LOGO---------------------------------------
                  Container(
                    alignment: Alignment.center,
                    height: height*.2,
                    child: Text('LOGO',textAlign: TextAlign.start,style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
                  ),
                  //-----------------------LOGIN---------------------------------------
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: GradientText(
                      'LOGIN',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                      colors: [
                        Colors.blue.shade900,
                        Colors.green.shade400,
                        Colors.green.shade400,
                        Colors.green.shade400,
                        Colors.green.shade400,
                      ],
                      gradientType: GradientType.linear,
                    ),
                  ),
                  //-----------------------E-MAIL---------------------------------------
                  _buildTextField(TextInputType.emailAddress, "EMAIL", "example@gmail.com"),
                  //-----------------------PASSWORD---------------------------------------
                  _buildPasswordField("PASSWORD", "123456"),
                  //-----------------------REMEMBERME AND FORGOTPASSWORD---------------------------------------
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //-----------------------REMEMBERME---------------------------------------
                            IconButton(
                              icon: Icon(_chkTextBox ? Icons.check_box : Icons.check_box_outline_blank),
                              onPressed: (){
                                _setStateChkBox();
                              },
                            ),
                            Text("Remember Me.",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                        //-----------------------FORGOT PASSWORD---------------------------------------
                        InkWell(
                            child: new Text('Forgot Password',style: TextStyle(fontSize: 12,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),
                            onTap: () {
                              print("FORGOT PASSWORD");
                            }
                        ),
                      ],
                    ),
                  ),
                  //-----------------------BUTTON LOGIN---------------------------------------
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          print(userProfile.username);
                          print(userProfile.password);
                          _formKey.currentState!.reset();
                        }

                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF66BB6A),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 60.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'LOGIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //-----------------------REGISTER LINK---------------------------------------
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('No Account'),
                        InkWell(
                          child: new Text('Register',style: TextStyle(fontSize: 12,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),
                          onTap: () {
                            print("GO PAGE REGISTER");
                          }
                        ),
                      ],
                    ),
                  ),
                  //-----------------------LOGIN WITH SOCIAL---------------------------------------
                  Container(
                      padding:EdgeInsets.all(10),
                      child: Text('Login With',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    padding:EdgeInsets.all(10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //-----------------------FACEBOOK---------------------------------------
                        InkWell(
                          child: _buildIconLogin('https://i1.wp.com/silfrohn.pt/wp-content/uploads/2020/07/facebook-darkblue-01-facebook-icon-small-11563255210muq5fcu8vc.png?resize=840%2C859&ssl=1'),
                          onTap: (){
                            print('FACEBOOK');
                          },
                        ),
                        //-----------------------GOOGLE---------------------------------------
                        InkWell(
                          child: _buildIconLogin('https://th.bing.com/th/id/OIP.DdVPhTob_7Dpl5-BRiaK8wHaHa?pid=ImgDet&rs=1'),
                          onTap: (){
                            print('GOOGLE');
                          },
                        )
                      ],
                    )
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildTextField(TextInputType textInputType,String labelText,String hintText){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: textInputType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return 'Enter a valid email!';
          }
          return null;
        },
        onSaved: (String? username){
          userProfile.username = username;
        },
      ),
    );
  }

  Widget _buildPasswordField(String labelText,String hintText){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: _hiddenPassword,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child : Icon(_hiddenPassword ? Icons.visibility_off : Icons.visibility),
          ),
          border: UnderlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a valid password!';
          }
          return null;
        },
        onSaved: (String? password){
          userProfile.password = password;
        },

      ),
    );
  }
  
  Widget _buildIconLogin(String img){
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 6.0
            )
          ],
          image: DecorationImage(
              image: NetworkImage(img)
          )
      ),
    );
  }


  void _setStateChkBox(){
    setState(() {
     _chkTextBox = !_chkTextBox;
    });
  }

  void _togglePasswordView(){
    setState(() {
      _hiddenPassword = !_hiddenPassword;
    });
    print(_hiddenPassword);
  }
}

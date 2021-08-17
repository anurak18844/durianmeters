import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var _hiddenPassword = true;
  var _chkTextBox = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).copyWith().size.width;
    double height = MediaQuery.of(context).copyWith().size.height;


    return Scaffold(
      //-----------------------APP BAR---------------------------------------
      appBar: AppBar(
        title: GradientText(
          'Register',
          style: TextStyle(fontSize: 24,),
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade900,
            Colors.green.shade400,
            Colors.green.shade400,
          ],
          gradientType: GradientType.linear,
        ),
        backgroundColor: Colors.white,
        //-----------------------ICON ARROW---------------------------------------
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 24,),
          onPressed: (){
            print("BACK LOGIN PAGE");
          },
        ),
      ),
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
                  //-----------------------E-MAIL---------------------------------------
                  _buildTextField(TextInputType.emailAddress, "EMAIL", "example@gmail.com"),
                  //-----------------------FULL NAME---------------------------------------
                  _buildTextField(TextInputType.emailAddress, "FULL NAME", "example@gmail.com"),
                  //-----------------------TELLEPHONE NUMBER---------------------------------------
                  _buildTextField(TextInputType.phone, "TELEPHONE NUMBER", "example@gmail.com"),
                  //-----------------------PASSWORD---------------------------------------
                  _buildPasswordField("PASSWORD", "123456"),
                  //-----------------------CONFIRM PASSWORD---------------------------------------
                  _buildPasswordField("CONFIRM PASSWORD", "123456"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //-----------------------ACCEPT AGREEMENT---------------------------------------
                      IconButton(
                        icon: Icon(_chkTextBox ? Icons.check_box : Icons.check_box_outline_blank),
                        onPressed: (){
                          _setStateChkBox();
                        },
                      ),
                      Text("Accept Agreement ",style: TextStyle(fontSize: 12),),
                      InkWell(
                          child: new Text('Learn more.',style: TextStyle(fontSize: 12,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),
                          onTap: () {
                            print("READ AGREEMENT.");
                          }
                      ),
                    ],
                  ),
                  //-----------------------BUTTON LOGIN---------------------------------------
                  Container(
                    padding: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 10),
                    child: RaisedButton(
                      onPressed: () {
                        print("REGISTER");
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
                            'REGISTER',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
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
      ),
    );
  }



  void _togglePasswordView(){
    setState(() {
      _hiddenPassword = !_hiddenPassword;
    });
    print(_hiddenPassword);
  }

  void _setStateChkBox(){
    setState(() {
      _chkTextBox = !_chkTextBox;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Color(0XFF11101E), Color(0XFFEF4D88)],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                ).createShader(bounds);
              },
              child: Container(
                color: Colors.transparent,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/AvengersEndgame.png",
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.89,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0XFF11101E), Color(0XFFEF4D88)],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  padding: EdgeInsets.only(top: 130),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 130),
                      child: Column(
                        children: <Widget>[
                          Text("must",
                              style: GoogleFonts.raleway(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          Text(
                            "Choose you movie",
                            style: GoogleFonts.khula(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Text("Sign In to Must",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.khula(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextFormField(
                                
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide:
                                        BorderSide(color: Color(0XFFEF4D88)),
                                  ),
                                  labelText: "Email",
                                  labelStyle:
                                      GoogleFonts.khula(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide:
                                        BorderSide(color: Color(0XFFEF4D88)),
                                  ),
                                  labelText: "Password",
                                  labelStyle:
                                      GoogleFonts.khula(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                             margin: EdgeInsets.only(top: 70),
                            child: Material(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: InkWell(
                                 borderRadius: BorderRadius.all(Radius.circular(30)),
                                onTap: (){
                                   Modular.to.pushNamed('/home');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 17),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0XFF4E51FF),
                                        Color(0XFFEF4D88),
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft,
                                    ),
                                  ),
                                  child: Text(
                                    "Sing In", 
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.khula(
                                      color: Colors.white, 
                                      fontSize: 17, 
                                      fontWeight: FontWeight.bold
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: FlatButton(
                              onPressed: (){},
                              child: Text(
                                      "Forgot Password?", 
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.khula(
                                        color: Colors.grey, 
                                        fontSize: 14, 
                                       
                                        ),
                                    ),
                              ),
                          ),

                          Container(
                            child: FlatButton(
                              onPressed: ()
                              {
                               
                              },
                              child: Text(
                                      "Sign up", 
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.khula(
                                        color: Colors.grey, 
                                        fontSize: 14, 
                                       
                                        ),
                                    ),
                              ),
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

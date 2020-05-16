import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Color(0XFFEF4D88)),
          ),
          labelText: "Search",
          labelStyle: GoogleFonts.khula(color: Colors.white),
        ),
      ),
    );
  }
}

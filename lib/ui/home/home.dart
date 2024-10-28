import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tasktest/ui/main_home/main_home.dart';
import 'package:tasktest/ui/widgets/navigate.dart';
import 'package:tasktest/ui/widgets/text_widget.dart';

import '../widgets/custom_button.dart';

class Home extends StatelessWidget {

  final TextEditingController _valueController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.059 .h,
                decoration:const BoxDecoration(
                  color: Color.fromRGBO(231, 238, 240, 0.31)
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 27 , top: 65.69),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const  Padding(
                          padding: const EdgeInsets.only(right: 100 , left: 140),
                          child: Text.rich(
                            TextSpan(
                              text: "GREEN.", // First part of the text
                              style: TextStyle(fontSize: 20, color:Color(0xff2DC374) , fontWeight: FontWeight.bold), // First style
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'MIND', // Second part of the text
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFFD800) , fontSize: 20 ), // Second style
                                ),

                              ],
                            ),
                          ),
                        )    ,
                      SvgPicture.asset("assets/svg/bell.svg")
                    ],),
                  ),
                   const Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: TextWidget(text: "Enter your score" , size: 20, color: Color(0xff2DC374), fontWeight: FontWeight.bold,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36.0 , right: 36 , top: 25),
                      child: TextFormField(
                        controller: _valueController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                              fontWeight: FontWeight.bold,
                          fontSize: 39,
                          color: Color(0xff139651)
                        ),
                        decoration: InputDecoration(
                          fillColor:  Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(101),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              )),
                          disabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(101),
                              borderSide: const BorderSide(
                               color: Colors.transparent,
                              )),
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(101),
                              borderSide:const BorderSide(
                                color: Colors.transparent,
                              )),
                        ),
                        validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                              return "you have to enter number";
                              }
                              return null;
                              },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 76.0 , left: 36 , right: 36 , bottom: 20),
                      child: InkWell(
                          onTap: ()  async{
                            final inputText = _valueController.text;
                            final doubleValue = double.tryParse(inputText);
                            if(formKey.currentState!.validate()){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainHome(
                                    value: doubleValue!, // Pass the future
                                  ),
                                ),
                              );
                            }
                         // Create a future



                          },
                          child: SvgPicture.asset("assets/svg/button.svg")),
                    )



                ],),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 358,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                         color: Colors.white ,
                        boxShadow: [
                          BoxShadow(color:Color.fromRGBO(45, 195, 116, 0.32),
                          blurRadius: 25
                          )
                        ]
                      ),
                    ),
                      Positioned(
                        bottom: 20,
                        left: 25,
                        child: Stack(children: [
                          SvgPicture.asset("assets/svg/Ellipse 19.svg"),
                          Positioned(
                              top: 12,
                              left: 14,
                              child: SvgPicture.asset("assets/svg/home.svg"))
                        ],),
                      ),
                    Positioned(
                        top: 15,
                        left: 120,
                        child: SvgPicture.asset("assets/svg/tennis.svg")),
                    Positioned(
                        top: 15,
                        right: 120,
                        child: SvgPicture.asset("assets/svg/badge.svg")),
                    Positioned(
                        top: 15,
                        right: 50,
                        child: SvgPicture.asset("assets/svg/user.svg")),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

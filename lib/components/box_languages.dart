import 'package:flutter/material.dart';
import 'package:memory_man_app/controller/game_controller.dart';
import 'package:provider/provider.dart';
import '../controller/translator.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  final String usaImg = "assets/usa.JPG";
  final String usaImgPb = "assets/usa_pb.jpg";
  final String braImg = "assets/brasil.JPG";
  final String braImgPb = "assets/brasil_pb.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 350,
      width: double.maxFinite,
      color: Colors.grey[900],

      child: Column(
        children: [

          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.amber[700],
            width: double.maxFinite,
            child: Text("${context.watch<GameController>().translator.text22.toUpperCase()}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 50,),
          Consumer<GameController>(
              builder: (context, controller, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.selectedLanguage = Language.Portuguese;
                            controller.translate();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.selectedLanguage == Language.Portuguese
                                           ? Colors.amber : Colors.white54,
                                    width: 3),
                                image: DecorationImage(
                                    image: AssetImage(
                                        controller.selectedLanguage == Language.Portuguese
                                            ? braImg : braImgPb
                                    ),
                                    fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(controller.translator.text23,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),


                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.selectedLanguage = Language.English;
                            controller.translate();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.selectedLanguage == Language.Portuguese
                                           ? Colors.white54 : Colors.amber,
                                    width: 3),
                                image: DecorationImage(
                                    image: AssetImage(
                                        controller.selectedLanguage == Language.English
                                            ? usaImg : usaImgPb
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(controller.translator.text24,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        )
                      ],
                    )

                  ],
                );
              }
          )

        ],
      ),
    );
  }
}




import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PreviewPage extends StatefulWidget {
  final File imagez;

  const PreviewPage({
      Key? key,
      required this.imagez}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  //final image = ModalRoute.of(context)!.settings.arguments as File?;

  // _PreviewPageState(this.image);
  // File image;
  //get image => image;

  //print (${aaa});

  late File image;

  @override
  void initState(){
    super.initState();

    image = widget.imagez;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("your choice"),
          ),
          body: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // 画像がないと文字が表示される
                  image != null
                      ? Image.file(
                    image!,
                    width: 280,
                    height: 600,
                    fit: BoxFit.contain,
                  ) : Text("No image selected"),

                  SizedBox(height: 20),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        ElevatedButton.icon(
                          onPressed: () => {},
                          icon: Icon(Icons.check_circle),
                          label: Text("Yes",style: TextStyle(fontSize: 20),),
                        ),

                        SizedBox(width: 10),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            },
                          icon: Icon(Icons.bakery_dining_outlined),
                          label: Text("again",style: TextStyle(fontSize: 20),),
                        ),

                            /*
                        CustomButtonA(
                          title: 'Yes',
                          feature: () => {},
                          icon: Icons.check_circle,
                        ),
                        SizedBox(width: 10),
                        CustomButtonA(
                          title: 'again',
                          feature: () async {
                            icon:
                            Icons.bakery_dining_outlined
                            ,
                          }
                        )
                            */
                      ]
                  )
                ],
              )
          ) // This trailing comma makes auto-formatting nicer for build methods.
     );
  }

  /*
  Widget CustomButtonA ({
    required String title,
    required IconData icon,
    required VoidCallback feature,
  })
  {
    return Container(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: feature,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 20,
              ),
              Text(title,style: TextStyle(fontSize: 20),),
            ],
          ),
        )
    );
  }
   */
}
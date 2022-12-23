import 'dart:io';
import 'package:easy_mode/photo/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domain captor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(imagez: null,),
      // routes: <String, WidgetBuilder> {
      //   '/preview': (BuildContext context) => PreviewPage()
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({
    Key? key,
    required this.imagez,
  }) : super(key: key);
  final File? imagez;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

  // 画像をギャラリーから選ぶ関数
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // 画像がnullの場合戻る
      //if (image == null) return;

      final imageTemp = File(image!.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // カメラを使う関数
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // 画像がnullの場合戻る
      //if (image == null) return;

      final imageTemp = File(image!.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Domain Captor"),
          ),
          body: Center(
              child: Column(
                children: [
                  SizedBox(height: 200),
                  /*
                  // 画像がないと文字が表示される
                  image != null
                      ? Image.file(
                    image!,
                    width: 280,
                    height: 600,
                    fit: BoxFit.contain,

                  ) :
                      */
                  Text("Welcome!!",
                    style: TextStyle(fontSize: 60),
                  ),

                  SizedBox(height: 300),

                // ElevatedButton.icon(
                //     onPressed:() async {
                //       pickImage();
                //       Navigator.of(context).pushNamed(
                //       "/preview",
                //       arguments: image);
                //     },
                //   icon: Icon(Icons.image_outlined),
                //   label: Text("From Garary",style: TextStyle(fontSize: 20),),
                // ),

                  ElevatedButton.icon(
                    onPressed:() async {
                      await pickImage();
                      Navigator.of(context).push<File?>(
                        MaterialPageRoute(builder: (context) => PreviewPage(imagez: image!)),
                      );
                    },
                    icon: Icon(Icons.camera),
                    label: Text("From Garary",style: TextStyle(fontSize: 20),),
                  ),

                  SizedBox(height: 10,),

                  ElevatedButton.icon(
                    onPressed:() async {
                      await pickImageC();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreviewPage(imagez: image!)),
                      );
                    },
                    icon: Icon(Icons.camera),
                    label: Text("From Camera",style: TextStyle(fontSize: 20),),
                  ),

                /*
                CustomButtonA(
                  title: 'From Garary',
                  icon: Icons.image_outlined,
                  feature: pickImage,
                ),
                  SizedBox(height: 10),
                  CustomButtonA(
                    title: 'From Camera',
                    icon: Icons.camera,
                    feature: pickImageC, {},
                  )

                 */
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
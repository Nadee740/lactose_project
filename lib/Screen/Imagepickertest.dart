import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickerTest extends StatefulWidget {
  @override
  _ImagePickerTestState createState() => _ImagePickerTestState();
}

class _ImagePickerTestState extends State<ImagePickerTest> {
  final ImagePicker _picker = ImagePicker();
  PickedFile image4=PickedFile("");
   XFile? image;
  void selectimage(XFile? pickIMage)async{
    XFile? tempimage=await pickIMage;
    setState(() {
      image=tempimage;
    });

  }
  Widget displayimage(){
    if(image==null){
      return Padding(
        padding: EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,40,8,40),
          child: Icon(Icons.add,color: Colors.grey,),
        ),
      );
    }
    else{
      return Padding(padding: EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: Image.file(File(image!.path),fit: BoxFit.fill,width: double.infinity,),
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Column(
    children: [
      displayimage(),
      RaisedButton(
        onPressed: ()async{
          final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
       selectimage(image);
          print(image);
        },
      ),
    ],
  ),
),
    );
  }
}

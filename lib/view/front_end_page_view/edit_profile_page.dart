
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/constants/share_preference_name.dart';
import 'package:testing_riverpod/preferences.dart';
import '../../cart/screen/CartButton.dart';
import '../../components/colors.dart';
import 'my account.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController= TextEditingController();

  final ImagePicker picker = ImagePicker();
  String? path;

  _alertBox(){
    const snackBar = SnackBar(content: RobotoText(text: "Save Changed", size: 16.0, fontWeight: FontWeight.w500, color: Colors.black,),
    backgroundColor: custom,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  File? primaryImage;


  @override
  void initState() {
   getUsersPhoneNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const RobotoText(
          text: "Edit Account",
          size: 24.0,
          fontWeight: FontWeight.bold,
          color: custom,
        ),
        iconTheme: const IconThemeData(
          color: custom,
        ),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 GestureDetector(
                   onTap: ()=> pickImage(),
                   child: Stack(
                       children: [
                         primaryImage != null? Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border: Border.all(color: custom,width: 3),
                               image: DecorationImage(
                                   image: FileImage(primaryImage!)
                               )
                           ),
                         ):
                         Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border: Border.all(color: custom,width: 3),
                               image: const DecorationImage(
                                   image: AssetImage("assets/image/profile.png")
                               )
                           ),
                         ),
                    const Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.cloud_upload,
                        color: custom,
                      ),
                    ),
                ]),
                 ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(thickness: 2.0,),
                const SizedBox(
                  height: 20.0,
                ),
                const RobotoText(
                    text: "Full Name", size: 16.0, fontWeight: FontWeight.w300),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RobotoText(
                    text: "Phone Number",
                    size: 16.0,
                    fontWeight: FontWeight.w300),
                TextField(
                  readOnly: true,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RobotoText(
                    text: "E-mail", size: 16.0, fontWeight: FontWeight.w300),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const RobotoText(
                    text: "Address", size: 16.0, fontWeight: FontWeight.w300),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      saveData();
                    },
                    child: Container(
                      height: 40.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: custom,
                      ),
                      child: const Center(
                        child: RobotoText(
                          text: "Save changes",
                          fontWeight: FontWeight.w500,
                          size: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getUsersPhoneNumber() async {
    phoneNumberController.text = await MySharedPreferences.getStringData(key: SharedRefName.number)??"";
  }

  void saveData(){

    MySharedPreferences.setStringData(key: SharedRefName.name, data: nameController.text.toString());
    MySharedPreferences.setStringData(key: SharedRefName.address, data: addressController.text.toString());
    MySharedPreferences.setStringData(key: SharedRefName.email, data: emailController.text.toString());
    MySharedPreferences.setStringData(key: SharedRefName.imagePath, data: path.toString());
    print("Image Path is : $path");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ProfilePageView()));

  }
  /// Get from gallery


  Future pickImage() async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null){
        return;
      }
      final imageTempFilePath = File(image.path);
      path = image.path.toString();
      setState(() {
        primaryImage = imageTempFilePath;
      });

    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}

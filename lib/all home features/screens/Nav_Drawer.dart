
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/view/front_end_page_view/AddShippingAddressPage.dart';
import 'package:testing_riverpod/view/front_end_page_view/edit_profile_page.dart';
import 'package:testing_riverpod/view/front_end_page_view/favorite%20page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import '../../components/popup_dialogue.dart';
import '../../components/colors.dart';
import '../../components/progress bar.dart';
import '../../components/snack_bar.dart';
import '../../constants/share_preference_name.dart';
import '../../display order/display_order_screen.dart';
import '../../preferences.dart';
import '../../view/front_end_page_view/log in.dart';
import '../../view/front_end_page_view/my account.dart';
import 'about us/about_us.dart';

class NavDrawer extends StatefulWidget {

  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {



  bool isUserLoggedIn = false;

  @override
  void initState() {

    checkLoginStatus();

    super.initState();
  }

  Future<void> checkLoginStatus() async {
    bool? isLogIn = await MySharedPreferences.getBoolData(key: SharedRefName.isLoggedIn);

    print("Log is Status : $isLogIn");
    if(isLogIn == true){
      setState(()=> isUserLoggedIn = true);
    }
    else{
      setState(()=> isUserLoggedIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            const SizedBox(
              height: 20.0,
            ),

            GestureDetector(
              onTap: () {
                whereToGO();
              },
              child: isUserLoggedIn ?  const Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: custom,
                    size: 30.0,
                  ),


                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                          text: "Logout",
                          size: 16.0,
                          fontWeight: FontWeight.w500,
                          color: custom)
                    ],
                  ),
                ],
              ) :  const Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: custom,
                    size: 30.0,
                  ),


                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                          text: "Sign In",
                          size: 16.0,
                          fontWeight: FontWeight.w500,
                          color: custom)
                    ],
                  ),
                ],
              ) ,
            ),
            const Divider(
              height: 30.0,
              thickness: 2.0,
            ),

            //My Account
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Account",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View Account Details",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //My Orders
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DisplayOrderScreen()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Orders",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View previous orders",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //My Fav
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavoritePage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Favorites",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View all favorites",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //manage address
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddShippingAddressPage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Manage Address",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: 'Manage your addresses',
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Call to order
            GestureDetector(
              onTap: () {
                UrlLauncher.launch("tel:01716519826");
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.call,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Call to order",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "01716519826",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Facebook
            GestureDetector(
              onTap: () async {

                var url = 'fb://facewebmodal/f?href=https://www.facebook.com/readyelectronics/';
                if (await canLaunch(url)) {
                  await launch( url, universalLinksOnly: true, );
                } else { throw 'There was a problem to open the url: $url'; }

              },
              child: const Row(
                children: [
                  Icon(
                    Icons.facebook,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Facebook Page",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "Find us on Facebook",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const AboutUs(),
                );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Ready Electronics",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "About us",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void whereToGO () async{

    if(isUserLoggedIn) {
       logOut();
    }

      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInOTP(previousScreen: "homeScreen",)));
      }

    }

  void logOut() async{
     ProgressBar myProgressBar = ProgressBar();
     myProgressBar.showDialogue(widgetContext: context, message: "Please wait", type: SimpleFontelicoProgressDialogType.phoenix);
    final String? phoneNumber = await MySharedPreferences.getStringData(key: SharedRefName.number);

    final String? token = await MySharedPreferences.getStringData(key: SharedRefName.token);

    final String? otp = await MySharedPreferences.getStringData(key: SharedRefName.otp);

    try{
      Response response = await post(
        Uri.parse("https://readyelectronics.com.bd/api/v1/customer/logout"),
        body: {
          'verifyPin' : otp
        },
        headers: {
          "verifyphone" : phoneNumber.toString(),
          "Authorization" : "Bearer ${token.toString()}",
        },
      );


      print("LogOut response ${response.body}");
      print("Token: $token");
      if(response.statusCode==200){

        myProgressBar.hideDialogue();
        print("Log Out success");

        MySharedPreferences.setBoolData(key: SharedRefName.isLoggedIn, data: false);

        Navigator.pop(context);

        MySharedPreferences.removeData(key: SharedRefName.token);
        CustomSnackBar(context: context, text: "Log Out Successfully");

      }
      else{
        print("LogOut Failed");
        myProgressBar.hideDialogue();
      }
    } catch(e,tr){
      myProgressBar.hideDialogue();
      print("Log Out exceptions ${e.toString()}");
    }
     print("Token After remove: $token");
  }


  Widget _buildPopupDialog() {
    return AlertDialog(
      title: const RobotoText(text: "Welcome", size: 24.0, fontWeight: FontWeight.w300, color: custom),
      content:  const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: RobotoText(text: "Ready Electronics", size: 18.0, fontWeight: FontWeight.w300, color: Colors.black)),
        ],
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child:  const RobotoText(text: "Close", size: 16.0, fontWeight: FontWeight.w300, color: custom),
        ),
      ],
    );
  }

}


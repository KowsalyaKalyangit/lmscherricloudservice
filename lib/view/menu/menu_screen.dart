 

 

import 'package:leadingmanagementsystem/controller/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../allpackages.dart';
import '../../controller/login_controller.dart';
import '../../utils/textstyles.dart';
import '../login/login_screen.dart';
import 'option_list.dart';
import 'profile_section.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  LoginController loginController =Get.put(LoginController());
  String ? _version;
  Future<void> _aboutPage(String url) async {
 if (await canLaunch(url)) {
   await launch(url);
 } else {
   throw 'Could not launch $url';
 }
  }
  _getAppVersion() async {
       PackageInfo packageInfo = await PackageInfo.fromPlatform();
  
      final version = packageInfo.version;
  
  
      setState(() {
        _version = version;
        print(_version);
  
      });
    }
  
  @override
  void initState() {
  _getAppVersion();
  ProfileController().profileController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       // Get.offAll(HomePage());
        return true;
      },
      child: Scaffold(
        backgroundColor:appcolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.00.hp,
              ),
              const ProfileSection(),
              SizedBox(
                height: 3.00.hp,
              ),
              Container(
                width: 100.00.wp,
                decoration: const BoxDecoration(
                    color: screenbackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    const OptionList(),
                    const SizedBox(
                      height: 5,
                    ),
                     InkWell(
                onTap: () async{
                     Uri mail = Uri.parse("https://cherritech.us/proelevators/about.php");
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                 
                },
                child: Container(
                  width: 90.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:screenbackground,
                      border:
                          Border.all(width: 2, color: const Color(0xffF5F5F5))),
                  padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7),
                  child: Row(
                   
                    children: [
                       Image.asset('assets/img/about.png',height: 4.0.hp,),
                       SizedBox(width: 5.0.wp,),
                      Container(
                        width: 60.0.wp,
                        child: Text(
                         'ABOUT',
                          style: menuprofiloption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Icon(Icons.arrow_forward_ios,color: formhintcolor,size: 15,),
                      )
                    ],
                  ),
                ),
              ),
const SizedBox(
                      height: 10,
                    ),

               InkWell(
                onTap: () async{
                  print('clickkk');
                  
                  
                   Uri mail = Uri.parse("https://cherritech.us/proelevators/contactus.php");
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                  
                },
                child: Container(
                  width: 90.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:screenbackground,
                      border:
                          Border.all(width: 2, color: const Color(0xffF5F5F5))),
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    
                    children: [
                       Image.asset('assets/img/support.png',height: 4.0.hp,),
                            SizedBox(width: 5.0.wp,),
                      Container(
                        width: 60.0.wp,
                        child: Text(
                         'HELP & SUPPORT',
                          style: menuprofiloption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Icon(Icons.arrow_forward_ios,color: formhintcolor,size: 15,),
                      )
                    ],
                  ),
                ),
              ),
               const SizedBox(
                      height: 10,
                    ),

               InkWell(
                onTap: () async{
                  print('clickkk');
                  
                  
                   
                },
                child: Container(
                  width: 90.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:Color.fromARGB(255, 230, 234, 254),
                       ),
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    
                    children: [
                       Image.asset('assets/img/version.png',height: 4.0.hp,),
                            SizedBox(width: 5.0.wp,),
                      Container(
                        width: 60.0.wp,
                        child: Text('Version : ${_version ?? '-'}',style: menuprofiloption,),
                      ),
                       
                    ],
                  ),
                ),
              ),
const SizedBox(
                      height: 10,
                    ),

               InkWell(
                onTap: () async{
                  print('clickkk');
                  
                  
                   String email = Uri.encodeComponent("info@professionalelevators.com");
                      String subject = Uri.encodeComponent("Hello");
                      String body = Uri.encodeComponent("Welcome to professionalelevators");
                        Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //email app is not opened
                      }
                  
                },
                child: Container(
                  width: 90.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:screenbackground,
                      border:
                          Border.all(width: 2, color: const Color(0xffF5F5F5))),
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    
                    children: [
                       Image.asset('assets/img/mail.png',height: 4.0.hp,),
                            SizedBox(width: 5.0.wp,),
                      Container(
                        width: 60.0.wp,
                        child: Text(
                         'info@professionalelevators.com',
                          style: menuprofiloption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Icon(Icons.send,color: formhintcolor,size: 15,),
                      )
                    ],
                  ),
                ),
              ),const SizedBox(
                      height: 10,
                    ),

               InkWell(
                onTap: () async{
                  print('clickkk');
                  
                  
                   Uri mail = Uri.parse("https://www.professionalelevators.com/");
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                  
                },
                child: Container(
                  width: 90.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:screenbackground,
                      border:
                          Border.all(width: 2, color: const Color(0xffF5F5F5))),
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    
                    children: [
                       Image.asset('assets/img/web.png',height: 4.0.hp,),
                            SizedBox(width: 5.0.wp,),
                      Container(
                        width: 60.0.wp,
                        child: Text(
                         'www.professionalelevators.com',
                          style: GoogleFonts.jost(
    textStyle: TextStyle(
        fontSize: 9.00.sp,
        color: Colors.blue,
        fontWeight: FontWeight.w800,
    )))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Icon(Icons.arrow_forward_ios,color: formhintcolor,size: 15,),
                      )
                    ],
                  ),
                ),
              ),
             
              const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: logocolor,
                            border: Border.all(
                              color:logocolor,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: ElevatedButton(
                          onPressed: () {
                           loginController.logout().then((value){
                            Get.to(const LoginScreen());
                           }) ;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: logocolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            textStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 11.00.sp,
                                    letterSpacing: 1.5,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LOGOUT',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        letterSpacing: 1.5,
                                        color: screenbackground,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset(
                                  'assets/images/logout.png',
                                  height: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.00.hp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

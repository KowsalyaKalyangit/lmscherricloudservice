 
 

import 'package:leadingmanagementsystem/controller/create_password_controller.dart';
import 'package:leadingmanagementsystem/view/login/login_screen.dart';

import '../../allpackages.dart';
import '../../utils/signup_button.dart';
import '../../utils/textstyles.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  AssetImage? images;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreatePasswordController createPasswordController=Get.put(CreatePasswordController());
  
  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/images/createpass.gif",
    );
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  bool _isPinnewHidden = true;
  bool _isPinnewHidden1 = true;
  bool _isPinnewHidden2 = true;

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  void _togglecnewPinView1() {
    setState(() {
      _isPinnewHidden1 = !_isPinnewHidden1;
    });
  }

  void _togglecnewPinView2() {
    setState(() {
      _isPinnewHidden2 = !_isPinnewHidden2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolor,
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                color: appcolor,
              ),
              DraggableScrollableSheet(
                builder: (BuildContext buildContext,
                    ScrollController scrollController) {
                  return Material(
                      elevation: 5,
                      shadowColor: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              SizedBox(height: 1.00.hp),
                              Container(
                                height: 40.00.hp,
                                width: 80.00.wp,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: images!)),
                              ),
                              Text('Create Password', style: listtitle),
                              SizedBox(height: 3.00.hp),
                              Container(
                                color: Colors.white,
                                height: 6.00.hp, width: 90.00.wp,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  controller: createPasswordController.newpassword,
                                 
                                  obscureText: _isPinnewHidden1,
                                  style: forminputstyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xffC6C6C6)
                                                .withOpacity(0.5),
                                            width: 1),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _togglecnewPinView1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, bottom: 15),
                                          child: Icon(
                                            _isPinnewHidden1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'New Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
                                      hintStyle: formhintstyle,
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                              SizedBox(height: 3.00.hp),
                              Container(
                                color: Colors.white,
                                height: 6.00.hp, width: 90.00.wp,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  
                                  controller: createPasswordController.confirmpassword,
                                  obscureText: _isPinnewHidden2,
                                  style: forminputstyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xffC6C6C6)
                                                .withOpacity(0.5),
                                            width: 1),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _togglecnewPinView2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, bottom: 15),
                                          child: Icon(
                                            _isPinnewHidden2
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Confirm Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
                                      hintStyle: formhintstyle,
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                              SizedBox(height: 3.00.hp),
                              ButtonIconButton(
                                press: () async {
                                  createPasswordController.createPasswordController(context:context);
                                 // Get.to(LoginScreen());
                                  
                                },
                                bordercolor: logocolor,
                                bgcolor: logocolor,
                                text: 'SAVE',
                              ),
                              SizedBox(height: 5.00.hp),
                            ],
                          ),
                        ),
                      ));
                },
                // minChildSize<=initialChildSize
                // initial size of the sheet when app is opened.
                // default value 0.5
                initialChildSize: .9, //will take 30% of screen space
                //minimum size to which sheet can be dropped down.
                // default value .25
                minChildSize: .85,

                //max size to which  sheet can be dragged up
                //default value 1.0
                maxChildSize: 0.95,
              ),
            ],
          ),
        ));
  }
}

 

import 'package:leadingmanagementsystem/view/change_password/change_password.dart';

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import '../convert_leads_page.dart';

class OptionList extends StatefulWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  var image=['assets/img/lead.png','assets/img/pass.png'];
  var menuoptions = [
    'CONVERTED LEADS',
    
    
    'CHANGE PASSWORD',
    
  ];
  var menuscreens = [
ConvertedLeadsScreen(),
   CreatenewPassword()
    // const YourOrderScreen(),
    // const HistoryScreen(),
    // const EditProfileScreen(),
    // const ChangePasswordScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuoptions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(menuscreens[index]);
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
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(image[index],height: 4.0.hp,),
                      SizedBox(width: 5.0.wp,),
                     
                      Container(
                        width: 60.0.wp,
                        child: Text(
                          menuoptions[index],
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
             
            ],
          );
        });
  }
}

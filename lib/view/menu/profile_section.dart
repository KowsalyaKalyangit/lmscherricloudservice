import 'package:leadingmanagementsystem/controller/profile_controller.dart';
import 'package:leadingmanagementsystem/view/menu/profile_bottomsheet.dart';
import '../../allpackages.dart';
import '../../utils/textstyles.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    profileController.profileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Obx(() {
        if (profileController.isProfileLoad.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (profileController.getprofiledetails.isEmpty) {
          return Center(
            child: Text('No Data Found'),
          );
        } else {
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 34.0,
                child: CircleAvatar(
                  backgroundColor: appcolor,
                  radius: 32.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(profileController
                        .getprofiledetails[0].data[0].profileImage
                        .toString()),
                    radius: 28.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 3),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          "${profileController.name.text.toString()} ${profileController.getprofiledetails[0].data[0].lastname}, \n${profileController.getprofiledetails[0].data[0].role.toString()}",
                          style: subtitleStylecolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.to(const EditProfileScreen());

                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(child: BottomSheetContent());
                    },
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 9),
                    child: CircleAvatar(
                      backgroundColor: screenbackground,
                      child: Icon(
                        Icons.edit_square,
                        size: 15,
                        color: appcolor,
                      ),
                    )),
              )
            ],
          );
        }
      }),
    );
  }
}

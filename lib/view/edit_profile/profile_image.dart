 

import '../../allpackages.dart';
import '../../utils/textstyles.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 9.00.hp,
      child: SizedBox(
        width: 100.00.wp,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.0,
                    child: CircleAvatar(
                      backgroundColor:appcolor,
                      radius: 52.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/images.jpg'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Nithish Sharma',
                    textAlign: TextAlign.center,
                    style: editprofilename,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

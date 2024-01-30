 

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
 

class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              color: const Color(0xffE8E8E8),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: const Color(0xffE8E8E8),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  height: 25,
                  width: 25,
                ),
                Text('Google', style: socialbutton),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              color: const Color(0xffE8E8E8),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: const Color(0xffE8E8E8),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/facebook.png',
                  height: 25,
                  width: 25,
                ),
                Text('Facebook', style: socialbutton),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

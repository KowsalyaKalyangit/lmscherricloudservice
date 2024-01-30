import '../../allpackages.dart';
import '../../utils/textstyles.dart';

class DummyDetails extends StatefulWidget {
  const DummyDetails({Key? key}) : super(key: key);

  @override
  _DummyDetailsState createState() => _DummyDetailsState();
}

class _DummyDetailsState extends State<DummyDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.05,
        // ),
        Center(
          child: Image.asset(
            'assets/img/changepass.gif',
            height: 40.0.hp,
            width: 70.0.wp,
          ),
        ),

        Text(
          'CHANGE PASSWORD',
          textAlign: TextAlign.center,
          style: heading,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        
      ],
    );
  }
}

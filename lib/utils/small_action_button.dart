 

import '../allpackages.dart';

class SmallActionButton extends StatelessWidget {
  final String text;

  final TextStyle? style;
  final Color? bgcolor;
  final double? radiusvalue;
  final Color bordercolor;
  final double? elevationvalue;
  final VoidCallback press;

  const SmallActionButton({
    Key? key,
    required this.text,
    this.bgcolor,
    required this.bordercolor,
    this.radiusvalue,
    this.elevationvalue,
    this.style,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: bgcolor,
          border: Border.all(
            color: bordercolor,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
           
            elevation: elevationvalue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            textStyle: style),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}


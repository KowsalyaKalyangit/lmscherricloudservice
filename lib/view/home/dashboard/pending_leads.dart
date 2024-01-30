 
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

class PendingLeadsPage extends StatefulWidget {
  const PendingLeadsPage({super.key});

  @override
  State<PendingLeadsPage> createState() => _PendingLeadsPageState();
}

class _PendingLeadsPageState extends State<PendingLeadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appcolor,title: Text('Pending Leads',style: toptitleStyle,),),
        body: Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 8),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
            return Stack(
              children: [
                Container(
                  height: 18.0.hp,
                  width: 100.0.wp,
                   
                  child: Card(
                    color: appcolor,
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                        child: Container(
                         
                          height: 17.0.hp,width: 30.0.wp,decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),color:logocolor
                          ),
                          child: Center(child: Icon(Icons.person,size: 70,color: screenbackground,),),
                          ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('KowsalyaKalyan',style: listtitlecolor,),
                           Text('KowsalyaKalyan@gmail.com',style: listtitlecolor,),
                            Text('123456899',style: listtitlecolor,),
                             Text('CherriTech',style: listtitlecolor,)
                        ],
                      )
                    ],),
                  )
                  
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 4.0.hp,
                      width: 25.0.wp,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:  Colors.amber[900] ),
                      child: Center(
                        child: Text( 'pending'
                          ,style: listtitlecolor,),
                      ),
                    ),
                  )
              ],
            );
          }),
        ),
    );
  }
}
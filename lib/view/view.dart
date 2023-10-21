import 'package:flutter/material.dart';
import 'package:metro_oct/view/Widgets/GetColor.dart';
import 'package:metro_oct/view/Widgets/GetFare.dart';
import 'package:metro_oct/view/Widgets/GetTime.dart';


class view extends StatelessWidget {
  view(this.station,this.colorRoute,this.size);





  Text getsubtitle(int index){

    if(index==0)return const Text("Start",style:TextStyle(fontWeight:FontWeight.w700,color:Colors.blueGrey),);
    if(index==station.length-1) return const Text("End",style:TextStyle(fontWeight:FontWeight.w700,color:Colors.blueGrey),);
    if(index!=0 && colorRoute[index]!=colorRoute[index-1])return Text("Change here for ${colorRoute[index]}",style:const TextStyle(fontWeight:FontWeight.w700,color:Colors.blueGrey),);

    return const Text("");
  }


  // Map<String,int>colors=color();
  final List<dynamic> station;
  final List<dynamic>colorRoute;
  final size;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(214, 146, 47, 1),
          title: const Row(
            children: [
              Text("Routes"),
              Icon(Icons.directions_train_outlined),
            ],
          ),
          actions: [
            IconButton(onPressed: (){

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TextField()),
              );
            }, icon:const Icon(Icons.home_filled)),

          ],

        ),
        body:Column(
          children: [
            Container(

                color:const Color.fromRGBO(255, 220, 186, 1.0),
                child:Row(

                  children: [

                    Container(

                      width:(MediaQuery.of(context).size.width)/2,
                      height:60,
                      decoration: BoxDecoration(
                        color:const Color.fromRGBO(137, 107, 74, .9),
                        border: Border.all(
                          color: const Color.fromRGBO(34, 64, 56, 1.0),  // Set the color of the border
                          width: 1.8,           // Set the width of the border
                        ),
                      ),
                      child: Center(
                        child:Text("Station:${station.length}",
                          style:const TextStyle(

                            color:Color.fromRGBO(255, 220, 186, 1.0),
                            fontWeight:FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                            fontSize:25,
                          ),
                        ),
                      ),

                    ),
                    Container(
                      height:60,
                      width:(MediaQuery.of(context).size.width)/2,
                      decoration: BoxDecoration(

                        color:const Color.fromRGBO(137, 107, 74, .9),
                        border: Border.all(
                          color: const Color.fromRGBO(34, 64, 56, 1.0),  // Set the color of the border
                          width: 1.8,           // Set the width of the border
                        ),
                      ),
                      child:Center(
                        child:gettime(size),
                      ),
                    )
                  ],
                )
            ),
            Container(

              height:40,
              width:(MediaQuery.of(context).size.width),
              decoration: BoxDecoration(

                color:const Color.fromRGBO(137, 107, 74, .9),
                border: Border.all(
                  color: const Color.fromRGBO(34, 64, 56, 1.0),  // Set the color of the border
                  width: 1.8,           // Set the width of the border
                ),
              ),
              child:Center(
                child:getfare(size),
              ),
            ),
            Expanded(
                child:ListView.separated(itemBuilder:(context,index){
                   const EdgeInsets.only(left: 0.0, right: 0.0);
                  return  Container(

                      color:const Color.fromRGBO(255, 220, 186, 1.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10, right: 0.0),
                        leading: Icon(
                          Icons.circle,
                          color:getcolor(colorRoute[index]),
                          // color:Colors.brown,
                        ),
                        title:Text(station[index],
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily:'Snell Roundhand',
                            fontWeight: FontWeight.bold,

                            color:Colors.black54,
// Additional properties for text styling
                          ),
                        ),


                        trailing:  Icon(
                          Icons.arrow_downward_outlined,
                          color:getcolor(colorRoute[index]),
                          // color:Colors.brown,
                          size:30,
                        ),

                        subtitle:getsubtitle(index),
                        selected: true,
                      )
                  );
                },
                    itemCount:station.length,
                    separatorBuilder: (context,index){
                      return const Divider(
                        height:0,);
                    }
                ))
          ],
        )
    );
  }
}



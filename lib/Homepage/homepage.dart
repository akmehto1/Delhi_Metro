// class HomePage extends StatelessWidget {
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:metro_oct/Algo/SearchingAlgo.dart';
import 'package:metro_oct/Algo/station_to_code.dart';
import 'package:metro_oct/Gps/gps_service.dart';
import 'package:metro_oct/suggestion.dart';
import 'package:metro_oct/view/view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:photo_view/photo_view.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // TextEditingController source = TextEditingController();
  // TextEditingController destination= TextEditingController();

  //this is used for suggestion
  List<String> suggestions = location_name();

  //this convert string to int

  LocationService locationService = LocationService();
  // Position? currentLocation;
  // Position position = await locationService.getLocation();

  //source
  final TextEditingController _source = TextEditingController();
  //destination
  final TextEditingController _destination = TextEditingController();

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

// When you Enter wrong source or destination  this alert box give alert
  void _showAlertDialog(BuildContext context) {
    int randomNumber = generateRandomNumber(1, 10); // Close the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: const Text('Something Miss'),
          content: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/show$randomNumber.gif")),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        );
      },
    );
  }


 //this show map
  void _showmap(BuildContext context) {
    // Close the dialog
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 1000,
          child: PhotoView(
            imageProvider: const AssetImage('assets/images/map.jpg'),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        );
      },
    );
  }

  //during searching
  void _showsplashScreen(BuildContext context) {
    int randomNumber = generateRandomNumber(1, 8);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: const Text('Searching Route....'),
          content: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/run$randomNumber.gif")),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

//alaram
  void _showsplashalaram(BuildContext context) {
    int randomNumber = generateRandomNumber(1, 8);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(14,42, 54,1),
          title: const Text('Searching Route....'),
          content:SizedBox(
              width: 100,
              height: 100,
              child:Container(
                margin: const EdgeInsets.only(left: 10, right: 0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return suggestions.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (String value) {
                    _source.text = value;
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      onFieldSubmitted) {
                    return Container(
                      width:30,
                      child:TextField(
                        autofocus: true,
                        //style of font  written inside of text flied
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.blueGrey,
                              letterSpacing: .7,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),

                        //input decoration for border
                        decoration: const InputDecoration(
                          //border
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                100.0)), // You can adjust the border radius as needed.
                          ),

                          //prefix icon
                          prefixIcon: Icon(Icons.turn_slight_right),
                          labelText: 'From',
                          fillColor: Colors.lightBlue,

                          //label style
                          labelStyle: TextStyle(
                            color: Colors
                                .blueGrey, // Change the color of the label text
                            fontSize:
                            18, // 3Change the font size of the label text
                            fontWeight: FontWeight
                                .bold, // Apply bold style to the label text
                          ),

                          //hint
                          hintText: 'Enter Source Station',
                        ),
                        controller: textEditingController,
                        focusNode: focusNode,
                        onSubmitted: (String value) {
                          if (value != "") {
                            _node.requestFocus();
                          }
                          onFieldSubmitted();
                        },
                      ),
                    );
                  },
                ),
              ),

          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        );
      },
    );

  }


  get source => null;
  late final FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //this is navbar title
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("    DELHI METRO",
                style: TextStyle(
                    fontFamily: 'fontmain',
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),



            // Container(
            //     width:120,
            //     height:100,
            //     child:Image.asset("assets/images/train6.gif")
            // )
          ],
        ),

        actions:[
           GestureDetector(
             child:Icon(Icons.access_alarms_rounded,size:40,),
             onTap:(){
               _showsplashalaram(context);
             },

           )
        ],
        backgroundColor: const Color.fromRGBO(214, 146, 47, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onDoubleTap: () {
                _showmap(context);
              },
              child: Image.asset('assets/images/delhi.png'),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //     width:100,
                      //     height:100,
                      //     child:Image.asset("assets/images/download.png")
                      // ),
                      // Container(
                      //     width:100,
                      //     height:100,
                      //     child:Image.asset("assets/images/anime1.gif")
                      // )
                    ],
                  ),

                  //Source Autocomplete and text flied
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return suggestions.where((suggestion) => suggestion
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()));
                      },
                      onSelected: (String value) {
                        _source.text = value;
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          onFieldSubmitted) {
                        return TextField(
                          autofocus: true,
                          //style of font  written inside of text flied
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.blueGrey,
                                letterSpacing: .7,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          //input decoration for border
                          decoration: const InputDecoration(
                            //border
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  100.0)), // You can adjust the border radius as needed.
                            ),

                            //prefix icon
                            prefixIcon: Icon(Icons.turn_slight_right),
                            labelText: 'From',
                            fillColor: Colors.lightBlue,

                            //label style
                            labelStyle: TextStyle(
                              color: Colors
                                  .blueGrey, // Change the color of the label text
                              fontSize:
                                  18, // Change the font size of the label text
                              fontWeight: FontWeight
                                  .bold, // Apply bold style to the label text
                            ),

                            //hint
                            hintText: 'Enter Source Station',
                          ),
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (String value) {
                            if (value != "") {
                              _node.requestFocus();
                            }
                            onFieldSubmitted();
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    child:
                        Center(child: Image.asset("assets/images/arrow.png")),
                  ),

                  // Destination Textfiled and sutocomplete
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return suggestions.where((suggestion) => suggestion
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()));
                      },
                      onSelected: (String value) {
                        _destination.text = value;
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          onFieldSubmitted) {
                        return TextField(
                          autofocus: true,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.blueGrey,
                                letterSpacing: .7,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: const InputDecoration(

                              //border
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    100.0)), // You can adjust the border radius as needed.
                              ),

                              //prefix icon
                              prefixIcon: Icon(Icons.location_on_rounded),
                              labelText: 'To',
                              fillColor: Colors.lightBlue,

                              //label style
                              labelStyle: TextStyle(
                                color: Colors
                                    .grey, // Change the color of the label text
                                fontSize:
                                    18, // Change the font size of the label text
                                fontWeight: FontWeight
                                    .bold, // Apply bold style to the label text
                              ),

                              //hint
                              hintText: 'Enter Destination Station '),
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (String value) {
                            onFieldSubmitted();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                        width: 200,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                              onTap: () async {
                                Map<dynamic, int>? string_to_int =
                                    Metro_Address();

                                // Graph g = Graph();
                                int? src = string_to_int?[_source.text];
                                int? des = string_to_int?[_destination.text];

                                if (src == null || des == null) {
                                  return _showAlertDialog(context);
                                }

                                _showsplashScreen(context);

                                List<List<String>> result = location(src, des);
                                List<String> RoutePath = result[0];
                                List<String> colorPath = result[1];
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => view(RoutePath,
                                            colorPath, RoutePath.length)),
                                  );
                                });

                                // Get.to(()=>view(ans),transition:Transition.upToDown);

                                // Add the desired action when the button is pressed
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Search Route',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.search)
                                ],
                              )),
                        )),
                  ),
                  SizedBox(height:70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

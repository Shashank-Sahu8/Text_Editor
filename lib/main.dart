import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Picker Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedFont = "Coda";
  TextStyle? _selectedFontTextStyle = GoogleFonts.inter();
  TextEditingController textc = TextEditingController();
  final List<String> _myGoogleFonts = [
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab",
  ];
  double _fontSize = 18.0; // Initial font size

  Future<void> _showFontSizeDialog(BuildContext context) async {
    double? selectedFontSize = await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Font Size', textAlign: TextAlign.center),
          content: Container(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text('Small'),
                  onTap: () {
                    Navigator.of(context).pop(18.0);
                  },
                ),
                ListTile(
                  title: const Text('Medium'),
                  onTap: () {
                    Navigator.of(context).pop(28.0);
                  },
                ),
                ListTile(
                  title: const Text('Large'),
                  onTap: () {
                    Navigator.of(context).pop(38.0);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(16.0);
                  ;
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xff6436A1)),
                ))
          ],
        );
      },
    );

    if (selectedFontSize != null) {
      setState(() {
        _fontSize = selectedFontSize;
      });
    }
  }

  Offset _offset = const Offset(150, 320);
  Color selectedcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xff6436A1),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              textc.text = "";
                            });
                          },
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(
                                'assets/play_store_512-modified.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38,
                      ),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Pick a font',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: FontPicker(
                                        showInDialog: true,
                                        initialFontFamily: 'Anton',
                                        onFontChanged: (font) {
                                          setState(() {
                                            _selectedFont = font.fontFamily;
                                            _selectedFontTextStyle =
                                                font.toTextStyle();
                                          });
                                        },
                                        googleFonts: _myGoogleFonts,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff6436A1)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff6436A1)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text(
                                      'Pick Color',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24),
                                    ),
                                    children: [
                                      ColorPicker(
                                        pickerColor: selectedcolor,
                                        onColorChanged: (color) {
                                          setState(() {
                                            selectedcolor = color;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 28.0, right: 28.0),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          color: Color(0xff6436A1),
                                          child: Text(
                                            "Select Color",
                                            style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text("Color")),
                      FloatingActionButton(
                        onPressed: () {
                          _showInputDialog(context);
                        },
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                        backgroundColor: Color(0xff6436A1),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showFontSizeDialog(context);
                        },
                        child: Text("Size"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6436A1)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                        left: _offset.dx,
                        top: _offset.dy,
                        child: Draggable(
                          feedback: DottedBorder(
                            color: Colors.grey.shade500,
                            dashPattern: [2, 0, 0, 2],
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 16.0,
                              ),
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(textc.text,
                                    style: _selectedFontTextStyle?.merge(
                                        TextStyle(
                                            color: selectedcolor,
                                            fontSize: _fontSize))),
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showInputDialog(context);
                            },
                            child: DottedBorder(
                              color: Colors.grey.shade500,
                              dashPattern: [2, 0, 0, 2],
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 16.0,
                                ),
                                color: Colors.grey.shade200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(textc.text,
                                      style: _selectedFontTextStyle?.merge(
                                          TextStyle(
                                              color: selectedcolor,
                                              fontSize: _fontSize))),
                                ),
                              ),
                            ),
                          ),
                          onDragEnd: (details) {
                            setState(() {
                              double adjustment =
                                  MediaQuery.of(context).size.height -
                                      constraints.maxHeight;
                              _offset = Offset(details.offset.dx,
                                  details.offset.dy - adjustment);
                            });
                          },
                        ))
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter the  Text'),
            content: TextField(
              controller: textc,
              decoration: InputDecoration(hintText: 'Type something...'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xff6436A1)),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Color(0xff6436A1)),
                ),
              ),
            ],
          );
        });
  }
}

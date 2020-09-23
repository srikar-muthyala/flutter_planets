import 'package:flutter/material.dart';
import 'package:planets/constants.dart';
import 'package:planets/data.dart';

class DetailsPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailsPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                        ),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        Text(
                          planetInfo.description ?? ' ',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: contextTextColor),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Divider(
                          color: Colors.black38,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  // ListView.builder(itemBuilder: null),
                ],
              ),
              Positioned(
                right: -104,
                child: Hero(
                    tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage)),
              ),
              Positioned(
                top: 60,
                left: 32,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                      fontSize: 237,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

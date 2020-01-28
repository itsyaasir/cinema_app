import 'package:cinema_app/models/PopularMovieModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_app/global.dart';
import 'package:intl/intl.dart';
import 'package:cinema_app/screens/details_screen.dart';

class PopularMovieWidget extends StatelessWidget {
  final AsyncSnapshot<List<PopularMovieModel>> snapshot;
  const PopularMovieWidget({
    this.snapshot,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, id) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(id: snapshot.data[id].id)));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[400],
                      offset: Offset(0, 3))
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                      ),
                      child: Image.network(
                        getPosterImage(snapshot.data[id].posterPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.gripLines,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {}),
                        Row(
                          children: <Widget>[
                            Text(
                              "Cinema",
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            Text(
                              "App",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100.0,
                    left: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: 500,
                          child: Text(
                            "${snapshot.data[id].movieName}",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "${DateTime.parse(snapshot.data[id].yearReleased).year} •",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Text(
                              " ${DateFormat('d, MMM y').format(DateTime.parse(snapshot.data[id].yearReleased))} •",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        RatingBar(
                          initialRating: (snapshot.data[id].rating) / 2,
                          onRatingUpdate: null,
                          itemCount: 5,
                          itemSize: 20,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:cinema_app/models/MovieDetailModel.dart';
import 'package:cinema_app/widgets/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_app/widgets/reusablematerialcontainer.dart';

class DetailScreenWidget extends StatefulWidget {
  final AsyncSnapshot<MovieDetailModel> snapshot;
  final int length;
  const DetailScreenWidget({
    Key key,
    this.snapshot,
    this.length,
  }) : super(key: key);

  @override
  _DetailScreenWidgetState createState() => _DetailScreenWidgetState();
}

class _DetailScreenWidgetState extends State<DetailScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
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
                      getPosterImage(widget.snapshot.data.posterPath),
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
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Positioned(
                  top: 270.0,
                  left: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 500,
                        child: Text(
                          "${widget.snapshot.data.movieName}",
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
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          RatingBar(
                            initialRating: widget.snapshot.data.rating / 2,
                            onRatingUpdate: (val) {},
                            itemCount: 5,
                            itemSize: 20,
                            allowHalfRating: true,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${widget.snapshot.data.rating / 2}/5",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "(${widget.snapshot.data.voteCount})",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ReusableContainer(
            titleName: "Details",
            subtitle: "",
          ),
          Container(
              margin: EdgeInsets.all(20),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 30),
                  ReusableMaterialContainer(
                    title: "Release Date",
                    subtitle: "${widget.snapshot.data.releaseDate}",
                  ),
                  SizedBox(width: 30),
                  ReusableMaterialContainer(
                    title: "Runtime",
                    subtitle:
                        "${(widget.snapshot.data.runTime / 60).truncate()} h ${(widget.snapshot.data.runTime).remainder(60).round()}m",
                  ),
                  SizedBox(width: 30),
                  ReusableMaterialContainer(
                    title: "Budget",
                    subtitle:
                        "\$${widget.snapshot.data.budget / 1000000}Million",
                  ),
                  SizedBox(width: 30),
                  ReusableMaterialContainer(
                    title: "Status",
                    subtitle: "${widget.snapshot.data.status}",
                  ),
                  SizedBox(width: 30),
                  ReusableMaterialContainer(
                      subtitle: "${widget.snapshot.data.genre}", title: "Genre")
                ],
              )),
          ReusableContainer(
            titleName: "Overview",
            subtitle: "",
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text("${widget.snapshot.data.overview}"),
              ),
            ),
          ),
          ReusableContainer(
            subtitle: "",
            titleName: "Trailer",
          ),
        ],
      ),
    );
  }
}

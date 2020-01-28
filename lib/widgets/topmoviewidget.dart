import 'package:cinema_app/models/TopMovieModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_app/global.dart';
import 'package:cinema_app/screens/details_screen.dart';

class TopMovieWidget extends StatelessWidget {
  final AsyncSnapshot<List<TopMovieModel>> snapshot;
  const TopMovieWidget({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      height: 300,
      child: ListView.builder(
          itemCount: snapshot.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, id) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(id: snapshot.data[id].id)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 30.0),
                    width: MediaQuery.of(context).size.width / 3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          '${getPosterImage(snapshot.data[id].posterPath)}',
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    width: 170,
                    child: Text(
                      "${snapshot.data[id].movieName}",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${DateTime.parse(snapshot.data[id].releaseDate).year}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  RatingBar(
                      onRatingUpdate: null,
                      itemCount: 5,
                      itemSize: 15,
                      initialRating: snapshot.data[id].rating / 2,
                      itemBuilder: (_, id) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      })
                ],
              ),
            );
          }),
    );
  }
}

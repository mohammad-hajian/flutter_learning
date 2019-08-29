import 'package:flutter/material.dart';
import 'package:flutter_app/models/company-course-repodata_13.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  CourseCard(this.course);

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle ,
      child: IconButton(
          icon: Icon(Icons.link),
          onPressed: () async {
            if (await canLaunch(widget.course.url)) {
              print(widget.course.url);
              await launch(widget.course.url);
            }
          }),
    );
  }

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(.4),
        borderRadius: new BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, blurRadius: 10.0, spreadRadius: 2.0)
        ]);
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Image.asset(widget.course.thumbnail),
          Positioned(bottom: 12.0, right: 12.0, child: _createLinkButton())
        ],
      ),
    );
  }

  Widget _createCourseInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
      child: Text(widget.course.title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.85)
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _createShadowRoundCorners(),
      width: 175,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: <Widget>[
          Flexible(flex: 3, child: _createThumbnail()),
          Flexible(flex: 2, child: _createCourseInfo()),
        ],
      ),
    );
  }
}

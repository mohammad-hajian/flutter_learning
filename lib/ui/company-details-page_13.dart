import 'package:flutter/material.dart';
import 'package:flutter_app/models/company-course-repodata_13.dart';

import 'package:flutter_app/animation/company_details_intro-animation_13.dart';
import 'dart:ui' as ui;

import 'package:flutter_app/ui/courser-card_13.dart';

class CompanyDetailsPage extends StatelessWidget {
  final Company company;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animation.controller, builder: _createAnimation),
    );
  }

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgDropOpacity.value,
          child: Image.asset(company.backDropPhoto, fit: BoxFit.cover),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation.bgDropBlur.value,
              sigmaY: animation.bgDropBlur.value),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        ),
      ],
    );
  }

  Widget _createContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_createLogoAvatar(), _createAboutCompany(), _createCourseScroller()],
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: new Container(
        width: double.infinity,
        height: 110.0,
        margin: EdgeInsets.only(top: 32, left: 20),
        padding: EdgeInsets.all(3.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(company.logo),
//            child: Image.asset(company.logo,width: 100,height: 100),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'hello my mohammad',
                style: TextStyle(
                    fontSize: 20 * animation.avatarSize.value + 2,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutCompany() {
    return new Padding(
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            company.name,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.nameOpacity.value),
                fontSize: 28 * animation.avatarSize.value + 2,
                fontWeight: FontWeight.bold),
          ),
          Text(
            company.location,
            style: TextStyle(
                color: Colors.white.withOpacity(
                    animation.locationOpacity.value),
                fontSize: 15 * animation.avatarSize.value + 2,
                fontWeight: FontWeight.w600),
          ),
          Container(
            color: Colors.white.withOpacity(0.80),
            margin: const EdgeInsets.symmetric(vertical: 15),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          Text(company.about,
            style: TextStyle(
                height: 1.4,
                color: Colors.white.withOpacity(animation.aboutOpacity.value)
            ),)
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(padding: const EdgeInsets.only(top: 14.0),
      child: Transform(transform: Matrix4.translationValues(animation.courseScrollerXTranslation.value, 0.0, 0.0),
          child: SizedBox(
              height: 250,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10) ,
                  scrollDirection: Axis.horizontal,
                  itemCount: company.courses.length,
                  itemBuilder: (BuildContext context,int index){
                    var course = company.courses[index];
                    return CourseCard(course);
                  }
              )
          )
      ),
    );
  }
}

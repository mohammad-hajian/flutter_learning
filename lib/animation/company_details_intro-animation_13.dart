import 'package:flutter/material.dart';

class CompanyDetailsIntroAnimation {

  CompanyDetailsIntroAnimation(this.controller)
  : bgDropOpacity = Tween(begin: 0.5, end: 1.0)
      .animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, .4, curve: Curves.ease))),
  bgDropBlur = new Tween(begin: 0.0, end: 5.0)
      .animate(new CurvedAnimation(parent: controller, curve: Interval(0.1, .4, curve: Curves.ease))),
  avatarSize = new Tween(begin: 0.0, end: 1.0)
      .animate(new CurvedAnimation(parent: controller, curve: Interval(0.1, .4, curve: Curves.elasticInOut))),
   nameOpacity = new Tween(begin: 0.0, end: 1.0)
       .animate(new CurvedAnimation(parent: controller, curve: Interval(0.1, .5, curve: Curves.easeIn))),
   locationOpacity = new Tween(begin: 0.0, end: .85)
       .animate(new CurvedAnimation(parent: controller, curve: Interval(0.15, .55, curve: Curves.easeIn))),
   dividerWidth = new Tween(begin: 0.0, end: 225.0)
       .animate(new CurvedAnimation(parent: controller, curve: Interval(0.2, .55, curve: Curves.fastOutSlowIn))),
        aboutOpacity = new Tween(begin: 0.0, end: 1.0)
            .animate(new CurvedAnimation(parent: controller, curve: Interval(0.45, .75, curve: Curves.fastOutSlowIn))),
        courseScrollerXTranslation = Tween(begin: 60.0,end: 0.0)
            .animate(new CurvedAnimation(parent: controller, curve: Interval(.75, .95,curve: Curves.ease))),
        courseScrollerOpacity = Tween(begin: 0.0,end: 1.0)
            .animate(new CurvedAnimation(parent: controller, curve: Interval(.8, 1.0,curve: Curves.fastOutSlowIn)));


  final AnimationController controller;
  final Animation<double> bgDropOpacity;
  final Animation<double> bgDropBlur;
  final Animation<double> avatarSize;
  final Animation<double> nameOpacity;
  final Animation<double> locationOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> aboutOpacity;
  final Animation<double> courseScrollerXTranslation;
  final Animation<double> courseScrollerOpacity;
}
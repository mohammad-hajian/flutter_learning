import 'package:flutter/material.dart';

class CompanyDetailsIntroAnimation {

  CompanyDetailsIntroAnimation(this.controller)
  : bgDropOpacity = Tween(begin: 0.5, end: 1.0)
  .animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, .500, curve: Curves.ease))),
  bgDropBlur = new Tween(begin: 0.0, end: 5.0)
  .animate(new CurvedAnimation(parent: controller, curve: Interval(0.0, .800, curve: Curves.ease)));


  final AnimationController controller;
  final Animation<double> bgDropOpacity;
  final Animation<double> bgDropBlur;
//  final Animation<double> avatarSize;
//  final Animation<double> nameOpacity;
//  final Animation<double> locationOpacity;
//  final Animation<double> dividerWidth;
//  final Animation<double> aboutOpacity;
//  final Animation<double> courseScrollerTranslation;
//  final Animation<double> courseScrollerOpacity;
}
//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Company {
Company({
  @required this.name,
  @required this.about,
  @required this.backDropPhoto,
  @required this.courses,
  @required this.location,
  @required this.logo,
});

final String name;
final String location;
final String logo;
final String backDropPhoto;
final String about;
final List<Course> courses;
}

class Course {
  Course({
    @required this.title,
    @required  this.thumbnail,
    @required  this.url,
});
  final String title;
  final String thumbnail;
  final String url;

}

class RepoData {
  static final Company mohammadCompany = new Company(
      name: 'mohammadCompany',
      about: 'oh yes this is mohammad company',
      backDropPhoto: 'images/company-app/bawp_creator.png',
      courses: <Course>[
        new Course(
          title: '2 book is done: java',
          thumbnail: 'images/company-app/java_design-pats.png',
          url: 'http://tabandesign.ir'
        ),
        new Course(
            title: '3 book is done: java9',
            thumbnail: 'images/company-app/java9_course.png',
            url: 'http://tabandesign.ir'
        ),
        new Course(
            title: 'first book is done: portfolio',
            thumbnail: 'images/company-app/android_portfolio.png',
            url: 'http://tabandesign.ir'
        ),
        new Course(
            title: 'first book is done: cotlin',
            thumbnail: 'images/company-app/kotlin.png',
            url: 'http://tabandesign.ir'
        ),
      ],
      location: 'Iran, Isfahan',
      logo: 'images/company-app/logo.png'
  );
}
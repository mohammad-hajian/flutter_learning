import 'package:flutter/material.dart';
import 'package:flutter_app/models/company-course-repodata_13.dart';

import 'company_details_intro-animation_13.dart';
//import 'package:meta/meta.dart';

class CompanyDetailsPage extends StatelessWidget {

  final Company company;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage({@required this.company, @required AnimationController controller})
  : animation = new CompanyDetailsIntroAnimation(controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
            opacity: animation.bgDropOpacity.value,
          child: Image.asset(company.backDropPhoto,fit: BoxFit.cover),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/models/company-course-repodata_13.dart';
import 'package:flutter_app/ui/company-details-page_13.dart';

class CompanyAnimator extends StatefulWidget {
  @override
  _CompanyAnimatorState createState() => _CompanyAnimatorState();
}

class _CompanyAnimatorState extends State<CompanyAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDetailsPage(company: RepoData.mohammadCompany , controller: _controller);
  }
}

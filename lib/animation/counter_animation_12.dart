import 'package:flutter/material.dart';

import 'chain_animation_12.dart';

class CounterAnimator extends StatefulWidget {
  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter = 0;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));//مدت انیمیشن
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
//  animation = Tween(begin: 0.0, end: 20.0).animate(_controller)
    ..addListener((){
      this.setState((){
        _counter++;
      });
    })
    ..addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return GestureDetector(
////      child: Text(
////        _controller.isAnimating ? _counter.toStringAsFixed(1) //عدد داخل پرانتز، همون تعداد اعداد پشت ممیز است
////            : "let's begin",
////          style: TextStyle(fontSize: 25.0*_controller.value+16),
////      ),
////      onTap: (){
////        _controller.forward(from: 0.0);
////      },
////    );
  return Container(
    child: ChainAnimation(animation: animation,),
  );

  }
}

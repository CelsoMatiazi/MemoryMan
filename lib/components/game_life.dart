import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:memory_man_app/controller/game_controller.dart';
import 'package:provider/provider.dart';

class GameLife extends StatefulWidget {
  const GameLife({
    Key? key,
  }) : super(key: key);

  @override
  State<GameLife> createState() => _GameLifeState();
}

class _GameLifeState extends State<GameLife> with TickerProviderStateMixin{

  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late final AnimationController _controller3;

  _lifeController(){
    var lifeState = Provider.of<GameController>(context);
    lifeState.context = context;
    if(lifeState.numberOfLife == 2) _controller1.forward();
    if(lifeState.numberOfLife == 1) _controller2.forward();
    if(lifeState.numberOfLife == 0) _controller3.forward();
    if(lifeState.numberOfLife == 3){
      _controller1.reverse();
      _controller2.reverse();
      _controller3.reverse();
    }
  }


  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(vsync: this);
    _controller1.duration = const Duration(seconds: 2);
    _controller2 = AnimationController(vsync: this);
    _controller2.duration = const Duration(seconds: 2);
    _controller3 = AnimationController(vsync: this);
    _controller3.duration = const Duration(seconds: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lifeController();
  }


  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Lottie.asset(
            "assets/broken_heart.json",
            controller: _controller1,
          )),
          Expanded(child: Lottie.asset(
            "assets/broken_heart.json",
            controller: _controller2,
          )),
          Expanded(child: Lottie.asset(
            "assets/broken_heart.json",
            controller: _controller3,
          )),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memory_man_app/controller/game_controller.dart';
import 'package:provider/provider.dart';

class TimeAdjust extends StatefulWidget {
  const TimeAdjust({Key? key}) : super(key: key);

  @override
  State<TimeAdjust> createState() => _TimeAdjustState();
}

class _TimeAdjustState extends State<TimeAdjust> {

  double _currentValue = 250;
  List<Widget> toggleOptions = [
    const Text("Não"),
    const Text("Sim")
  ];

  _onChangeSlider(){
    var status = Provider.of<GameController>(context, listen: false);
    return (double value){
      status.animationTimer = value.toInt();
      setState(() {
        _currentValue = value;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<GameController>(context, listen: false);
    _currentValue = status.animationTimer.toDouble();
    toggleOptions = [Text("${status.translator.text8}"), Text("${status.translator.text7}")];
    final List<bool> selectedOption = [!status.autoAdjustTimer, status.autoAdjustTimer];
    return Container(
      padding: const EdgeInsets.all(20),
      height: 400,
      width: double.maxFinite,
      color: Colors.amber[700],
      child: Column(
        children: [

          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.maxFinite,
              color: Colors.black,
              child: Text("${status.translator.text9.toUpperCase()}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber
                ),
              )
          ),
          const SizedBox(height: 10,),
          Text("${status.translator.text10}",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10,),

          ToggleButtons(
            onPressed: (int index){
              status.autoAdjustTimer = selectedOption[0];
              setState(() {
                for( int i = 0; i < selectedOption.length; i++){
                  selectedOption[i] = i == index;
                }
              });
            },
            direction: Axis.horizontal,
            selectedColor: Colors.white,
            color: Colors.black,
            fillColor: !selectedOption[0] ? Colors.green[700] : Colors.red[700],
            isSelected: selectedOption,
            constraints: const BoxConstraints(
                minHeight: 40,
                minWidth: 80
            ),
            children: toggleOptions,
          ),


          const SizedBox(height: 20,),

          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.maxFinite,
              color: Colors.black,
              child: Text(status.translator.text11.toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber
                ),
              )
          ),
          const SizedBox(height: 10,),
          Text(status.translator.text12,
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(status.translator.text13),
              Text(status.translator.text14),
            ],
          ),
          Slider(
              activeColor: Colors.green[700],
              value: _currentValue,
              min: 80,
              max: 500,
              label: "${_currentValue} ms",
              onChanged: _onChangeSlider()
          ),

        ],
      ),
    );
  }
}

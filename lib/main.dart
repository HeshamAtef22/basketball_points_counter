import 'package:basketball_points_counter/cubit/counter_cubit.dart';
import 'package:basketball_points_counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( PointsCounter());
}



class PointsCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CounterCubit(),
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
);
  }
}

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<CounterCubit, CounterState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('basketball Points Counter'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SectionTeamAddPoint(
                teamName: "Team A",
                point: BlocProvider.of<CounterCubit>(context).teamAScore,
                pressToAddOnePoint: (){
                BlocProvider.of<CounterCubit>(context).TeamAIncrement(1);
                },
                pressToAddTwoPoint: (){
                  BlocProvider.of<CounterCubit>(context).TeamAIncrement(2);
                },
                pressToAddThreePoint: (){
                  BlocProvider.of<CounterCubit>(context).TeamAIncrement(3);
                },
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: VerticalDivider(
                  )),
              SectionTeamAddPoint(
                teamName: "Team B",
                point: BlocProvider.of<CounterCubit>(context).teamBScore,
                pressToAddOnePoint: (){
                  BlocProvider.of<CounterCubit>(context).TeamBIncrement(1);
                },
                pressToAddTwoPoint: (){
                  BlocProvider.of<CounterCubit>(context).TeamBIncrement(2);
                },
                pressToAddThreePoint: (){
                  BlocProvider.of<CounterCubit>(context).TeamBIncrement(3);
                },
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).ResetPoint();
            },
            child: Text(
              "Reset",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),

        ],
      ),
    );
  },
);
  }
}

class SectionTeamAddPoint extends StatelessWidget {
  String teamName;
  int point;
  void Function() pressToAddOnePoint;
  void Function() pressToAddTwoPoint;
  void Function() pressToAddThreePoint;


   SectionTeamAddPoint({super.key, required this.teamName, required this.point, required this.pressToAddOnePoint, required this.pressToAddTwoPoint, required this.pressToAddThreePoint});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              teamName,
              style: TextStyle(fontSize: 32),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.30,
              child: FittedBox(
                child: Text(
                  point.toString(),
                  style: TextStyle(fontSize: 150),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: pressToAddOnePoint,
              child: Text(
                "Add 1 point",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(150, 50),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: pressToAddTwoPoint,
              child: Text(
                "Add 2 point",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: pressToAddThreePoint,
              child: Text(
                "Add 3 point",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

          ]),
    );
  }
}



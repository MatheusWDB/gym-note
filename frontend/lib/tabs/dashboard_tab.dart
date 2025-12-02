import 'package:flutter/material.dart';
import 'package:gym_note/widgets/workout_plan_widget.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  List<Object> _workoutPlans = [Object(), Object()];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _workoutPlans.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 12.0),
      itemBuilder: (context, index) =>
          WorkoutPlanWidget(workoutPlan: _workoutPlans[0]),
    );
  }
}

import 'package:flutter/material.dart';

class WorkoutPlanWidget extends StatefulWidget {
  final Object workoutPlan;
  const WorkoutPlanWidget({super.key, required this.workoutPlan});

  @override
  State<WorkoutPlanWidget> createState() => _WorkoutPlanWidgetState();
}

class _WorkoutPlanWidgetState extends State<WorkoutPlanWidget> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Card(
      elevation: 2.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 6.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8.0,
                      children: [
                        Icon(Icons.fitness_center, color: primaryColor),
                        Expanded(
                          child: Column(
                            spacing: 4.0,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Treino C - Pernas & Ombros",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Última sessão: 4 semanas",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          overlayColor: primaryColor,
                          minimumSize: const Size(50, 50),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.settings_outlined, size: 22.0),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ],
              ),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.0),
                color: primaryColor,
                minHeight: 7.0,
                value: .5,
              ),
              Text(
                "Progresso: 50%",
                style: TextStyle(
                  fontSize: 12.0,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WorkoutPlanEditorScreen extends StatefulWidget {
  final String addOrEdit;
  final Object? workoutPlan;
  const WorkoutPlanEditorScreen({
    super.key,
    required this.addOrEdit,
    this.workoutPlan,
  });

  @override
  State<WorkoutPlanEditorScreen> createState() =>
      _WorkoutPlanEditorScreenState();
}

class _WorkoutPlanEditorScreenState extends State<WorkoutPlanEditorScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _divisionController = TextEditingController();
  final TextEditingController _objectiveController = TextEditingController();
  List<Widget> _exercises = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose;
    _divisionController.dispose;
    _objectiveController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        shadowColor: Colors.black,
        actionsPadding: EdgeInsets.all(8.0),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              minimumSize: Size(90.0, 35.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.save_outlined, size: 22.0),
            label: Text(
              "Salvar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        title: Text(
          widget.addOrEdit == "add" ? "Nova Ficha" : "Editar Ficha",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Informações Básicas",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: primaryColor,
                ),
              ),
              Divider(),
              Material(
                elevation: 2.0,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(35, 158, 158, 158),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    spacing: 10.0,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.0,
                        children: [
                          Text("Nome da Ficha"),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10.0,
                              ),
                              isDense: true,
                              hintText: "Treino A - Peito & Tríceps",
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.0,
                        children: [
                          Text("Divisão"),
                          TextField(
                            controller: _divisionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10.0,
                              ),
                              isDense: true,
                              hintText: "A (3x/semana)",
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.0,
                        children: [
                          Text("Objetivo"),
                          TextField(
                            controller: _objectiveController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10.0,
                              ),
                              isDense: true,
                              hintText: "Hipertrofia e força básica",
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                spacing: 8.0,
                children: [
                  Icon(Icons.checklist, color: primaryColor),
                  Text(
                    "Lista de Exercícios",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Divider(),
              Column(
                children: [
                  FutureBuilder(
                    future: Future(() {}),
                    builder: (context, asyncSnapshot) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: _exercises.length,
                        itemBuilder: (context, index) => null,
                      );
                    },
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      minimumSize: Size.fromHeight(50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Adicionar Exercício"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

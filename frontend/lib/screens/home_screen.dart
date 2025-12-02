import 'package:flutter/material.dart';
import 'package:gym_note/screens/workout_plan_editor_screen.dart';
import 'package:gym_note/tabs/historical_tab.dart';
import 'package:gym_note/tabs/dashboard_tab.dart';
import 'package:gym_note/tabs/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _activeMenu = 0;
  Widget _childContent = DashboardTab();
  String _subTitle = "Minhas Fichas de Treino";
  bool _synchronized = false;

  void _synchronizeData() {
    setState(() {
      _synchronized = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        shadowColor: Colors.black,
        actionsPadding: EdgeInsets.all(8.0),
        actions: [
          IconButton(
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: primaryColor,
              elevation: 2.0,
              shadowColor: Colors.black,
            ),
            onPressed: _synchronizeData,
            icon: Icon(
              _synchronized
                  ? Icons.cloud_done_outlined
                  : Icons.cloud_off_outlined,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gym Note",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Olá, João!", style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2.0,
        shadowColor: Colors.black,
        child: TabBar(
          controller: _tabController,
          tabAlignment: TabAlignment.fill,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          onTap: (value) {
            if (value == _activeMenu) return;

            setState(() {
              _activeMenu = value;

              switch (value) {
                case 0:
                  _childContent = DashboardTab();
                  _subTitle = 'Minhas Fichas de Treino';
                  break;
                case 1:
                  _childContent = HistoricalTab();
                  _subTitle = 'Histórico e Progresso';
                default:
                  _childContent = SettingTab();
                  _subTitle = 'Configurações e Conta';
              }
            });
          },
          tabs: [
            Column(children: [Icon(Icons.fitness_center), Text("Fichas")]),
            Column(children: [Icon(Icons.history), Text("Histórico")]),
            Column(children: [Icon(Icons.settings), Text("Config.")]),
          ],
        ),
      ),
      floatingActionButton: _activeMenu == 0
          ? Container(
              alignment: Alignment.bottomRight,
              width: 45.0,
              height: 45.0,
              child: FittedBox(
                child: FloatingActionButton(
                  foregroundColor: Colors.white,
                  shape: CircleBorder(),
                  backgroundColor: primaryColor,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutPlanEditorScreen(addOrEdit: "add",)),
                  ),
                  child: const Icon(Icons.add, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : null,
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _subTitle,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            Divider(),
            Expanded(child: _childContent),
          ],
        ),
      ),
    );
  }
}

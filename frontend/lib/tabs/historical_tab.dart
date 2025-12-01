import 'package:flutter/material.dart';

class HistoricalTab extends StatefulWidget {
  const HistoricalTab({super.key});

  @override
  State<HistoricalTab> createState() => _HistoricalTabState();
}

class _HistoricalTabState extends State<HistoricalTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Gráfico Evolução de Carga
        Text(
          "Sessões Recentes",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) => null),
        ),
      ],
    );
  }
}

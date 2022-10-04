import 'package:flutter/material.dart';
import 'package:personal_expense/ui/pages/dashboard/home/charts/charts_page.dart';
import 'package:personal_expense/ui/pages/dashboard/home/data_grid/data_grid_page.dart';
import 'package:personal_expense/ui/pages/dashboard/home/slider/slider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("Data grid"),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DataGridPage())),
          ),
          ListTile(
            title: const Text("Charts"),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DataChartPage())),
          ),
          ListTile(
            title: const Text("Slider"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DataSliderPage())),
          ),
        ],
      ),
    );
  }
}

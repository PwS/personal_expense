import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DataChartPage extends StatefulWidget {
  const DataChartPage({Key? key}) : super(key: key);

  @override
  DataChartPageState createState() => DataChartPageState();
}

class DataChartPageState extends State<DataChartPage> {
  List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Charts'),
        ),
        body: Column(children: [
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: const SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
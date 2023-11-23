import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/statistics/line_chart.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int selectedIndex = -1;
  int selectedCardIndex = -1;
    String selectedTimeRange = 'Month';
  String selectedCategoryType = 'Income'; // Default to Income

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteText,
        elevation: 0,
        title: Text(
          'Statistics',
          style: TextStyle(color: darkColor),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: darkColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save_alt,
                color: darkColor,
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTimeRangeButton(0, 'Day'),
              SizedBox(width: 8),
              buildTimeRangeButton(1, 'Week'),
              SizedBox(width: 8),
              buildTimeRangeButton(2, 'Month'),
              SizedBox(width: 8),
              buildTimeRangeButton(3, 'Year'),
            ],
          ),
          // Button for selecting category type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryTypeButton('Income'),
              _buildCategoryTypeButton('Expense'),
            ],
          ),
          // Curved fl_chart
          Container(
            height: 200,
            child: _buildChart(),
          ),
          Row(
            children: [
              Text(
                'Top Spending',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Transform.rotate(
                  angle: 90 * (3.141592653589793 / 180),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sync_alt,
                        color: greyText,
                      )))
            ],
          ),
          buildCard(0, " Starbucks", "Jan 12, 2022", "\$7882", 'img'),
          buildCard(1, " Transfer", "Jan 2, 2023", "\$7882", 'img'),
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationWidget(),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 239, 235, 235),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeRangeButton(int index, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedTimeRange = text;
            if (selectedIndex == index) {
              selectedIndex = -1; // Unselect the button
            } else {
              selectedIndex = index;
            }
          });
          // Fetch and update data based on the selected time range
        _updateChartData();

        },
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? whiteText : greyText,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: selectedIndex == index
              ? MaterialStateProperty.all<Color>(defaultColor)
              : null,
        ),
      ),
    );
  }

  Widget buildCard(
      int index, String title, String subtitle, String value, String img) {
    return Card(
      elevation: 0,
      color: selectedCardIndex == index ? defaultColor : null,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(25.0), // Adjust the radius as needed
      ),
      child: ListTile(
        selectedColor: selectedCardIndex == index ? defaultColor : darkColor,
        leading: CircleAvatar(),
        title: Text(
          title,
          style: TextStyle(
              color: selectedCardIndex == index ? whiteText : darkColor,
              fontSize: 16),
        ),
        subtitle: Text(subtitle,
            style: TextStyle(
                color: selectedCardIndex == index ? whiteText : darkColor,
                fontSize: 13)),
        trailing: Text(value,
            style: TextStyle(
                color: selectedCardIndex == index ? whiteText : darkColor,
                fontSize: 18)),
        onTap: () {
          setState(() {
            selectedCardIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCategoryTypeButton(String categoryType) {
  bool isSelected = selectedCategoryType == categoryType;

  return ElevatedButton(
    onPressed: () {
      setState(() {
        selectedCategoryType = categoryType;
      });
      // Fetch and update data based on the selected category type
      _updateChartData();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ?defaultColor :greyText, 
    ),
    child: Text(
      categoryType,
      style: TextStyle(
        color: isSelected ? whiteText:whiteText, // Set the text color
      ),
    ),
  );
}


  Widget _buildChart() {
    // Use the fl_chart library to display the chart
    // Customize this based on your data and requirements
    // Example: LineChart or LineChart.fromDateTimeMaps
    return LineChart(
      LineChartData(
        // Configuration for the chart data
        // Add your data and styling here
        // Example: gridData, titlesData, borderData, lineBarsData, ...
      ),
    );
  }

  void _updateChartData() {
    // Fetch data from Hive based on selectedTimeRange and selectedCategoryType
    // Filter and process the data
    // Update the chart data
    // Example: setState(() { chartData = newData; });
  }
}

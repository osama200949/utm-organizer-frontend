import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';

class SelectedCoursesScreen extends StatefulWidget {
  @override
  _SelectedCoursesScreenState createState() => _SelectedCoursesScreenState();
}

class _SelectedCoursesScreenState extends State<SelectedCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScheduleData>(context);
    return Scaffold(
      appBar: TopAppBar(
        appBar: AppBar(),
      ),
      //  body: Container(
      //    color: Colors.green,
      //  ),
      body: data.selectedCourses.length!=0 ? ListView.builder(
          itemCount: data.selectedCourses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data.selectedCourses[index].name),
              // title:Text( 'data.selectedCourses[index].name'),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32,
                ),
                onPressed: (){
                  data.removeCourse(data.selectedCourses[index]);
                  // setState(() {
                    
                  // });
                },
              ),
            );
          }):
          Center(child: Text('Nothing selected yet',style: TextStyle(fontSize: 32,color: Colors.black),))
    );
  }
}

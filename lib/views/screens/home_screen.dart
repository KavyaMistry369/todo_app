import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/date_controller.dart';
import 'package:todo_app/controllers/page_controller.dart';
import 'package:todo_app/modals/user_modal.dart';
import 'package:todo_app/views/screens/calendar_screen.dart';
import 'package:todo_app/views/screens/task_screen.dart';

enum type {DueDate,Priority,Label,Project}

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    type _selectedSegment = type.DueDate;
   UserModal account =  ModalRoute.of(context)!.settings.arguments as UserModal;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        backgroundColor: const Color.fromRGBO(102, 102, 246,100),
        toolbarHeight: 150,
        title: Text("My Tasks",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Opacity(
              opacity: 0.5,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz_outlined,color:Colors.deepPurpleAccent,)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16),child: PageView(
        onPageChanged: (i){
          Provider.of<pageController>(context,listen: false).ChnagePageIndex(index: i);
        },
        controller:  Provider.of<pageController>(context).pagecontroller,
        children: const [
          TaskScreen(),
          CalendarScreen(),
        ],
      ),),
      drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: CircleAvatar(
                radius: 30,
                  foregroundImage: NetworkImage(account.image)), accountEmail: Text(account.Email,style: GoogleFonts.poppins(),)),
              const SizedBox(height: 30,),
            ],
          )
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: Provider.of<pageController>(context).pageIndex,
          onTap: (i){
            Provider.of<pageController>(context,listen: false).ChnagePageIndex(index: i);
          },
          items: const [
         BottomNavigationBarItem(icon: Icon(Icons.list_alt,color: Color.fromRGBO(102, 102, 246,100),size: 35,),label: ""),
         BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined,color: Color.fromRGBO(102, 102, 246,100),size: 35,),label: ""),
      ]),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(bottom: 6.0),
          child:  Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: const  Color.fromRGBO(102, 102, 246,100),
              onPressed: () {
                showCupertinoModalPopup(context: context, builder: (context) => Padding(
                  padding: const EdgeInsets.only(bottom: 300,top: 200),
                  child: StatefulBuilder(
                    builder: (context, setState){
                      return CupertinoActionSheet(
                        title: Text("What would you like to do?",style: GoogleFonts.poppins(fontSize: 15),),
                        cancelButton: TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Add")),
                        message: Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              CupertinoTextField.borderless(
                                suffix: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){
                                      showCupertinoModalPopup(
                                          context: context, builder: (context) =>  Container(
                                        height: 300,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
                                          color: CupertinoColors.white,
                                        ),
                                        child: CupertinoDatePicker(
                                          showDayOfWeek: true,
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (value) {
                                            Provider.of<DateController>(context,listen: false).changemydate(Date: value);
                                            Provider.of<DateController>(context,listen: false).mydate=value;
                                            print(value);
                                          },initialDateTime: Provider.of<DateController>(context,listen:false).mydate,),
                                      ));
                                    }, icon: Icon(Icons.calendar_today_outlined)),
                                    IconButton(onPressed: (){
                                      showCupertinoModalPopup(context: context, builder: (context) =>  Container(
                                        height: 300,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
                                          color: CupertinoColors.white,
                                        ),
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged: (value) {
                                            Provider.of<DateController>(context,listen: false).Changemytime(time: value);
                                          },initialDateTime: Provider.of<DateController>(context,listen:false).mytime,),
                                      ));
                                    }, icon: Icon(Icons.access_time_outlined))
                                  ],
                                ),
                                style: GoogleFonts.poppins(),
                                autocorrect: true,
                                enabled: true,
                                placeholder: "Add You task",
                              ),
                              SizedBox(height: 20,),
                              CupertinoSlidingSegmentedControl<type>(
                              backgroundColor: Colors.white,
                                thumbColor:  Color.fromRGBO(102, 102, 246,100),
                                // This represents the currently selected segmented control.
                                groupValue: _selectedSegment,
                                // Callback that sets the selected segmented control.
                                onValueChanged: (type? value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedSegment = value;
                                    });
                                  }
                                },
                                children: const <type, Widget>{
                                  type.DueDate: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(Icons.date_range),
                                  ),
                                  type.Label: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child:Icon(Icons.label_important_outline),
                                  ),
                                  type.Priority: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child:Icon(Icons.priority_high_rounded),
                                  ),
                                  type.Project: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child:Icon(Icons.book_outlined),
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),);
              },
              child: const Icon(Icons.add_task,color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}
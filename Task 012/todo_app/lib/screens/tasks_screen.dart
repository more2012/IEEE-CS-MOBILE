import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.tasks});
  final List<Map>tasks;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.88,
            height: MediaQuery.of(context).size.height * 0.78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: ListView.separated(
              itemBuilder:
                  (context, index) => ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_box, color: Colors.white),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(widget.tasks[index]['title'],
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.archive, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.white),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.tasks[index]['time'],
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            widget.tasks[index]['date'],
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: widget.tasks.length,
            ),
          ),
        ],
      ),
    );
  }
}

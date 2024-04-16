import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import 'features/chapters/domain/entities/chapter_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: TreeViewPage(),
      );
}

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  List<ChapterModel> chapters = [
    ChapterModel(isOpen: true, isChapter: true, id: 0),
    ChapterModel(isOpen: true, isLesson: true, id: 1),
    ChapterModel(isOpen: false, isLesson: true, id: 2),
    ChapterModel(isOpen: false, isChapter: true, id: 3),
    ChapterModel(isOpen: false, isLesson: true, id: 4),
    ChapterModel(isOpen: false, isCheckPoint: true, id: 5),
    ChapterModel(isOpen: false, isChapter: true, id: 6),
    ChapterModel(isOpen: false, isLesson: true, id: 7),
    ChapterModel(isOpen: false, isChapter: true, id: 8),
    // ChapterModel(isOpen: false, isAssessment: true),
    // ChapterModel(isOpen: false, isLesson: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.01,
              maxScale: 5.6,
              child: GraphView(
                graph: graph,
                algorithm:
                    BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key?.value as int;
                  return rectangleWidget(a);
                },
              )),
        ),
      ],
    ));
  }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue.shade200, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    // final node7 = Node.Id(7);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.transparent);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6, paint: Paint()..color = Colors.transparent);
    // graph.addEdge(node5, node7);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}

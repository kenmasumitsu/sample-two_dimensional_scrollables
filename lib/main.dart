import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: TableView.builder(
        columnCount: 10,
        rowCount: 20,
        columnBuilder: _buildColumnSpan,
        rowBuilder: _buildRowSpan,
        cellBuilder: _buildCell,
        //pinnedRowCount: 1,
        //pinnedColumnCount: 1,
      ),
    );
  }

  TableSpan _buildColumnSpan(int index) {
    return TableSpan(
      extent: const FixedTableSpanExtent(100),
      backgroundDecoration: TableSpanDecoration(
        color: index.isEven ? Colors.redAccent[100] : Colors.white,
      ),
      foregroundDecoration: const TableSpanDecoration(
        border: TableSpanBorder(
          trailing: BorderSide(
            color: Colors.red,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  TableSpan _buildRowSpan(int index) {
    return TableSpan(
      extent: const FixedTableSpanExtent(100),
      backgroundDecoration: TableSpanDecoration(
        color: index.isEven ? Colors.blueAccent[100] : Colors.white,
      ),
      foregroundDecoration: const TableSpanDecoration(
        border: TableSpanBorder(
          trailing: BorderSide(
            color: Colors.blue,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
    if ((vicinity.row == 1 || vicinity.row == 2) &&
        (vicinity.column == 1 || vicinity.column == 2)) {
      return TableViewCell(
        rowMergeStart: 1,
        rowMergeSpan: 2,
        columnMergeStart: 1,
        columnMergeSpan: 2,
        child: Center(
          child: Text('## Tile c: ${vicinity.column}, r: ${vicinity.row}'),
        ),
      );
    }
    return TableViewCell(
      child: Center(
        child: Text('Tile c: ${vicinity.column}, r: ${vicinity.row}'),
      ),
    );
  }
}

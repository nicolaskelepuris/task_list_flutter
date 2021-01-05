import 'package:flutter/material.dart';
import 'package:task_list_app/infrastructure/theme/colors.theme.dart';
import 'package:task_list_app/presentation/home/widgets/page_constraints.dart';

class DataTableWidget<T> extends StatelessWidget {
  final List<DataRow> rows;
  final List<String> columns;
  final bool expand;
  final bool showEdit;
  DataTableWidget({
    @required this.rows,
    @required this.columns,
    this.showEdit = false,
    this.expand = false,
  });

  final _headerStyle = TextStyle(
    color: ColorsTheme.primary.withOpacity(.7),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    var col = columns
        .map(
          (e) => DataColumn(
            label: Text(
              e,
              style: _headerStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();

    if (showEdit) {
      col.insert(
        0,
        DataColumn(
          label: SizedBox(width: 20, child: Icon(Icons.edit)),
        ),
      );
    }

    return Container(
      width: expand ? PageConstraints.maxWidth : null,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFC8CEE2).withOpacity(.23),
          width: 2,
        ),
      ),
      child: DataTable(showCheckboxColumn: false, columns: col, rows: rows, sortAscending: false,),
    );
  }
}
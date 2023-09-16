import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/model/file_DataModel.dart';

class DroppedFileWidget extends StatelessWidget {
  final File_Data_Model? file;
  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildImage(context)),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    if (file == null) return buildEmptyFile('No Selected File');

    print(file!.url);

    return Container(
      height: 150,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (file != null) buildFileDetail(file),
          Divider(
            thickness: 2,
            height: 5,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      file!.url,

                      // errorBuilder: (context, error, _) => buildEmptyFile('No Preview'),
                    ))),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyFile(String text) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.blue.shade300,
      child: Center(child: Text(text)),
    );
  }

  Widget buildFileDetail(File_Data_Model? file) {
    final style = TextStyle(fontSize: 10);
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Selected File Preview ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
          Text(
            'Name: ${file?.name}',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Type: ${file?.mime}', style: style),
          const SizedBox(
            height: 10,
          ),
          Text('Size: ${file?.size}', style: style),
        ],
      ),
    );
  }
}

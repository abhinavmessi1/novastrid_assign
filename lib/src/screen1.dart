import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:prac_code/src/widgets/download_button.dart';
import 'package:prac_code/src/widgets/editor.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../model/file_DataModel.dart';
import 'DropZoneWidget.dart';
import 'DroppedFileWidget.dart';

class containerOfmainPage extends StatefulWidget {
  const containerOfmainPage({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<containerOfmainPage> createState() => _containerOfmainPageState();
}

class _containerOfmainPageState extends State<containerOfmainPage> {
  File_Data_Model? file;
  var sizedbox = SizedBox(
    height: 20,
  );
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;
  bool switcvalue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
        ),
      ),
      height: widget.height,
      width: widget.width,
      child: SingleChildScrollView(child: customColumn()),
    );
  }

  Widget customColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Content",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Divider(
          thickness: 2,
        ),
        Text("Description"),
        sizedbox,
        Editor(),
        sizedbox,
        Text("content Upload *"),
        sizedbox,
        Container(
          height: 120,
          child: DropZoneWidget(
            onDroppedFile: (file) => setState(() => this.file = file),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DroppedFileWidget(file: file),
        GestureDetector(
          child: DownloadButton(switcvalue),
          onTap: () {
            setState(() {
              switcvalue = !switcvalue;
            });
          },
        )
      ],
    );
  }
}

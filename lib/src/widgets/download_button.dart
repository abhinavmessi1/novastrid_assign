import "package:flutter/material.dart";

class DownloadButton extends StatefulWidget {
  var value = false;
  DownloadButton(this.value, {super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  void toggleSwitch(bool value) {
    if (widget.value == false) {
      setState(() {
        widget.value = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        widget.value = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Download",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: widget.value,
          onChanged: toggleSwitch,
          activeColor: Colors.green,
          inactiveTrackColor: Colors.blueAccent,
        )
      ],
    );
  }
}

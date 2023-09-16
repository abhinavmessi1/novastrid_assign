import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
      height: 220,
      width: double.infinity,
      padding: EdgeInsets.all(3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  shouldEnsureVisible: true,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  defaultToolbarButtons: [
                    ColorButtons(),
                    FontButtons(),
                    FontSettingButtons(),
                    StyleButtons()
                  ],
                  toolbarPosition: ToolbarPosition.belowEditor, //by default
                  //   toolbarType: ToolbarType.nativeExpandable, //by default
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
                    print(
                        "button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                ),
                otherOptions: OtherOptions(
                  height: 150,
                ),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                }, onImageUploadError:
                    (FileUpload? file, String? base64Str, UploadError error) {
                  print(describeEnum(error));
                  print(base64Str ?? '');
                  if (file != null) {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                  }
                }, onKeyDown: (int? keyCode) {
                  print('$keyCode key downed');
                  print(
                      'current character count: ${controller.characterCount}');
                }, onKeyUp: (int? keyCode) {
                  print('$keyCode key released');
                }, onMouseDown: () {
                  print('mouse downed');
                }, onMouseUp: () {
                  print('mouse released');
                }, onNavigationRequestMobile: (String url) {
                  print(url);
                  return NavigationActionPolicy.ALLOW;
                }, onPaste: () {
                  print('pasted into editor');
                }, onScroll: () {
                  print('editor scrolled');
                }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      })
                ]),
          ],
        ),
      ),
    );
  }
}

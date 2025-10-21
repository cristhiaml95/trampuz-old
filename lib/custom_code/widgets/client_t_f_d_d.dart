// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ClientTFDD extends StatefulWidget {
  const ClientTFDD({
    super.key,
    this.width,
    this.height,
    required this.clientList,
    required this.action,
    required this.resetAction,
  });

  final double? width;
  final double? height;
  final List<ClientRowStruct> clientList;
  final Future Function() action;
  final Future Function() resetAction;

  @override
  State<ClientTFDD> createState() => _ClientTFDDState();
}

class _ClientTFDDState extends State<ClientTFDD> {
  TextEditingController _textController = TextEditingController();
  String? _selectedValue;
  bool _isDropdownVisible = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  void _toggleDropdown() {
    if (_isDropdownVisible) {
      _hideDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.clientList.map((ClientRowStruct item) {
                  return ListTile(
                    title: Text(
                      item.client,
                      style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => _selectItem(item),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() {
      _isDropdownVisible = true;
    });
  }

  void _hideDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    setState(() {
      _isDropdownVisible = false;
    });
  }

  void _selectItem(ClientRowStruct item) {
    setState(() async {
      _selectedValue = item.id;
      _textController.text = item.client;
      _hideDropdown();
      FFAppState().clientApiV = _textController.text;
      FFAppState().clientApiId = _selectedValue!;
      await widget.action();
    });
  }

  void _resetTextField() {
    _hideDropdown();
    setState(() {
      FFAppState().clientApiB = false;
      _textController.clear();
      _selectedValue = null;
      widget.resetAction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: TextField(
              style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
              controller: _textController,
              onChanged: (String newText) async {
                FFAppState().clientApiV = newText;
                if (newText.isEmpty) {
                  await widget.resetAction();
                  await widget.action();
                } else {
                  await widget.action();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Radio del borde
                  borderSide: BorderSide(
                    color: Colors.black, width: 2.0, // Color del borde
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Radio del borde
                  borderSide: BorderSide(
                    color: Colors.black, width: 2.0, // Color del borde
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Radio del borde
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0, // Color del borde
                  ),
                ),
                hintText: 'Client',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: _resetTextField,
                    ),
                    IconButton(
                      icon: Icon(
                        _isDropdownVisible
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                      onPressed: _toggleDropdown,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

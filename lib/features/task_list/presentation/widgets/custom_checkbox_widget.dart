import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
      widget.onChanged(isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCheckbox,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isChecked ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
          border: Border.all(color: isChecked ? Colors.transparent : Colors.grey.shade200, // Borde plomo
            width: 2,
          ),
          boxShadow: [
            if (isChecked)
              BoxShadow(
                color: isChecked? Colors.green.withOpacity(0.5): Colors.pink.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              )
            : null,
      ),
    );
  }
}
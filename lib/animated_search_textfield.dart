import 'package:flutter/material.dart';

/// Animated search text field with integrated SearchButton.
class AnimatedSearchTextField extends StatefulWidget {
  final TextField? searchTextField;
  final double expandedWidth;
  final Duration duration;
  final IconData searchIcon;
  final IconData backIcon;
  final Color? iconColor;
  final Color? searchTextFieldColor;
  final Color? iconBackgroundColor;
  final double? iconSize;
  final FloatingActionButton? floatingActionButton;

  const AnimatedSearchTextField({
    super.key,
    this.searchTextField,
    this.expandedWidth = 300,
    this.duration = const Duration(milliseconds: 600),
    this.searchIcon = Icons.search,
    this.backIcon = Icons.arrow_forward,
    this.iconColor,
    this.searchTextFieldColor = Colors.white,
    this.iconSize,
    this.iconBackgroundColor,
    this.floatingActionButton,
  });

  @override
  State<AnimatedSearchTextField> createState() =>
      _AnimatedSearchTextFieldState();
}

class _AnimatedSearchTextFieldState extends State<AnimatedSearchTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> widthAnim;
  final TextEditingController textController = TextEditingController();
  bool expanded = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    widthAnim = Tween<double>(
      begin: 96,
      end: widget.expandedWidth,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  void toggle() {
    setState(() {
      expanded = !expanded;
      if (expanded) {
        controller.forward();
      } else {
        controller.reverse();
        if (textController.text.isNotEmpty) {
          textController.clear();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: widthAnim.value,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: controller.value > 0 ? widget.searchTextFieldColor : null,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  Only show text field when expanded
              if (controller.value > 0)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: widget.searchTextField ??
                        TextField(
                          controller: textController,
                          readOnly: true,
                          cursorColor: Colors.black,
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                        ),
                  ),
                ),

              /// toggle add both button add widget and by default button
              widget.floatingActionButton != null
                  ? FloatingActionButton(
                      onPressed: toggle, // REQUIRED
                      elevation: widget.floatingActionButton!.elevation,
                      backgroundColor:
                          widget.floatingActionButton!.backgroundColor ??
                              Colors.deepOrange,
                      foregroundColor:
                          widget.floatingActionButton!.foregroundColor,
                      shape: widget.floatingActionButton!.shape,
                      child: widget.floatingActionButton!.child,
                    )
                  : FloatingActionButton(
                      onPressed: toggle,
                      elevation: 0,
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.grey.shade300)),
                      backgroundColor:
                          widget.iconBackgroundColor ?? Colors.deepOrange,
                      child: Icon(
                        expanded ? widget.backIcon : widget.searchIcon,
                        size: widget.iconSize,
                        color: widget.iconColor ?? Colors.white,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

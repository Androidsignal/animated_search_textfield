import 'package:flutter/material.dart';

/// A customizable animated search text field widget with an integrated
/// [FloatingActionButton].
///
/// The widget animates between a collapsed icon-only state and an expanded
/// search text field state. You can customize its icons, colors, duration,
/// and even provide your own [TextField] or [FloatingActionButton].
class AnimatedSearchTextField extends StatefulWidget {
  /// The custom [TextField] to display when expanded.
  ///
  /// If `null`, a default read-only [TextField] with hint `"Search..."` is used.
  final TextField? searchTextField;

  /// The maximum width of the search text field when expanded.
  ///
  /// Defaults to `300`.
  final double expandedWidth;

  /// The duration of the expand/collapse animation.
  ///
  /// Defaults to `600 milliseconds`.
  final Duration duration;

  /// The icon displayed when collapsed.
  ///
  /// Defaults to [Icons.search].
  final IconData searchIcon;

  /// The icon displayed when expanded.
  ///
  /// Defaults to [Icons.arrow_forward].
  final IconData backIcon;

  /// The color of the icon inside the [FloatingActionButton].
  final Color? iconColor;

  /// The background color of the search text field.
  ///
  /// Defaults to [Colors.white].
  final Color? searchTextFieldColor;

  /// The background color of the [FloatingActionButton].
  final Color? iconBackgroundColor;

  /// The size of the icon inside the [FloatingActionButton].
  final double? iconSize;

  /// An optional custom [FloatingActionButton] to replace the default one.
  ///
  /// If provided, its `onPressed` is ignored and replaced by the internal toggle.
  final FloatingActionButton? floatingActionButton;

  /// Creates an [AnimatedSearchTextField].
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

  /// Toggles between expanded and collapsed states.
  ///
  /// Expands the search bar if collapsed, and collapses it if expanded.
  /// Clears the text field when collapsing.
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
              // Show text field only when expanded
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

              /// Use custom FAB if provided, otherwise default toggle button
              widget.floatingActionButton != null
                  ? FloatingActionButton(
                      onPressed: toggle,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../resources.dart';

class Input extends ConsumerStatefulWidget {
  const Input({
    Key? key,
    this.label,
    this.controller,
    this.obscureInput = false,
    this.padding = const EdgeInsets.all(AppPadding.medium),
    this.leading,
    this.trailing,
    this.keyboardType,
    this.style,
    this.validator,
    this.maxLength,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final bool obscureInput;
  final TextInputType? keyboardType;
  final Widget? trailing;
  final Widget? leading;
  final EdgeInsets padding;
  final TextStyle? style;
  final int? maxLength;

  @override
  ConsumerState<Input> createState() => _InputState();
}

class _InputState extends ConsumerState<Input> {
  final _focused = StateProvider((ref) => false);
  final _inputFocus = FocusNode();

  void _setFocus(bool value) => ref.read(_focused.notifier).state = value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FocusScope(
      child: Focus(
        onFocusChange: _setFocus,
        child: GestureDetector(
          onTap: () {
            _setFocus(true);
            FocusScope.of(context).requestFocus(_inputFocus);
          },
          child: FormField(
            validator: widget.validator,
            initialValue: widget.controller?.text,
            builder: (state) {
              final isFocused = ref.watch(_focused);

              return LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: widget.padding,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                        border: Border.all(
                          color: isFocused
                              ? theme.textTheme.bodyMedium?.color ??
                                  Colors.black
                              : const Color(0xFF96A3B1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          if (widget.leading != null) widget.leading!,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.label != null) ...{
                                  Transform.translate(
                                    offset: Offset(
                                      0,
                                      (isFocused ||
                                              state.value?.isNotEmpty == true)
                                          ? 0
                                          : 12,
                                    ),
                                    child: Text(
                                      widget.label!,
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        fontFamily: isFocused
                                            ? AppFonts.titleFamily
                                            : null,
                                      ),
                                    ),
                                  )
                                },
                                TextField(
                                  focusNode: _inputFocus,
                                  controller: widget.controller,
                                  keyboardType: widget.keyboardType,
                                  obscureText: widget.obscureInput,
                                  onChanged: (value) => state.didChange(value),
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    counterText: '',
                                  ),
                                  style: widget.style,
                                  maxLength: widget.maxLength,
                                ),
                              ],
                            ),
                          ),
                          if (widget.trailing != null) widget.trailing!,
                        ],
                      ),
                    ),
                    if (state.hasError) ...{
                      const SizedBox(height: AppPadding.small / 2),
                      Text(
                        state.errorText!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.error,
                        ),
                      )
                    },
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputFocus.dispose();
    super.dispose();
  }
}

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
            builder: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(builder: (_, ref, __) {
                  final isFocused = ref.watch(_focused);
                  return Container(
                    padding: widget.padding,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      border: Border.all(
                        color: isFocused
                            ? theme.textTheme.bodyMedium?.color ?? Colors.black
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
                                _label(isFocused, state)
                              },
                              _textField(state),
                            ],
                          ),
                        ),
                        if (widget.trailing != null) widget.trailing!,
                      ],
                    ),
                  );
                }),
                if (state.hasError) _errorText(state),
              ],
            ),
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

  void _setFocus(bool value) => ref.read(_focused.notifier).state = value;

  /// retrieve the label of the text field
  Widget _label(bool isFocused, FormFieldState<String> state) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle =
        (isFocused ? textTheme.labelSmall : textTheme.bodyLarge)?.copyWith(
      fontFamily: isFocused ? AppFonts.titleFamily : null,
    );
    // get the text style for the text field or
    // retrieve the default text field text style
    final style = widget.style ?? textTheme.titleMedium;
    // retrieve the font size of the style to get the displacement of the label text
    final height = style?.fontSize ?? 0;
    // remove the displacement from half the height of the label so the label
    // can fit directly in the middle of the field
    final distance = height - (labelStyle?.fontSize ?? 0) / 2;
    return Transform.translate(
      offset: Offset(
        0,
        (isFocused || state.value?.isNotEmpty == true) ? 0 : distance,
      ),
      child: Text(
        widget.label!,
        style: labelStyle,
        maxLines: 1,
      ),
    );
  }

  /// create the text field
  Widget _textField(FormFieldState<String> state) {
    return TextField(
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
    );
  }

  /// create the error text
  Widget _errorText(FormFieldState<String> state) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppPadding.small / 2),
        Text(
          state.errorText!,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.error,
          ),
        ),
      ],
    );
  }
}

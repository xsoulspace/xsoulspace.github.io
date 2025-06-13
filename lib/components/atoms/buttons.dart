import 'package:jaspr/jaspr.dart';

/// Button atoms for interactive elements
/// Provides consistent button styling with ceramic-inspired design

enum ButtonVariant { primary, secondary, ghost, link }

enum ButtonSize { small, medium, large }

class CeramicButton extends StatelessComponent {
  const CeramicButton({
    required this.text,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.disabled = false,
    this.icon,
    super.key,
  });

  final String text;
  final ButtonVariant variant;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final bool disabled;
  final String? icon;

  String get _variantClass {
    switch (variant) {
      case ButtonVariant.primary:
        return 'btn-primary';
      case ButtonVariant.secondary:
        return 'btn-secondary';
      case ButtonVariant.ghost:
        return 'btn-ghost';
      case ButtonVariant.link:
        return 'btn-link';
    }
  }

  String get _sizeClass {
    switch (size) {
      case ButtonSize.small:
        return 'btn-sm';
      case ButtonSize.medium:
        return 'btn-md';
      case ButtonSize.large:
        return 'btn-lg';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'ceramic-btn',
      _variantClass,
      _sizeClass,
      if (disabled) 'btn-disabled',
    ].join(' ');

    yield button(
      [
        if (icon != null) ...[
          DomComponent(
            tag: 'span',
            children: [Text(icon!)],
            classes: 'btn-icon',
          ),
        ],
        Text(text),
      ],
      classes: classes,
      attributes: {if (disabled) 'disabled': 'true', 'type': 'button'},
      events: {
        if (onPressed != null && !disabled) 'click': (event) => onPressed!(),
      },
    );
  }
}

class IconButton extends StatelessComponent {
  const IconButton({
    required this.icon,
    this.onPressed,
    this.disabled = false,
    this.tooltip,
    super.key,
  });

  final String icon;
  final VoidCallback? onPressed;
  final bool disabled;
  final String? tooltip;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      [
        DomComponent(
          tag: 'span',
          children: [Text(icon)],
          classes: 'icon-btn-content',
        ),
      ],
      classes: 'icon-btn ${disabled ? 'btn-disabled' : ''}',
      attributes: {
        if (disabled) 'disabled': 'true',
        if (tooltip != null) 'title': tooltip!,
        'type': 'button',
      },
      events: {
        if (onPressed != null && !disabled) 'click': (event) => onPressed!(),
      },
    );
  }
}

class LinkButton extends StatelessComponent {
  const LinkButton({
    required this.text,
    required this.href,
    this.external = false,
    this.icon,
    super.key,
  });

  final String text;
  final String href;
  final bool external;
  final String? icon;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      [
        if (icon != null) ...[
          DomComponent(
            tag: 'span',
            children: [Text(icon!)],
            classes: 'link-icon',
          ),
        ],
        Text(text),
        if (external) ...[
          DomComponent(
            tag: 'span',
            children: [Text('↗')],
            classes: 'external-icon',
          ),
        ],
      ],
      href: href,
      classes: 'link-btn',
      attributes: {
        if (external) 'target': '_blank',
        if (external) 'rel': 'noopener noreferrer',
      },
    );
  }
}

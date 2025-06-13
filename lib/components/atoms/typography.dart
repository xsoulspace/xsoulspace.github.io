import 'package:jaspr/jaspr.dart';

/// Typography atoms for the ceramic-inspired design system
/// Provides consistent text styling across the application

class BrandTitle extends StatelessComponent {
  const BrandTitle(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h1([
      DomComponent(tag: 'span', children: [Text(text)], classes: 'brand-title'),
    ]);
  }
}

class BrandSubtitle extends StatelessComponent {
  const BrandSubtitle(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([
      DomComponent(
        tag: 'span',
        children: [Text(text)],
        classes: 'brand-subtitle',
      ),
    ]);
  }
}

class NavCategory extends StatelessComponent {
  const NavCategory(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h3([
      DomComponent(
        tag: 'span',
        children: [Text(text)],
        classes: 'nav-category',
      ),
    ]);
  }
}

class NavItem extends StatelessComponent {
  const NavItem(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'span',
      children: [Text(text)],
      classes: 'nav-item',
    );
  }
}

class SectionTitle extends StatelessComponent {
  const SectionTitle(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h2([
      DomComponent(
        tag: 'span',
        children: [Text(text)],
        classes: 'section-title',
      ),
    ]);
  }
}

class CardTitle extends StatelessComponent {
  const CardTitle(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h3([
      DomComponent(tag: 'span', children: [Text(text)], classes: 'card-title'),
    ]);
  }
}

class CardSubtitle extends StatelessComponent {
  const CardSubtitle(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([
      DomComponent(
        tag: 'span',
        children: [Text(text)],
        classes: 'card-subtitle',
      ),
    ]);
  }
}

class CardDescription extends StatelessComponent {
  const CardDescription(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([
      DomComponent(
        tag: 'span',
        children: [Text(text)],
        classes: 'card-description',
      ),
    ]);
  }
}

class CardMeta extends StatelessComponent {
  const CardMeta(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'small',
      children: [Text(text)],
      classes: 'card-meta',
    );
  }
}

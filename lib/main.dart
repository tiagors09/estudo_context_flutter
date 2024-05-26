import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget2 extends StatelessWidget {
  const AppWidget2({super.key});

  @override
  Widget build(covariant Element element) {
    // isso é basicamente um set state, marca um build
    // quebra a ideia de um widget sem estado
    element.markNeedsBuild();
    return const Placeholder();
  }
}

class AppWidget extends Widget {
  const AppWidget({super.key});

  @override
  Element createElement() {
    return AppElement(this);
  }
}

class AppElement extends ComponentElement {
  AppElement(super.widget);

  @override
  Widget build() {
    final context = this as BuildContext;

    return Container(
      color: Colors.deepOrange,
      alignment: Alignment.center,
      child: const Text(
        'Hello',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class Context {
  final String name;
  final List<Element> elements;

  Context(this.name, this.elements);

  Context copyWith(
    String? name,
    List<Element>? elements,
  ) =>
      Context(
        name ?? this.name,
        elements ?? this.elements,
      );
}

test() {
  var context = Context('ctx1', []);
  context = context.copyWith(context.name, [...context.elements]);
}

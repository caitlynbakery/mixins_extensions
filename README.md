# Mixins and Extensions

We can use mixins to share functionality
in multiple classes without code duplication.
Mixins can't be instantiated as objects.

```dart
class Breathing {
 void breathe() => print('breathing');
}

mixin Swimming {
void swim() => print('swimming');
}

class Animal with Breathing {
 
}
class Fish extends Animal with Swimming {
  
}
```

Mixins have the danger of named collision because
Dart doesn't throw an error when we assign variables/methods
with the same name inside two mixins. This can lead
to unexpected situations in our code.

```dart
mixin Mixin1 {
  int foo = 1;
}

mixin Mixin2 {
  int foo = 2;
}

class Foo with Mixin1, Mixin2{
  void printFoo() {
    print(foo);
  }
}

//printFoo() ouputs 2
```

## Extensions

Extensions are a useful way to create methods on existing libraries. When
we want to reuse extensions, we have to name our extensions or else it won't
work.

```dart
extension NumberParsing on String {
  int? toIntOrNull() => int.tryParse(this);
}

void main(){
  int.tryParse('123');
  '123'.toIntOrNull();
  '456'.toIntOrNull();
}
```
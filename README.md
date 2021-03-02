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

We can use a generic type constraint, such as T, to write an extension
that applies to all subclasses from a specific class. For example, I
used `T` on the `num` class so that the extension can be used for all
subclasses under `num`.

If we don't put a base class, then Dart uses Object by default.

```dart
extension IterableX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
}

void main(){
  int sum1 = [1,2,3].sum();
  double sum = [1.0,2.0,3.0].sum();
}
```

In the example below, I created an extension called `Range` that creates a method
called `rangeTo`. The rangeTo  method first checks if the `other` variable is greater
than this and returns an empty list. In this case, the `other` is 46 and `this` is 28, so 
it runs a for loop. The for loop runs until 28 is less than or equal to 46 and adds `i` to
an empty list.

```dart
extension Range on int {
  List rangeTo (int other){
    
    if(other < this){
      return [];
    }
    var list = [];
    for(var i = this; i<=other; i++){
      list.add(i);
    }
return list;
  }
}
void main() {
  for(var i in 28.rangeTo(46)) {
    print(i);
  }
}
```
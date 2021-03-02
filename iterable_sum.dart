// extension IterableX<T extends num> on Iterable<T> {
//   T sum() => reduce((value, element) => (value + element) as T);
// }

// void main(){
//   int sum1 = [1,2,3].sum();
//   double sum = [1.0,2.0,3.0].sum();
//   print(sum);
// }

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
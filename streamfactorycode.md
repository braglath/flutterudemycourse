import 'dart:async';

class cake{}
class Order{
//   tell the type 
  String type;
  Order(this.type);
}

void main() {
// create stream controller
// controller takes in the order(sink) and gives it to the factory(stream)
  final controller = new StreamController();
// create a new order and give it to sink using the controller
  final order = new Order('banana'); //created the order
// create a class to check the order type is equal to or not(logic)
  final baker = new StreamTransformer.fromHandlers(
  handleData: (cakeType, sink){
    if(cakeType == 'banana'){
      sink.add(new cake()); // if it is true it creates a new instance Cake
    }
    else{
      sink.addError('I cant bake that type!!');
    }
  } //passing in the type and the sink
  );
  controller.sink.add(order); //added the order to the sink
// now we need to send only the type property to the stream
  controller.stream.map((order)=> order.type).transform(baker).listen(
  (cake) => print('here is your cake $cake'), onError: (err)=> print(err));
}


import 'package:flutter/material.dart';
import 'package:flutter6_nike_store/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(name: 'Zoom Freak', price: '236', imagePath: 'lib/images/ZoomFreak.png', description: 'The forward-thinking design of his latest signature shoe'),
    Shoe(name: 'Air Jordans', price: '220', imagePath: 'lib/images/AirJordan.png', description: 'The Air Jordan shoes are the best in class shoes'),
    Shoe(name: 'KD Treys', price: '240', imagePath: 'lib/images/KDTREY.png', description: 'A secure strap is suited for scoring binges and defensive play style'),
    Shoe(name: 'Kyrie 6', price: '190', imagePath: 'lib/images/Kyrie.png', description: 'Cushioning is paired with soft yet supportive faom for extra comfort')
  ];
  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
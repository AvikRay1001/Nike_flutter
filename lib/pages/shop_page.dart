// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    // alert user
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Successfully added to cart!!'),
      content: Text('Check your cart'),
    ));
  }

  


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
      children: [
        //search bar
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search", style: TextStyle(color: Colors.grey),),
              Icon(Icons.search),
            ],
          ),
        ),

        //message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text('everyone flies... some fly longer than others', style: TextStyle(color: Colors.grey[600]),)
        ),

        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot Picks 🔥',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              Text(
                'See all',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
            //get a shoe
            Shoe shoe = value.getShoeList()[index];
            return ShoeTile(
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        //   child: Divider(
        //     color: Colors.white,
        //   ),
        // )
      ],
    ),
    );
  }
}
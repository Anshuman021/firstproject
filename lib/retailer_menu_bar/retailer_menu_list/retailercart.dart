import 'package:flutter/material.dart';

class RetailerCart extends StatelessWidget {
  const RetailerCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Cart Page"),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CheckoutScreenflower extends StatelessWidget {
//   final cart;
//   //final sum;

//   CheckoutScreenflower(this.cart);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         ListView.separated(
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(cart[index].product),
//               trailing: Text(
//                 "\$${cart[index].p_promotion_price}",
//                 style: const TextStyle(
//                     color: Colors.redAccent,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500),
//               ),
//               onTap: () {},
//             );
//           },
//           separatorBuilder: (context, index) {
//             return Divider();
//           },
//           itemCount: cart.length,
//           shrinkWrap: true,
//         ),
//         // Divider(),
//         // Text("Total : \$$sum"),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import '/screens/cart_screen.dart';
import '/widgets/nearby_restaurants.dart';
import '/widgets/recent_orders.dart';
import '/data/data.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Food Delivery'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
            iconSize: 30,
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0.8,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintText: 'Search food or restaurants..',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: _focusNode.hasFocus
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                  suffixIcon: _searchText.trim().isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                              _searchText = '';
                            });
                          },
                        ),
                ),
              ),
            ),
            RecentOrders(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(),
            ),
            NearbyRestaurants(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/screens/restaurants_screen.dart';
import '/widgets/rating_star.dart';
import '/data/data.dart';
import '/models/restaurant.dart';

class NearbyRestaurants extends StatelessWidget {
  GestureDetector _restaurantsList(
      BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RestaurantsScreen.routeName,
          arguments: restaurant),
      child: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Colors.grey[200]!,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingStars(rating: restaurant.rating),
                    Text(
                      restaurant.address,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListBody(
            children: restaurants
                .map(
                  (restaurant) => _restaurantsList(context, restaurant),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

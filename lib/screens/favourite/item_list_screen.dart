import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/fav_provider.dart';
import 'package:provider_mastering/screens/favourite/favourite_screen.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => FavouriteItemScreen()),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,

              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.favouriteList.contains(index)) {
                          value.removeFav(index);
                        } else {
                          value.addFav(index);
                        }
                      },
                      leading: Icon(Icons.production_quantity_limits),
                      title: Text("Item $index"),
                      trailing: Icon(
                        value.favouriteList.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/fav_provider.dart';

class FavouriteItemScreen extends StatefulWidget {
  const FavouriteItemScreen({super.key});

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite List"),
        actions: [Icon(Icons.favorite)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favProvider.favouriteList.length,

              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.favouriteList.contains(index)) {
                          value.removeFav(index);
                        }
                      },
                      leading: Icon(Icons.production_quantity_limits),
                      title: Text("Item $index"),
                      trailing: Icon(Icons.favorite),
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

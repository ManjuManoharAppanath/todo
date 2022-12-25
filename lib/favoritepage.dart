import 'package:flutter/material.dart';
import 'package:todo/favorite_provider.dart';
import 'package:provider/provider.dart';
class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final provider=Provider.of<FavoriteProvider>(context);
   final myfavorite=provider.words;
    return Scaffold(appBar: AppBar(title: Text('English Word'),
    ),
      body: ListView.builder(itemCount:myfavorite.length,itemBuilder: (BuildContext context,int i)
      {
        final myfav=myfavorite[i];
        return ListTile(leading: Text(myfav),
          trailing: IconButton(onPressed: (){

            provider.toggleFavorite(myfav);
          },
            icon:provider.isExist(myfav)?
            Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),
          ),
        );
      }
      ),
    );
  }
}

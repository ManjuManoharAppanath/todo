import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo/favoritepage.dart';

import 'favorite_provider.dart';

class  Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words=['time','year','people','way','day','man','thing'];
    final provider=Provider.of<FavoriteProvider>(context);

    return Scaffold(appBar: AppBar(title: Text('English Word'),
    ),
    body: ListView.builder(itemCount:words.length,itemBuilder: (BuildContext context,int i)
    {
      // return Row(crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //   Text(words[i]),
      //   Icon(Icons.favorite_border),
      // ],);
      final word=words[i];
      return ListTile(leading: Text(word),
      trailing: IconButton(onPressed: (){

        provider.toggleFavorite(word);
      },
        icon:provider.isExist(word)?
           Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),
      ),
      );
    }
    ),
      floatingActionButton:FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
      }, label: Text('ok'),) ,
    );
  }
}

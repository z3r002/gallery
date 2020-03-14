import 'package:flutter/material.dart';
import 'package:flutter_gallery/pagePhoto.dart';
import 'services.dart';
import 'album.dart';
import 'cell.dart';

void main() => runApp(GridViewDemo());

class GridViewDemo extends StatefulWidget {

  @override
  GridViewDemoState createState() => GridViewDemoState();
}

class GridViewDemoState extends State<GridViewDemo> {

  gridview(BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (album) {
            return GestureDetector(
              child: GridTile(
                child: AlbumCell(album),
              ),
              onTap: () {
                //goToDetailsPage(context, album);
                goToPage(context, album);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToPage(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => PhotoPage(
          curAlbum: album,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Album>>(
                future: Services.getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    return gridview(context, snapshot);
                  }
                  return circularProgress();
                },
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}

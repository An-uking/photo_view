import 'package:example/screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class FullScreenExamples extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Full Screen Examples",
            showGoBack: true,
          ),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new ExampleButtonNode(
                  title: "Large Image",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenWrapper(
                          imageProvider: AssetImage("assets/large-image.jpg"),
                        ),
                      )
                    );
                  }
                ),

                new ExampleButtonNode(
                    title: "Small Image (custom background)",
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenWrapper(
                            imageProvider: AssetImage("assets/small-image.jpg"),
                            backgroundColor: Colors.pinkAccent,
                          ),
                        ),
                      );
                    }
                ),



                new ExampleButtonNode(
                  title: "Image from the internet",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenWrapper(
                          imageProvider: NetworkImage("https://source.unsplash.com/900x1600/?camera,paper"),
                        ),
                      ),
                    );
                  }
                ),


                new ExampleButtonNode(
                  title: "Animated GIF",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenWrapper(
                          imageProvider: AssetImage("assets/peanut.gif"),
                          backgroundColor: Colors.white,
                          maxScale: 2.0,
                        ),
                      ),
                    );
                  }
                ),

  /* TODO: https://github.com/renancaraujo/photo_view/issues/12
                new ExampleButtonNode(
                  title: "Image in memory",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenWrapper(),
                      ),
                    );
                  }
                ),
*/

                new ExampleButtonNode(
                    title: "Limited scale",
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenWrapper(
                            imageProvider: AssetImage("assets/large-image.jpg"),
                            minScale: PhotoViewScaleBoundary.contained * 0.8,
                            maxScale: PhotoViewScaleBoundary.covered * 1.1,
                          ),
                        ),
                      );
                    }
                ),


              ],
            )
          )
        ],
      ),
    );
  }
}

class ExampleButtonNode extends StatelessWidget{
  final String title;
  final Function onPressed;

  ExampleButtonNode({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: new Column(
        children: <Widget>[
          new Text(this.title,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 21.0,
              fontWeight: FontWeight.w600
            ),
          ),
          new Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: new RaisedButton(
              onPressed: onPressed,
              child: new Text("Open example"),
              color: Colors.amber,
            )
          )
        ],
      )
    );
  }

}



class FullScreenWrapper extends StatelessWidget{
  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Color backgroundColor;
  final dynamic minScale;
  final dynamic maxScale;


  FullScreenWrapper({
    this.imageProvider,
    this.loadingChild,
    this.backgroundColor,
    this.minScale,
    this.maxScale
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: new PhotoView(
        imageProvider: imageProvider,
        loadingChild: loadingChild,
        backgroundColor: backgroundColor,
        minScale: minScale,
        maxScale: maxScale,
      )
    );
  }

}
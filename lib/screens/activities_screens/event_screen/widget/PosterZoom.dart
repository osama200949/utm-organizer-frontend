import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:utm_orgnization/utils/FeadAnmation.dart';
import 'package:utm_orgnization/utils/constants.dart';

//! from the documentation related to the packge
//https://github.com/renancaraujo/photo_view

class HeroExample extends StatelessWidget {
  final String imagePath;
  HeroExample(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            HeroPhotoViewWrapper(
                              imageProvider: NetworkImage(
                                imagePath,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Hero(
                    tag: "someTag",
                    child: Image(
                      image: NetworkImage(
                        imagePath,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeroPhotoViewWrapper extends StatelessWidget {
  const HeroPhotoViewWrapper({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        loadingBuilder: loadingBuilder,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}

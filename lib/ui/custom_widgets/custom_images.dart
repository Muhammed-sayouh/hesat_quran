import 'package:flutter/cupertino.dart';

import '../../helpers/constants.dart';

class CustomAssetImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imagePath;
  const CustomAssetImage(
      {Key? key, this.height, this.width, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imagePath;
  const CustomNetworkImage(
      {Key? key, this.height, this.width, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FadeInImage.assetNetwork(
        image: imagePath,
        fit: BoxFit.fill,
        placeholder: Constants.loaderIcon,
        imageErrorBuilder: (BuildContext context, x, u) =>
            const CustomAssetImage(imagePath: Constants.logoImage),
      ),
    );
  }
}

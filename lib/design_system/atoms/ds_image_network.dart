import 'package:flutter/material.dart';

class DsImageNetwork extends StatelessWidget {
  const DsImageNetwork({
    super.key,
    this.urlImage,
    this.emptyIcon,
    this.errorIcon,
    this.fit,
    this.height,
    this.width = 100,
  });

  final String? urlImage;
  final Widget? emptyIcon;
  final Widget? errorIcon;
  final BoxFit? fit;
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return urlImage == null
        ? Icon(
            Icons.image,
            color: Colors.grey.shade300,
            size: width,
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                urlImage!,
                fit: fit ?? BoxFit.fill,
                width: width,
                height: height ?? width,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Center(
                            child: SizedBox(
                              width: width,
                              height: height ?? width,
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                errorBuilder: (context, error, stackTrace) =>
                    errorIcon ??
                    Icon(
                      Icons.image,
                      size: width,
                    ),
              ),
            ),
          );
  }
}
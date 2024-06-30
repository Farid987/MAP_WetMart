import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Wet_Mart/common/color_extension.dart';

import '../model/type_model.dart';

class CategoryCell extends StatelessWidget {
  final TypeModel pObj;
  final VoidCallback onPressed;

  const CategoryCell({super.key, required this.pObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: (pObj.color ?? TColor.primary).withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      // pObj.image?.replaceFirst('localhost', '192.168.1.8') ??
                      //     "",
                      pObj.image?.replaceFirst('localhost', '10.20.48.84') ??
                          "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Text(
                    pObj.typeName ?? "",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

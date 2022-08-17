import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/style/font_style.dart';

PreferredSizeWidget? commonAppBar(BuildContext context , String title){
  return AppBar(
        centerTitle: true,
        
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              CupertinoIcons.chevron_back,
              color: Colors.black,
              size: 40,
            )),
        title: Text(
          title,
          style: mediumBlackFont().copyWith(color: Colors.black ,fontWeight: FontWeight.bold),
        ),
      );
}
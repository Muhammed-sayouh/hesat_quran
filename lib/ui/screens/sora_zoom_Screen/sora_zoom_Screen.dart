import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants.dart';
import '../../../view_model/sora_details_view_model.dart';
import '../../custom_widgets/custom_images.dart';
import '../../theme/sizes/sizes.dart';

class SoraZoomScreen extends StatelessWidget {
  const SoraZoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SoraDetialsViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNetworkImage(
            imagePath: provider.imageUrl!,
            height: height(context, 0.7),
            width: width(context, 0.9),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width(
                  context,
                  0.18,
                ),
                vertical: height(context, 0.02)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => provider.previousPage(),
                  child: CustomAssetImage(
                    imagePath: Constants.forwardCircleIcon,
                    width: width(context, 0.15),
                  ),
                ),
                const BigPadding(
                  horizental: true,
                ),
                const BigPadding(
                  horizental: true,
                ),
                InkWell(
                  onTap: () => provider.nextPage(),
                  child: CustomAssetImage(
                    imagePath: Constants.backCircleIcon,
                    width: width(context, 0.15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

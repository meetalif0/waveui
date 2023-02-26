import 'package:waveui/src/constants/wave_asset_constants.dart';
import 'package:waveui/src/theme/configs/wave_selection_config.dart';
import 'package:waveui/src/utils/wave_tools.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WaveSelectionMenuItemWidget extends StatelessWidget {
  final String title;
  final bool isHighLight;
  final bool active;
  final VoidCallback? itemClickFunction;

  WaveSelectionConfig themeData;

  WaveSelectionMenuItemWidget(
      {Key? key,
      required this.title,
      this.isHighLight = false,
      this.active = false,
      this.itemClickFunction,
      required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _menuItemTapped();
        },
        child: Container(
          color: Colors.transparent,
          constraints: BoxConstraints.expand(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Flexible(
                child: Text(
                  this.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                  style: isHighLight
                      ? themeData.menuSelectedTextStyle.generateTextStyle()
                      : themeData.menuNormalTextStyle.generateTextStyle(),
                ),
              )),
              Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: isHighLight
                      ? (active
                          ? WaveUITools.getAssetImageWithBandColor(
                              WaveAsset.iconArrowUpSelect,
                              configId: themeData.configId)
                          : WaveUITools.getAssetImageWithBandColor(
                              WaveAsset.iconArrowDownSelect))
                      : (active
                          ? WaveUITools.getAssetImageWithBandColor(
                              WaveAsset.iconArrowUpSelect,
                              configId: themeData.configId)
                          : WaveUITools.getAssetImage(
                              WaveAsset.iconArrowDownUnSelect)))
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  void _menuItemTapped() {
    if (this.itemClickFunction != null) {
      this.itemClickFunction!();
    }
  }
}

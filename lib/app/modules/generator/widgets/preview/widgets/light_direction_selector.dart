import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generator_controller.dart';

class LightDirectionSelector extends StatelessWidget {
  final Alignment position;
  LightDirectionSelector({
    Key? key,
    required this.position,
  }) : super(key: key);

  final GeneratorController generator = Get.find();

  double? _getPosition(String corner, Alignment partPosition) {
    String partPositionString = partPosition.toString();

    switch (partPositionString) {
      case 'Alignment.topLeft':
        if (corner == 'left' || corner == 'top') {
          return 0;
        }
        return null;
      case 'Alignment.topRight':
        if (corner == 'top' || corner == 'right') {
          return 0;
        }
        return null;
      case 'Alignment.bottomLeft':
        if (corner == 'bottom' || corner == 'left') {
          return 0;
        }
        return null;
      case 'Alignment.bottomRight':
        if (corner == 'bottom' || corner == 'right') {
          return 0;
        }
        return null;
      default:
        break;
    }
    return 0;
  }

  void Function()? _getFunction(Alignment partPosition) {
    String partPositionString = partPosition.toString();
    switch (partPositionString) {
      case 'Alignment.topLeft':
        return () {
          generator.lightSource(Alignment.topLeft);
        };
      case 'Alignment.topRight':
        return () {
          generator.lightSource(Alignment.topRight);
        };
      case 'Alignment.bottomLeft':
        return () {
          generator.lightSource(Alignment.bottomLeft);
        };
      case 'Alignment.bottomRight':
        return () {
          generator.lightSource(Alignment.bottomRight);
        };
      default:
        return () {};
    }
  }

  int _getQuarterTurns(Alignment partPosition) {
    String partPositionString = partPosition.toString();
    switch (partPositionString) {
      case 'Alignment.topLeft':
        return 0;
      case 'Alignment.topRight':
        return 1;
      case 'Alignment.bottomLeft':
        return 3;
      case 'Alignment.bottomRight':
        return 2;
      default:
        return 0;
    }
  }

  Color _getColor(Alignment partPosition) {
    if (partPosition == generator.lightSource.value) {
      return Colors.yellow;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _getPosition('top', position),
      bottom: _getPosition('bottom', position),
      left: _getPosition('left', position),
      right: _getPosition('right', position),
      child: InkWell(
        onTap: _getFunction(position),
        child: RotatedBox(
          quarterTurns: _getQuarterTurns(position),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: _getColor(position),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
                border: Border.all(
                  color: generator.getPrimaryColor,
                  width: 2,
                ),
              ),
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

class MenuHeaderWidget extends GetView<PagesController> {
  final String text;
  final Image image;
  final RxBool menuExpanded;
  final bool showItem;
  final logoVisible = true.obs;

  MenuHeaderWidget({
    @required this.text,
    @required this.image,
    @required this.menuExpanded,
    @required this.showItem,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: menuExpanded.value
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: menuExpanded.value
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: menuExpanded.value
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: menuExpanded.value
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  if (menuExpanded.value && showItem)
                    IconButton(
                      icon: Icon(
                        logoVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Get.theme.primaryColor.withOpacity(.35),
                      ),
                      onPressed: () => logoVisible.value = !logoVisible.value,
                    ),
                ],
              ),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 100),
                crossFadeState:
                    logoVisible.value && menuExpanded.value && showItem
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                firstChild: SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                  child: image,
                ),
                secondChild: SizedBox(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: menuExpanded.value ? 3 : 0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 10,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          Divider(color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}

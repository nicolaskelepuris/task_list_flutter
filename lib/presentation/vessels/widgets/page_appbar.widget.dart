import 'package:flutter/material.dart';
import 'package:task_list_app/infrastructure/theme/colors.theme.dart';

class PageAppbarWidget extends StatelessWidget {
  PageAppbarWidget(
      {this.description,
      this.searchLabelText = '',
      this.hasSearchBox = true,
      this.buttonText,
      this.onButtonPressed,
      this.hasSecondButton = false,
      this.secondButtonText,
      this.onSecondButtonPressed,
      this.onSearchChanged});
  final String description;
  final String searchLabelText;
  final bool hasSearchBox;
  final String buttonText;
  final Function onButtonPressed;
  final bool hasSecondButton;
  final String secondButtonText;
  final Function onSecondButtonPressed;
  final Function(String) onSearchChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(3.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: TextStyle(fontSize: 16.0, color: ColorsTheme.primary),
              ),
              (hasSearchBox
                  ? Row(
                      children: [
                        Icon(Icons.search),
                        Container(
                          child: SingleChildScrollView(
                            child: TextField(
                              onChanged: onSearchChanged,
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorsTheme.primary),
                                  ),
                                  labelText: searchLabelText),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: 55.0,
                        ),
                      ],
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 55.0,
                    )),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: 45.0,
                    child: ElevatedButton(
                      child: Text(
                        buttonText,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: onButtonPressed,
                    ),
                  ),
                  hasSecondButton
                      ? Row(
                          children: [
                            SizedBox(width: 20.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.07,
                              height: 45.0,
                              child: ElevatedButton(
                                child: Text(
                                  secondButtonText,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onPressed: onSecondButtonPressed,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

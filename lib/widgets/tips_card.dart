import 'package:flutter/material.dart';
import 'package:project_cozy/theme.dart';
import 'package:project_cozy/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl ?? '',
          width: 80,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tips.title ?? '',
                style: blackTextStyle.copyWith(fontSize: 18)),
            const SizedBox(height: 4),
            Text(
              "Updated ${tips.updateAt}",
              style: greyTextStyle,
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        )
      ],
    );
  }
}

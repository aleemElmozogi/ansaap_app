part of '../home_screen.dart';

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
    required this.title,
    required this.description,
    required this.vector,
  });

  final String title;
  final String vector;
  final String description;
  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
        contentPadding: EdgeInsets.all(10.r),
        borderColor: AppColors.primary,
        child: Row(
          spacing: 5.w,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  AppText(
                    title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    description,
                    maxLines: 4,
                    fontSize: 14.sp,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: SvgPicture.asset(
                vector,
                height: 70.h,
              ),
            ),
          ],
        ),
        onPressed: () {});
  }
}

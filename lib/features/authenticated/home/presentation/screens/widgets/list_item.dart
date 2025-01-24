part of '../home_screen.dart';

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
    required this.title,
    required this.description,
    this.vector,
    this.imagePath = '',
    required this.onPressed,
  });

  final String title;
  final String? vector;
  final String imagePath;
  final String description;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
        contentPadding: EdgeInsets.all(10.r),
        borderColor: AppColors.primary,
        onPressed: onPressed,
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
              child: vector == null
                  ? Image.asset(
                      imagePath,
                      height: 70.h,
                      color: AppColors.grey,
                    )
                  : SvgPicture.asset(
                      vector ?? '',
                      height: 70.h,
                    ),
            ),
          ],
        ));
  }
}

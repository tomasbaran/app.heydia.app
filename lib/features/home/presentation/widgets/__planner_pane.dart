part of 'home_screen.dart';

class _PlannerPane extends StatelessWidget {
  const _PlannerPane();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.space8),
      decoration: BoxDecoration(
        color: AppColors.neutral300,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.radius52)),
      ),
      // Free space for future content
    );
  }
}

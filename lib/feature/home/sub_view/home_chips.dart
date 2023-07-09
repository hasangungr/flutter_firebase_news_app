part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(this.tag);
  final Tags tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.paddingLow,
      child: Chip(
        padding: context.padding.paddingLow,
        backgroundColor: ColorConstants.purplePrimary,
        label: Text(
          tag.name ?? '',
          style: context.general.textTheme.bodySmall
              ?.copyWith(color: ColorConstants.white),
        ),
      ),
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip(this.tag);
  final Tags tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.paddingLow,
      child: Chip(
        padding: context.padding.paddingLow,
        backgroundColor: ColorConstants.grayLighter,
        label: Text(tag.name ?? ''),
      ),
    );
  }
}

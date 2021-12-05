part of pack_app;

class ProjectsGrid extends SliverGrid {
  ProjectsGrid({
    required final NullableIndexedWidgetBuilder builder,
    required final int count,
    required final ScreenLayout screenLayout,
    final Key? key,
  }) : super(
          key: key,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                (screenLayout.medium || screenLayout.small || count == 1)
                    ? 1
                    : 2,
            childAspectRatio: 3 / 4,
            mainAxisExtent: 490,
          ),
          delegate: SliverChildBuilderDelegate(
            builder,
            childCount: count,
          ),
        );
}

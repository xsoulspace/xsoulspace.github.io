part of abstract;

@immutable
class ProjectStatus with EquatableMixin {
  const ProjectStatus({
    required final this.projectStatus,
    required final this.statusName,
    required final this.color,
  });

  final ProjectStatuses projectStatus;
  final String statusName;
  final Color color;

  @override
  List<Object?> get props => [projectStatus];
}

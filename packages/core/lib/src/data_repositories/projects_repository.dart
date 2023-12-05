import 'package:flutter/material.dart';

import '../../core.dart';

class ProjectsRepository {
  ProjectsRepository.provide(final BuildContext context);
  Future<void> putAll({required final List<ProjectModel> projects}) async =>
      throw UnimplementedError('');
  Future<void> put({required final ProjectModel project}) async =>
      throw UnimplementedError('');
  Future<void> remove({required final ProjectModelId id}) async =>
      throw UnimplementedError('');

  // Future<PaginatedPageResponseModel<ProjectModel>> getPaginated({
  //   required final PaginatedPageRequestModel<RequestProjectsDto> request,
  // }) async =>
  //     throw UnimplementedError('');
}

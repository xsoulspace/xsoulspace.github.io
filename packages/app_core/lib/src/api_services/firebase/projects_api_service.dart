import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../abstract/abstract.dart';

class FirebaseProjectsApiService implements IProjectsApiService {
  FirebaseProjectsApiService();
  FirebaseFirestore get _store => FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get _collection {
    return _store.collection('projects');
  }

  CollectionReference<ProjectModel> get _docCollection =>
      _collection.withConverter(
        fromFirestore: ProjectModel.fromFirestore,
        toFirestore: ProjectModel.toFirestore,
      );

  @override
  Future<ProjectModel?> getByProjectId(final ProjectModelId id) async {
    final ref = _docCollection.doc(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  @override
  Query<ProjectModel> get projectQuery {
    return _docCollection.orderBy('releasedAt', descending: true);
  }

  @override
  Future<ProjectModel> upsertProject(final ProjectModel model) async {
    ProjectModel? project;
    if (model.id.isNotEmpty) {
      project = await getByProjectId(model.id);
    }
    if (project != null) {
      // update
      await _docCollection.doc(model.id).set(model);
    } else {
      // create
      final docRef = await _docCollection.add(model);
      final newId = docRef.id;
      project = model.copyWith(id: newId);
      await _docCollection.doc(newId).set(project);
    }

    return project;
  }

  @override
  Future<void> deleteProject(final ProjectModel model) async {
    await _docCollection.doc(model.id).delete();
  }
}

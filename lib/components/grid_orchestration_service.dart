import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Service for orchestrating grid layout and responsive behavior.
///
/// Handles project categorization, grid configuration, and interaction coordination
/// for the DynamicBentoGrid system.
class GridOrchestrationService {
  const GridOrchestrationService._();

  static const GridOrchestrationService instance = GridOrchestrationService._();

  /// Categorize projects by their preferred size and type
  ProjectCategories categorizeProjects(List<ProjectModel> projects) {
    final micro = <ProjectModel>[];
    final standard = <ProjectModel>[];
    final featured = <ProjectModel>[];

    for (final project in projects) {
      if (project.preferredSize.isMicro || project.isLibrary) {
        micro.add(project);
      } else if (project.preferredSize.isFeatured) {
        featured.add(project);
      } else {
        standard.add(project);
      }
    }

    return ProjectCategories(
      micro: micro,
      standard: standard,
      featured: featured,
    );
  }

  /// Get optimal grid configuration based on screen width
  GridConfiguration getOptimalGridConfig(
    double screenWidth,
    BentoConfig config,
  ) {
    return config.getGridConfigForWidth(screenWidth);
  }

  /// Calculate grid layout strategy based on project distribution
  GridLayoutStrategy calculateLayoutStrategy(
    ProjectCategories categories,
    GridConfiguration gridConfig,
  ) {
    final totalProjects = categories.totalCount;
    final microRatio = categories.micro.length / totalProjects;
    final standardRatio = categories.standard.length / totalProjects;
    final featuredRatio = categories.featured.length / totalProjects;

    // Determine optimal layout based on project distribution
    if (microRatio > 0.6 && gridConfig.allowMicroClusters) {
      return GridLayoutStrategy.microFocused;
    } else if (featuredRatio > 0.3) {
      return GridLayoutStrategy.featuredFocused;
    } else {
      return GridLayoutStrategy.balanced;
    }
  }

  /// Sort projects for optimal visual flow
  List<ProjectModel> sortProjectsForDisplay(
    List<ProjectModel> projects,
    GridLayoutStrategy strategy,
  ) {
    switch (strategy) {
      case GridLayoutStrategy.microFocused:
        // Group libraries together, then by popularity
        return projects..sort((a, b) {
          if (a.isLibrary && !b.isLibrary) return -1;
          if (!a.isLibrary && b.isLibrary) return 1;
          return b.metrics.stars.compareTo(a.metrics.stars);
        });

      case GridLayoutStrategy.featuredFocused:
        // Featured projects first, then by recency
        return projects..sort((a, b) {
          if (a.preferredSize.isFeatured && !b.preferredSize.isFeatured) {
            return -1;
          }
          if (!a.preferredSize.isFeatured && b.preferredSize.isFeatured) {
            return 1;
          }
          return b.metrics.downloads.compareTo(a.metrics.downloads);
        });

      case GridLayoutStrategy.balanced:
        // Balanced mix with strategic placement
        return projects..sort((a, b) {
          // Mix different types for visual variety
          final aScore = _calculateDisplayScore(a);
          final bScore = _calculateDisplayScore(b);
          return bScore.compareTo(aScore);
        });
    }
  }

  double _calculateDisplayScore(ProjectModel project) {
    double score = 0;

    // Base score from metrics
    score += project.metrics.stars * 0.3;
    score += project.metrics.downloads * 0.0001; // Scale down downloads
    score += project.metrics.forks * 0.2;

    // Bonus for different types
    if (project.isGame) score += 100;
    if (project.isApp) score += 80;
    if (project.preferredSize.isFeatured) score += 150;

    return score;
  }
}

/// Container for categorized projects
class ProjectCategories {
  const ProjectCategories({
    required this.micro,
    required this.standard,
    required this.featured,
  });

  final List<ProjectModel> micro;
  final List<ProjectModel> standard;
  final List<ProjectModel> featured;

  int get totalCount => micro.length + standard.length + featured.length;

  bool get hasMicroProjects => micro.isNotEmpty;
  bool get hasStandardProjects => standard.isNotEmpty;
  bool get hasFeaturedProjects => featured.isNotEmpty;
}

/// Grid layout strategies based on project distribution
enum GridLayoutStrategy {
  microFocused, // Many libraries/packages
  featuredFocused, // Several featured projects
  balanced, // Mixed distribution
}

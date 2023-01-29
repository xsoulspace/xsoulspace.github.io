extension StringExtension on String {
  int toInt() => int.parse(this);
  LinkType get linkType {
    if (contains('www.youtube.com')) return LinkType.youtubeVideo;
    if (contains('http')) return LinkType.networkImage;
    return LinkType.noLink;
  }
}

enum LinkType {
  youtubeVideo,
  networkImage,
  noLink,
}

class TorrentEntity {
  final String quality;
  final String type;
  final String size;
  final int seeds;
  final int peers;

  const TorrentEntity({
    required this.quality,
    required this.type,
    required this.size,
    required this.seeds,
    required this.peers,
  });
}
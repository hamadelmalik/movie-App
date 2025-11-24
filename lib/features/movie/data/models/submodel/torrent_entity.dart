import 'package:movie_app/features/movie/domain/entities/subentities/torrent_entity.dart';

class TorrentModel extends TorrentEntity {
  // ---- الحقول الإضافية الخاصة بالـ Model ----
  final String url;
  final String hash;
  final String isRepack;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int sizeBytes;
  final String dateUploaded;
  final int dateUploadedUnix;

  const TorrentModel({
    // ---- الحقول الموجودة في الـ Entity (super) ----
    required super.quality,
    required super.type,
    required super.size,
    required super.seeds,
    required super.peers,

    // ---- الحقول الإضافية الخاصة بالـ Model فقط ----
    required this.url,
    required this.hash,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory TorrentModel.fromJson(Map<String, dynamic> json) {
    return TorrentModel(
      // ---- الحقول الأساسية (super) ----
      quality: json['quality'] ?? '',
      type: json['type'] ?? '',
      size: json['size'] ?? '',
      seeds: json['seeds'] ?? 0,
      peers: json['peers'] ?? 0,

      // ---- الحقول الإضافية ----
      url: json['url'] ?? '',
      hash: json['hash'] ?? '',
      isRepack: json['is_repack'] ?? '',
      videoCodec: json['video_codec'] ?? '',
      bitDepth: json['bit_depth'] ?? '',
      audioChannels: json['audio_channels'] ?? '',
      sizeBytes: json['size_bytes'] ?? 0,
      dateUploaded: json['date_uploaded'] ?? '',
      dateUploadedUnix: json['date_uploaded_unix'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // ---- الحقول الأساسية (super) ----
      'quality': quality,
      'type': type,
      'size': size,
      'seeds': seeds,
      'peers': peers,

      // ---- الحقول الإضافية ----
      'url': url,
      'hash': hash,
      'is_repack': isRepack,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }

}

import 'package:movie_app/features/movie/domain/entities/subentities/torrent_entity.dart';

class TorrentModel extends TorrentEntity {
  final String url;
  final String hash;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int sizeBytes;
  final String dateUploaded;
  final int dateUploadedUnix;

  TorrentModel({
    required super.quality,
    required super.type,
    required super.size,
    required super.seeds,
    required super.peers,
    required this.url,
    required this.hash,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  /////////////fromJson/////////////////////
  factory TorrentModel.fromJson(Map<String, dynamic> json) {
    return TorrentModel(
      quality: json['quality'],
      type: json['type'],
      size: json['size'],
      seeds: json['seeds'],
      peers: json['peers'],
      url: json['url'],
      hash: json['hash'],
      videoCodec: json['video_codec'],
      bitDepth: json['bit_depth'],
      audioChannels: json['audio_channels'],
      sizeBytes: json['size_bytes'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }

  //////////toJson///////////////////////////
  Map<String, dynamic> toJson() {
    return {
      'quality': quality,
      'type': type,
      'size': size,
      'seeds': seeds,
      'peers': peers,
      'url': url,
      'hash': hash,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}

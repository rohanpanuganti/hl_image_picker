class HLPickerItem {
  const HLPickerItem({
    required this.path,
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.width,
    required this.height,
    required this.type,
    this.duration,
    this.thumbnail,
  });

  final String path;
  final String id;
  final String name;
  final String mimeType;
  final int size;
  final int width;
  final int height;
  final String type;
  final double? duration;
  final String? thumbnail;

  factory HLPickerItem.fromMap(Map<dynamic, dynamic> json) {
    // Helper function to safely convert to int, defaulting to 0 if null or invalid
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v) ?? 0;
      return 0;
    }

    // Helper function to safely convert to double?, returning null if null or invalid
    double? _toDouble(dynamic v) {
      if (v == null) return null;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v);
      return null;
    }

    return HLPickerItem(
      path: json['path'] != null ? Uri.decodeFull(json['path'].toString()) : '',
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      mimeType: json['mimeType']?.toString() ?? '',
      size: _toInt(json['size']),
      width: _toInt(json['width']),
      height: _toInt(json['height']),
      duration: _toDouble(json['duration']),
      thumbnail: json['thumbnail']?.toString(),
      type: json['type']?.toString() ?? '',
    );
  }

  Map<dynamic, dynamic> toMap() {
    final data = <dynamic, dynamic>{};
    data['path'] = path;
    data['id'] = id;
    data['name'] = name;
    data['mimeType'] = mimeType;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['duration'] = duration;
    data['thumbnail'] = thumbnail;
    data['type'] = type;
    return data;
  }
}

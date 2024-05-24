

import 'package:flutter/services.dart';


class PrintPda {

  static  methodChannel = const MethodChannel('print_flutter_plugin');

 static Future<bool?> init() async {
    return await methodChannel.invokeMethod<bool>('init');
  }

  static Future<bool?> printText(PrintTextVo params) async {
    print(params.toJson());
    return await methodChannel.invokeMethod<bool>('printText', params.toJson());
  }

  static Future<bool?> printQR(PrintQRVo params) async {
    print(params.toJson());
    return await methodChannel.invokeMethod<bool>('printQR', params.toJson());
  }
}

class PrintTextVo {
  int align = 0;
  int size = 0;
  String? text;

  PrintTextVo(
      {this.align = 0,
        this.size = 0,
        this.text});

  PrintTextVo.fromJson(Map<String, dynamic> json) {
    align = json['align'];
    size = json['size'];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['align'] = align;
    data['size'] = size;
    data['text'] = text;

    return data;
  }
}

class PrintQRVo {
  int offset = 5;
  int height = 384;
  String? text;

  PrintQRVo({this.offset = 5, this.height = 384, this.text});

  PrintQRVo.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    height = json['height'];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['offset'] = offset;
    data['height'] = height;
    data['text'] = text;

    return data;
  }

}

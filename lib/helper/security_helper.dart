import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class SecurityHelper {
  static String getDataEncryptionKey({ required List<String> dataTypes }) {
    var formatter =  DateFormat('yyyyMM');
    String formattedDate = formatter.format(DateTime.now());
    var ym = utf8.encode(formattedDate);
    var key = utf8.encode("dev");
    var data = utf8.encode('BROWN_COFFEE${dataTypes.join('')}');
    var hmacSha512 = Hmac(sha512, key);
    Digest sha512Result = hmacSha512.convert(data);

    var bytes = sha512Result.bytes;

    var encryptedKey = base64Encode([...ym, ...bytes]);
    // DevHelper.logD("Here is encrypted key: $encryptedKey");
    return encryptedKey;
  }
}
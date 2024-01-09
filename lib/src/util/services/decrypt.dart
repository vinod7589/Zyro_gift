import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';

class MyEncryptionDecryption {
  Future<String> decryptt({required String data}) async {
    final key = encrypt.Key.fromUtf8('RP2611LKPcvji\$gtjimani64@shapsuv');
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    if (kDebugMode) {
      print(decrypted);
    }
    return decrypted;
  }

  Future<encrypt.Encrypted> encryptt({required String data}) async {
    final key = encrypt.Key.fromUtf8('RP2611LKPcvji\$gtjimani64@shapsuv');
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final encryptted = encrypter.encrypt(data, iv: iv);
    if (kDebugMode) {
      print(encryptted);
    }
    return encryptted;
  }
}

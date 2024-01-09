import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptDecrpytService {
  Future<String> Decrypt({required String data}) async {
    final key = encrypt.Key.fromUtf8("RP2611LKPcvji\$gtjimbgclstrpsuvgt");
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    print(decrypted);
    return decrypted;
  }

  Future<encrypt.Encrypted> Encrypt({required String data}) async {
    final key = encrypt.Key.fromUtf8("RP2611LKPcvji\$gtjimbgclstrpsuvgt");
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final encryptted = encrypter.encrypt(data, iv: iv);
    print(encryptted);
    return encryptted;
  }

  static Future<String> DecryptStatic({required String data}) async {
    final key = encrypt.Key.fromUtf8("RP2611LKPcvji\$gtjimbgclstrpsuvgt");
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    print(decrypted);
    return decrypted;
  }

  static String EncryptStatic({required String data}) {
    final key = encrypt.Key.fromUtf8("RP2611LKPcvji\$gtjimbgclstrpsuvgt");
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
    final encryptted = encrypter.encrypt(data, iv: iv);
    print(encryptted);
    final base64String = base64.encode(encryptted.bytes);
    print("Encrypted value : ");
    print(base64String);
    return base64String;
  }
}

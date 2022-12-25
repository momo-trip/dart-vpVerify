import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bs58/bs58.dart';

// input  : proof String
//        : publickey String
//        : secretkey String
//        : messages String[]
//        : nonce string
//
// output : result

Future<String> obtainResult( proof, publicKey, messages, nonce ) async {
  var url = Uri.parse(
    'http://localhost:3000/verify_vp', //HTTP request
  );
  var response = await http.post(url,
      body: json.encode({
        "proof": proof,
        "publicKey": publicKey,
        "messages": messages,
        "nonce": nonce
      }),
      headers: {"Content-Type": "application/json"});

  return json.decode(response.body)["isProofVerified"];
}

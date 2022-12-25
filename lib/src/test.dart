import 'package:dart_bbs/dart_bbs.dart';
import 'package:dart_bbs/src/obtain_result.dart';
import 'package:nonce/nonce.dart';

import 'package:intl/intl.dart';
import 'dart:convert';


/* main function */
void main() async {

  /* Set messages that are revealed */
  String message0 = json.encode({
    "context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1"
    ],
    "id": "http://localhost:9000/vc/1",
    "type": ["VerifiableCredential"],
    "issuer": "did:issuer:0001",
    "issuanceDate": "2022-10-09T10:15:55.382Z"
  }); 
  String message1 = json.encode({"id": "did:holder:0001"});
  String message2 = json.encode({"type": "Name", "subject": "Michael Ding"});
  //String message3 = json.encode({"type": "BirthDate", "subject": "January 1st, 1991"}); //This is the not-selected message
  String message4 =
      json.encode({"type": "Institute", "subject": "The University of Tokyo"});

  List<String> messages = [
    message0,
    message1,
    message2,
    //message3,  //This is the not-selected message
    message4
  ];

  /* Set the publicKey, nonce, proof */
  /* "proof" means the proofValue in the submitted VP, and "nonce" is located in the proof of the submitted VP*/
  String publicKey = "plAUct6Jg1DYHw3Q8H91LICj6X0heemlzy6glNGwTejIaXq3B5SGUOkWZ8bYTFgJBAhUbf9s56erXYX3IFjAKsJh8gl1zdEIVMpERPLEMEWwBUS5MoCE/oAKn/rSH5zQ";
  String nonce = "Qqwll6mHcboi8bo48ZY79IzGY065ke6n3y42A4An2cmlmdXuJMWwa5hjZke165Sw";
  String proof = "AAUXiMeo+8AJY7Bc788NxO8Pbikyzr9zHtygowM5ikwmNxkDnhemyH7fuu9Ev8KNtTzcsZEmC8BGbSOxCj9ZaW6jezXRfyrzDg31y4Dop9973/h8PIUzK2IG7s1CZ24QwFBEqtH7bEezJghVQ7ModW/kp5Zaq9uskKr+JNAviIjsYLUPJhuy5dwl6VW+oJvBu/9gAAAAdLY22en+cqZ7hhutNkHooSbZ3v5+wag+zz1x53OvRZq5VEfn+WLap2UreOmWfprOlAAAAAJVVUB+NpkgTU34ST1CfYyT/puf0ZsWuYnPh5NvailTplmlPQw5cZRv+YYbxROzeRVqEgMEbjaPIubeD10/c/VmgAixQPI18VM2LQ9ZFYppWF/h6rlwuykNVxYsNvjDjKSzxC4A+oFtH+0A1LrDY6sXAAAAA0k8/k/340QY/0oJ3Wl2g/Qq/ZCs8fn1sp8rTMDyA0RmAAZ4uf2QrRWKL/q4gQZABXNxjR0B4L0pH6DHGkONsgUCMZLfICw5xc/wJeovS8QrHv0T9W0t7/c9eU+ULeJD3Q==";

  /* Obtain the result */
  String result = await obtainResult( proof, publicKey, messages, nonce );
  print(result);

}


import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../utill/app_constants.dart';

class ParseRepo {
  Future<bool> initData() async {
    if(Parse()!=null){
      await Parse().initialize(
        AppConstants.keyParseApplicationId,
        AppConstants.keyParseServerUrl,
        clientKey: AppConstants.keyParseClientKey, // Required for some setups
        debug: true, // When enabled, prints logs to console
        liveQueryUrl: AppConstants.keyParseLiveServerUrl, // Required if using LiveQuery
        autoSendSessionId: true,
      );
    }
    return (await Parse().healthCheck()).success;
  }
}
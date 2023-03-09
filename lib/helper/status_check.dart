class StatusCheck{
 static String statusText(int? status){
    String statusString = "Pending";
    switch(status) {
      case 1: statusString = "Pending"; break;
      case 2: statusString = "Accepted"; break;
      case 3: statusString = "Finish Cooking"; break;
      case 4: statusString = "Delivered"; break;
      case 5 : statusString = "Done"; break;
      case -1: statusString = "Request Cancel"; break;
      case -2: statusString = "Cancelled"; break;
      default: statusString = "No status"; break;
    }
    return statusString;
  }

 static bool btnCancel(int? status){
    bool showHide = false;
    switch(status) {
      case 1: showHide = true; break;
      case 2: showHide = true; break;
      case 3: showHide = false; break;
      case 4: showHide = false; break;
      case 5 : showHide = false; break;
      case -1: showHide = true; break;
      case -2: showHide = false; break;
      default: showHide = true; break;
    }
    return showHide;
  }
}

// - pending 1
// - accept 2
// - Finish cooking 3
// - Pick-up 4
// - complete 5
//
// - request cancel -1
// - cancel -2

class StatusCheck{
 static String statusText(int? status){
    String statusString = "Pending";
    switch(status) {
      case 1: statusString = "Pending"; break;
      case 2: statusString = "Confirm Order"; break;
      case 3: statusString = "Out Delivery"; break;
      case 4: statusString = "Delivered"; break;
      case 5 : statusString = "Done"; break;
      case -1: statusString = "Request Cancel"; break;
      case -2: statusString = "Confirmed Cancel"; break;
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

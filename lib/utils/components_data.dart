import 'dart:convert';
import 'package:hopscotch/models/pagecomponents.dart';
import 'package:hopscotch/models/pagesort.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class ComponentsData with ChangeNotifier{
  List<PageComponents> _list = [];

  List<PageComponents> get list {
    return [..._list];
  }

  void addPageComponents(int position, String url, int height, int width){
    final newPageComponent = PageComponents(position: position, imageUrl: url, height: height, width: width);
    _list.add(newPageComponent);
    notifyListeners();
  }

  Future gettingComponentsData() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    String androidid = androidDeviceInfo.androidId.toString();
    var headers = {
      'authority': 'www.hopscotch.in',
      'sec-ch-ua': '"Chromium";v="92", " Not A;Brand";v="99", "Google Chrome";v="92"',
      'client-auth-method': 'v1',
      'device-type': 'mobile',
      'browser': 'Chrome_92.0.4515.107',
      'funnel_tile': '',
      'experiments': '"plpexp011web_var3,completesearch_es,allpv_show"',
      'install-id': '',
      'device-id': androidid,
      'funnel': 'Discover',
      'dpr': '3',
      'downlink': '10',
      'os': 'Android_5.0',
      'funnel_section': '',
      'device-memory': '8',
      'rtt': '50',
      'sec-ch-ua-mobile': '?1',
      'section': '',
      'user-agent': 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Mobile Safari/537.36',
      'viewport-width': '360',
      'hs-persistent-ticket': '670946b1-9eca-465e-93ca-d2bab7ad122f',
      'subsection': '',
      'accept': 'application/json, text/javascript, */*; q=0.01',
      'secret-key': 'SdeF21dn1ll23ms1AEcn223Ln039kds',
      'api-version': 'v2.0',
      'client-id': 'web-client/1.0',
      'ect': '4g',
      'sec-fetch-site': 'same-origin',
      'sec-fetch-mode': 'cors',
      'sec-fetch-dest': 'empty',
      'referer': 'https://www.hopscotch.in/',
      'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
      'cookie': 'VISITOR_ID=e41a2af2-3819-4ee0-8ead-ffcc376e7fef; ajs_group_id=null; ajs_anonymous_id=%224b5468dd-015d-49b9-85fc-27786d2d66cb%22; _ga=GA1.2.81333124.1625463706; _gcl_au=1.1.1983748401.1625463706; _fbp=fb.1.1625463705753.545139041; WZRK_G=6c75bdb07f854a8d97863074c3b5570c; hs_persistent_ticket=670946b1-9eca-465e-93ca-d2bab7ad122f; ajs_user_id=4205480; APP_loggedUuid=bd96dfa6-bc15-4aeb-9110-df0479fa6964; _gid=GA1.2.413639562.1628587187; WEBSITE_customersegment=RB; WEBSITE_childrenGroup=NO_CHILDREN_INFO__CUSTOMIZE-YES_default; VISITOR_TRACK=e41a2af2-3819-4ee0-8ead-ffcc376e7fef; hs_customer_info=%7B%22action%22%3A%22success%22%2C%22userId%22%3A4205480%2C%22firstName%22%3A%22Swapnil%22%2C%22lastName%22%3A%22Srivastav%22%2C%22userName%22%3A%22Swapnil.Srivastav%22%2C%22cartItemQty%22%3A3%2C%22email%22%3A%22swapnil.srivastav%40hopscotch.in%22%2C%22phoneNumber%22%3A%228097783533%22%2C%22profileImage%22%3A%22https%3A%2F%2Fstatic.hopscotch.in%2Fcustomer-profile%2Fbd96dfa6-bc15-4aeb-9110-df0479fa6964.jpeg%3Fversion%3D1%22%2C%22isRegister%22%3Afalse%2C%22uuid%22%3A%22bd96dfa6-bc15-4aeb-9110-df0479fa6964%22%2C%22mobileStatus%22%3A%22Verified%22%2C%22resendOTPAuto%22%3Atrue%2C%22isLoggedIn%22%3Atrue%7D; cart_item_quantity=3; OtherSessionInfo="sessionStartTime=1628678126883,lastVisitdate=2021-08-11 16:05:26,daysSinceLastVisit=7"; EXPERIMENT_INFO_CLIENT=promotionvisibility_promovisibility; EXPERIMENTS="plpexp011web_var3,completesearch_es,allpv_show"; SecureSessionId=98e56284-5e07-47c3-9527-b69eddbdf3a1; promotionvisibility_promovisibility=\$\$\$\$; EXPERIMENT_INFO_SERVER=plpsort_plpexp011web_var3\$\$search_completesearch_es\$\$promotionvisibility_allpv_show; _gat=1; _gat_UA-75878840-1=1; WZRK_S_WW4-64W-955Z=%7B%22p%22%3A5%2C%22s%22%3A1628678127%2C%22t%22%3A1628678248%7D; EXPERIMENTS="plpexp011web_var3,completesearch_es,allpv_show"; EXPERIMENT_INFO_CLIENT=promotionvisibility_promovisibility; EXPERIMENT_INFO_SERVER=plpsort_plpexp011web_var3\$\$search_completesearch_es\$\$promotionvisibility_allpv_show; OtherSessionInfo="sessionStartTime=1628678126883,lastVisitdate=2021-08-11 16:05:26,daysSinceLastVisit=7"; SecureSessionId=98e56284-5e07-47c3-9527-b69eddbdf3a1; VISITOR_ID=e41a2af2-3819-4ee0-8ead-ffcc376e7fef; VISITOR_TRACK=e41a2af2-3819-4ee0-8ead-ffcc376e7fef; WEBSITE_customersegment=RB; promotionvisibility_promovisibility=\$\$\$\$'
    };
    var request = http.Request('GET',
        Uri.parse(
            'https://www.hopscotch.in/api/page?homepageSection=NA&isPaginationRequire=false&pageName=discover&pageNo=1&pageSize=120'
        )
    );
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    var data = await response.stream.bytesToString();
    var jsonData = json.decode(data);
    if (response.statusCode.toString().contains(new RegExp(r"^[2]+[0]+[0-5]$"))) {
      for(int i = 0; i<jsonData["pageComponents"].length; i++){
        if(i==4){
          continue;
        }
        for(int j = 0; j<jsonData["pageComponents"][i]["data"]["tile_details"].length; j++){
          for(int k = 0; k<jsonData["pageComponents"][i]["data"]["tile_details"][j]["tileGrid"].length; k++){
            addPageComponents(
                jsonData["pageComponents"][i]["position"],
                jsonData["pageComponents"][i]["data"]["tile_details"][j]["tileGrid"][k]["imageUrl"],
                jsonData["pageComponents"][i]["data"]["tile_details"][j]["tileGrid"][k]["height"],
                jsonData["pageComponents"][i]["data"]["tile_details"][j]["tileGrid"][k]["width"]
            );
          }
        }
      }
    }
  }
}
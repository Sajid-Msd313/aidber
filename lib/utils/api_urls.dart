class api_urls {
  //===========BASE URLS============//
  static const String BASE_URL = "http://www.paakhealth.com/dochealth";
  static const String API_URL = "api";
  static const String BASE_URL_POSTS = "$BASE_URL/public/Posts";
  //===========BASE URLS ENDS HERE============//



  //===========AUTH URLS============//
  static const String SIGN_UP = "$BASE_URL/$API_URL/signup";
  static const String SIGN_IN = "$BASE_URL/$API_URL/login";
  //===========AUTH  ENDS HERE URLS============//



  //===========POST URLS============//
  static const String CREATE_POST = "$BASE_URL/$API_URL/create_post";
  static const String GET_ALL_POST = "$BASE_URL/$API_URL/get_all_posts";
  static const String LIKE_POST = "$BASE_URL/$API_URL/add_like";
  static const String COMMENT = "$BASE_URL/$API_URL/comment";
  static const String REQUEST_TO_FOLLOW = "$BASE_URL/$API_URL/request-to-follow";
  //===========POST ENDS HEREURLS============//


  //===========EVENT URLS============//
  static const String ADD_EVENT = "$BASE_URL/$API_URL/add_event";
}
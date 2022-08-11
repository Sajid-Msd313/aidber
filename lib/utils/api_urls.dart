class ApiUrls {
  //===========BASE URLS============//
  static const String BASE_URL = "http://www.paakhealth.com/dochealth";
  static const String BASE_URL_PUBLIC = "http://www.paakhealth.com/dochealth/public/";
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
  static const String GET_POST_COMMENT = "$BASE_URL/$API_URL/get-post-comment";
  static const String SAVE_POST = "$BASE_URL/$API_URL/save-post";
  static const String SHARE_POST = "$BASE_URL/$API_URL/share-post";
  static const String BLOCK_USER = "$BASE_URL/$API_URL/block-user";

  //===========POST ENDS HEREURLS============//

  //===========PROFILE URLS============//
  static const String USER_PROFILE = "$BASE_URL/$API_URL/user-profile";
  static const String UPDATE_PROFILE = "$BASE_URL/$API_URL/update-profile";
  static const String GET_FRIEND_LIST = "$BASE_URL/$API_URL/get-friend-list";


  //===========EVENT URLS============//
  static const String ADD_EVENT = "$BASE_URL/$API_URL/add_event";
  static const String GET_ALL_EVENTS = "$BASE_URL/$API_URL/get_all_events";
  static const String COMMING_THIS_WEEKEVENTS = "$BASE_URL/$API_URL/coming-week-event";
  static const String GO_TO_EVENT = "$BASE_URL/$API_URL/go-to-event";
  static const String SHARE_EVENT = "$BASE_URL/$API_URL/share-event";
  static const String SEARCH_EVENT = "$BASE_URL/$API_URL/search-event";

  //===========EVENT ENDS HEREURLS============//

//===========BUSINESS URLS============//

  static const String CREATE_BUSINESS = "$BASE_URL/$API_URL/create-business";
  static const String GET_BUSINESSES = "$BASE_URL/$API_URL/get-businesses";
  static const String DELETE_BUSINESS = "$BASE_URL/$API_URL/delete-business";
  static const String UPDATE_BUISNESS = "$BASE_URL/$API_URL/update-business";

//===========BUSINESS ENDS URLS============//

//===========INNOVATIONS URLS============//

  static const String CREATE_INNOVATION = "$BASE_URL/$API_URL/create-innovation";
  static const String GET_INNOVATIONS = "$BASE_URL/$API_URL/get-innovations";
  static const String SHARE_INNOVATION = "$BASE_URL/$API_URL/share-innovation";

  //===========INNOVATIONS ENDS URLS============//

  //===========FUNDRAISER URLS============//

  static const String GET_FUND_RAISERS = "$BASE_URL/$API_URL/get-fund-raisers";
  static const String GET_FUND_RAISER_DETAIL = "$BASE_URL/$API_URL/get-fund-raiser-detail";
  static const String CREATE_FUND_RAISER = "$BASE_URL/$API_URL/create-fund-raiser";
}
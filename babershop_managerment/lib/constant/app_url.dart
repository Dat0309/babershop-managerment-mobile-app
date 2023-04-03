// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings

class AppUrl {
  static const int APP_VERSION = 1;
  static const String BASEURL =
      "https://baber-shop-managerment.vercel.app/api/v1/";

  static const String USERS = BASEURL + "user";
  static const String LOGIN = USERS + "/login";
  static const String REGISTER = USERS;
  static const String PROFILE = USERS + "/profile";

  static const String USER_UPDATE_SALARY = USERS + "/update-salary";

  static const String BABERSHOP = BASEURL + "babershops";
  static const String ADMIN_GET_ALL_BABERSHOP = BABERSHOP + "/all";

  static const String HAIRSTYLE = BASEURL + "hairstyles";
  static const String GET_ALL_HAIR_STYLE = HAIRSTYLE + "/all";

  static const String SERVICES = BASEURL + "services";
  static const String GET_ALL_SERVICES = SERVICES + "/all";

  static const String ORDER = BASEURL + "orders";
  static const String ADMIN_GET_ALL_ORDER = ORDER + "/admin-get-all-order";
  static const String STAFF_GET_ALL_ORDER = ORDER + "/staff-get-all-order";
  static const String STAFF_GET_BABERSHOP_ORDER =
      ORDER + "/staff-get-babershop-order";
  static const String STAFF_GET_ALL_BABERSHOP_ORDER =
      ORDER + "/staff-get-all-babershop-order";
  static const String ADMIN_GET_ORDER_OF_STAFF =
      ORDER + "/admin-get-order-staff";

  static const String ADMIN_GET_BABERSHOP_ORDER =
      ORDER + "/admin-get-barbershop-order";

  static const String ADMIN_GET_ALL_SALARY =
      ORDER + "/admin-get-all-staff-salary";

  static const String ADMIN_STATISTICS = ORDER + "/admin-statitis";

  static const String EXTRACOST = BASEURL + "extracosts";
  static const String ADMIN_GET_ALL_EXTRACOSTS =
      EXTRACOST + "/admin-get-all-extracost";
  static const String STAFF_GET_ALL_EXTRACOSTS =
      EXTRACOST + "/staff-get-all-extracost";
  static const String STAFF_GET_BABERSHOP_EXTRACOSTS =
      EXTRACOST + "/staff-get-babershop-extracost";
  static const String ADMIN_GET_BABERSHOP_EXTRACOSTS =
      EXTRACOST + "/admin-get-babershop-order";
}

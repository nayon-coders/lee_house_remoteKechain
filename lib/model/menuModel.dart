// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  final Links? links;
  final int? count;
  final List<Result>? results;

  MenuModel({
    this.links,
    this.count,
    this.results,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Links {
  final dynamic next;
  final dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
  };
}

class Result {
  final int? id;
  final int? categoryCnt;
  final int? itemCnt;
  final List<ResultOpeningHour>? openingHours;
  final bool? isClosed;
  final String? restaurantName;
  final String? locationNames;
  final List<CategorySet>? categorySet;
  final List<MenuitemSet>? menuitemSet;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? title;
  final String? description;
  final String? otterMenuId;
  final int? restaurant;
  final int? company;
  final List<int>? locations;
  final List<dynamic>? cuisineTypes;
  final List<dynamic>? posIdentifier;

  Result({
    this.id,
    this.categoryCnt,
    this.itemCnt,
    this.openingHours,
    this.isClosed,
    this.restaurantName,
    this.locationNames,
    this.categorySet,
    this.menuitemSet,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.title,
    this.description,
    this.otterMenuId,
    this.restaurant,
    this.company,
    this.locations,
    this.cuisineTypes,
    this.posIdentifier,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    categoryCnt: json["category_cnt"],
    itemCnt: json["item_cnt"],
    openingHours: json["opening_hours"] == null ? [] : List<ResultOpeningHour>.from(json["opening_hours"]!.map((x) => ResultOpeningHour.fromJson(x))),
    isClosed: json["is_closed"],
    restaurantName: json["restaurant_name"]!,
    locationNames: json["location_names"],
    categorySet: json["category_set"] == null ? [] : List<CategorySet>.from(json["category_set"]!.map((x) => CategorySet.fromJson(x))),
    menuitemSet: json["menuitem_set"] == null ? [] : List<MenuitemSet>.from(json["menuitem_set"]!.map((x) => MenuitemSet.fromJson(x))),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    title: json["title"]!,
    description: json["description"],
    otterMenuId: json["otter_menu_id"],
    restaurant: json["restaurant"],
    company: json["company"],
    locations: json["locations"] == null ? [] : List<int>.from(json["locations"]!.map((x) => x)),
    cuisineTypes: json["cuisine_types"] == null ? [] : List<dynamic>.from(json["cuisine_types"]!.map((x) => x)),
    posIdentifier: json["pos_identifier"] == null ? [] : List<dynamic>.from(json["pos_identifier"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_cnt": categoryCnt,
    "item_cnt": itemCnt,
    "opening_hours": openingHours == null ? [] : List<dynamic>.from(openingHours!.map((x) => x.toJson())),
    "is_closed": isClosed,
    "restaurant_name": restaurantName,
    "location_names": locationNames,
    "category_set": categorySet == null ? [] : List<dynamic>.from(categorySet!.map((x) => x.toJson())),
    "menuitem_set": menuitemSet == null ? [] : List<dynamic>.from(menuitemSet!.map((x) => x.toJson())),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "title": title,
    "description": description,
    "otter_menu_id": otterMenuId,
    "restaurant": restaurant,
    "company": company,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x)),
    "cuisine_types": cuisineTypes == null ? [] : List<dynamic>.from(cuisineTypes!.map((x) => x)),
    "pos_identifier": posIdentifier == null ? [] : List<dynamic>.from(posIdentifier!.map((x) => x)),
  };
}

class CategorySet {
  final int? id;
  final int? menuitemCnt;
  final List<int>? menuitemSet;
  final String? menuName;
  final String? restaurantName;
  final String? locationNames;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? description;
  final dynamic otterCategoryId;
  final bool? showInOverview;
  final int? menu;
  final int? restaurant;
  final dynamic image;
  final List<dynamic>? locations;
  final List<dynamic>? posIdentifier;

  CategorySet({
    this.id,
    this.menuitemCnt,
    this.menuitemSet,
    this.menuName,
    this.restaurantName,
    this.locationNames,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.description,
    this.otterCategoryId,
    this.showInOverview,
    this.menu,
    this.restaurant,
    this.image,
    this.locations,
    this.posIdentifier,
  });

  factory CategorySet.fromJson(Map<String, dynamic> json) => CategorySet(
    id: json["id"],
    menuitemCnt: json["menuitem_cnt"],
    menuitemSet: json["menuitem_set"] == null ? [] : List<int>.from(json["menuitem_set"]!.map((x) => x)),
    menuName: json["menu_name"]!,
    restaurantName: json["restaurant_name"]!,
    locationNames: json["location_names"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    description: json["description"],
    otterCategoryId: json["otter_category_id"],
    showInOverview: json["show_in_overview"],
    menu: json["menu"],
    restaurant: json["restaurant"],
    image: json["image"],
    locations: json["locations"] == null ? [] : List<dynamic>.from(json["locations"]!.map((x) => x)),
    posIdentifier: json["pos_identifier"] == null ? [] : List<dynamic>.from(json["pos_identifier"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "menuitem_cnt": menuitemCnt,
    "menuitem_set": menuitemSet == null ? [] : List<dynamic>.from(menuitemSet!.map((x) => x)),
    "menu_name": titleValues.reverse[menuName],
    "restaurant_name": restaurantNameValues.reverse[restaurantName],
    "location_names": locationNames,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "description": description,
    "otter_category_id": otterCategoryId,
    "show_in_overview": showInOverview,
    "menu": menu,
    "restaurant": restaurant,
    "image": image,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x)),
    "pos_identifier": posIdentifier == null ? [] : List<dynamic>.from(posIdentifier!.map((x) => x)),
  };
}

enum Title {
  LEE_S_HOUSE_MENUS_FROM_EXCEL,
  MAIN_MENU
}

final titleValues = EnumValues({
  "Lee's house menus from excel": Title.LEE_S_HOUSE_MENUS_FROM_EXCEL,
  "Main Menu": Title.MAIN_MENU
});

enum RestaurantName {
  CORAL_COURT_SZECHUAN_CUISINE,
  LEE_S_HOUSE_RESTAURANT
}

final restaurantNameValues = EnumValues({
  "Coral Court Szechuan Cuisine": RestaurantName.CORAL_COURT_SZECHUAN_CUISINE,
  "Lee's House Restaurant": RestaurantName.LEE_S_HOUSE_RESTAURANT
});

class MenuitemSet {
  final int? id;
  final List<Images>? images;
  final List<dynamic>? modifiergroupSet;
  final Images? originalImage;
  final String? menuName;
  final String? categoryNames;
  final int? likeCount;
  final bool? isCurrentUserLiked;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? description;
  final double? basePrice;
  final double? virtualPrice;
  final Currency? currency;
  final bool? isAvailable;
  final bool? isVegan;
  final bool? isVegetarian;
  final bool? isGlutenfree;
  final bool? haveNuts;
  final dynamic otterItemId;
  final int? menu;
  final int? restaurant;
  final List<dynamic>? extraNames;
  final List<dynamic>? extraDescriptions;
  final List<int>? category;
  final List<dynamic>? locations;
  final List<dynamic>? posIdentifier;

  MenuitemSet({
    this.id,
    this.images,
    this.modifiergroupSet,
    this.originalImage,
    this.menuName,
    this.categoryNames,
    this.likeCount,
    this.isCurrentUserLiked,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.description,
    this.basePrice,
    this.virtualPrice,
    this.currency,
    this.isAvailable,
    this.isVegan,
    this.isVegetarian,
    this.isGlutenfree,
    this.haveNuts,
    this.otterItemId,
    this.menu,
    this.restaurant,
    this.extraNames,
    this.extraDescriptions,
    this.category,
    this.locations,
    this.posIdentifier,
  });

  factory MenuitemSet.fromJson(Map<String, dynamic> json) => MenuitemSet(
    id: json["id"],
    images: json["images"] == null ? [] : List<Images>.from(json["images"]!.map((x) => Images.fromJson(x))),
    modifiergroupSet: json["modifiergroup_set"] == null ? [] : List<dynamic>.from(json["modifiergroup_set"]!.map((x) => x)),
    originalImage: json["original_image"] == null ? null : Images.fromJson(json["original_image"]),
    menuName: json["menu_name"]!,
    categoryNames: json["category_names"],
    likeCount: json["like_count"],
    isCurrentUserLiked: json["is_current_user_liked"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    description: json["description"],
    basePrice: json["base_price"]?.toDouble(),
    virtualPrice: json["virtual_price"],
    currency: currencyValues.map[json["currency"]]!,
    isAvailable: json["is_available"],
    isVegan: json["is_vegan"],
    isVegetarian: json["is_vegetarian"],
    isGlutenfree: json["is_glutenfree"],
    haveNuts: json["have_nuts"],
    otterItemId: json["otter_item_id"],
    menu: json["menu"],
    restaurant: json["restaurant"],
    extraNames: json["extra_names"] == null ? [] : List<dynamic>.from(json["extra_names"]!.map((x) => x)),
    extraDescriptions: json["extra_descriptions"] == null ? [] : List<dynamic>.from(json["extra_descriptions"]!.map((x) => x)),
    category: json["category"] == null ? [] : List<int>.from(json["category"]!.map((x) => x)),
    locations: json["locations"] == null ? [] : List<dynamic>.from(json["locations"]!.map((x) => x)),
    posIdentifier: json["pos_identifier"] == null ? [] : List<dynamic>.from(json["pos_identifier"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "modifiergroup_set": modifiergroupSet == null ? [] : List<dynamic>.from(modifiergroupSet!.map((x) => x)),
    "original_image": originalImage?.toJson(),
    "menu_name": titleValues.reverse[menuName],
    "category_names": categoryNames,
    "like_count": likeCount,
    "is_current_user_liked": isCurrentUserLiked,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "description": description,
    "base_price": basePrice,
    "virtual_price": virtualPrice,
    "currency": currencyValues.reverse[currency],
    "is_available": isAvailable,
    "is_vegan": isVegan,
    "is_vegetarian": isVegetarian,
    "is_glutenfree": isGlutenfree,
    "have_nuts": haveNuts,
    "otter_item_id": otterItemId,
    "menu": menu,
    "restaurant": restaurant,
    "extra_names": extraNames == null ? [] : List<dynamic>.from(extraNames!.map((x) => x)),
    "extra_descriptions": extraDescriptions == null ? [] : List<dynamic>.from(extraDescriptions!.map((x) => x)),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x)),
    "pos_identifier": posIdentifier == null ? [] : List<dynamic>.from(posIdentifier!.map((x) => x)),
  };
}

enum Currency {
  CAD
}

final currencyValues = EnumValues({
  "CAD": Currency.CAD
});

class Images {
  final int? id;
  final String? workingUrl;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? remoteUrl;
  final dynamic localUrl;
  final String? otterImageId;

  Images({
    this.id,
    this.workingUrl,
    this.createdDate,
    this.modifiedDate,
    this.remoteUrl,
    this.localUrl,
    this.otterImageId,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    workingUrl: json["working_url"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    remoteUrl: json["remote_url"],
    localUrl: json["local_url"],
    otterImageId: json["otter_image_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "working_url": workingUrl,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "remote_url": remoteUrl,
    "local_url": localUrl,
    "otter_image_id": otterImageId,
  };
}

class ResultOpeningHour {
  final int? id;
  final List<OpeningHourOpeningHour>? openingHour;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? dayIndex;
  final bool? isClose;

  ResultOpeningHour({
    this.id,
    this.openingHour,
    this.createdDate,
    this.modifiedDate,
    this.dayIndex,
    this.isClose,
  });

  factory ResultOpeningHour.fromJson(Map<String, dynamic> json) => ResultOpeningHour(
    id: json["id"],
    openingHour: json["opening_hour"] == null ? [] : List<OpeningHourOpeningHour>.from(json["opening_hour"]!.map((x) => OpeningHourOpeningHour.fromJson(x))),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    dayIndex: json["day_index"],
    isClose: json["is_close"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hour": openingHour == null ? [] : List<dynamic>.from(openingHour!.map((x) => x.toJson())),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "day_index": dayIndex,
    "is_close": isClose,
  };
}

class OpeningHourOpeningHour {
  final int? id;
  final String? startTime;
  final String? endTime;

  OpeningHourOpeningHour({
    this.id,
    this.startTime,
    this.endTime,
  });

  factory OpeningHourOpeningHour.fromJson(Map<String, dynamic> json) => OpeningHourOpeningHour(
    id: json["id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime,
    "end_time": endTime,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

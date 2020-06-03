// To parse this JSON data, do
//
//     final jadwalDaily = jadwalDailyFromJson(jsonString);

import 'dart:convert';

JadwalDaily jadwalDailyFromJson(String str) => JadwalDaily.fromJson(json.decode(str));

String jadwalDailyToJson(JadwalDaily data) => json.encode(data.toJson());

class JadwalDaily {
    String prayerMethodName;
    String timezone;
    String latitude;
    String longitude;
    String address;
    String city;
    String state;
    String country;
    String countryCode;
    List<Item> items;

    JadwalDaily({
        this.prayerMethodName,
        this.timezone,
        this.latitude,
        this.longitude,
        this.items,
    });

    factory JadwalDaily.fromJson(Map<String, dynamic> json) => JadwalDaily(
        prayerMethodName: json["data"]["meta"]["school"] == null ? null : json["data"]["meta"]["school"],
        timezone: json["data"]["meta"]["timezone"] == null ? null : json["data"]["meta"]["timezone"],
        latitude: json["data"]["meta"]["latitude"] == null ? null : json["data"]["meta"]["latitude"].toString(),
        longitude: json["data"]["longitude"] == null ? null : json["data"]["longitude"].toString(),
        items: json["data"]["items"] == null ? null : [Item.fromJson(json["data"]["timings"])],
    );

    Map<String, dynamic> toJson() => {

        "prayer_method_name": prayerMethodName == null ? null : prayerMethodName,
        "timezone": timezone == null ? null : timezone,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String fajr;
    String shurooq;
    String dhuhr;
    String asr;
    String maghrib;
    String isha;

    Item({
        this.fajr,
        this.shurooq,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.isha,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        fajr: json["Fajr"] == null ? null : json["Fajr"],
        shurooq: json["Sunrise"] == null ? null : json["Sunrise"],
        dhuhr: json["Dhuhr"] == null ? null : json["Dhuhr"],
        asr: json["Asr"] == null ? null : json["Asr"],
        maghrib: json["Maghrib"] == null ? null : json["Maghrib"],
        isha: json["Isha"] == null ? null : json["Isha"],
    );

    Map<String, dynamic> toJson() => {
        "fajr": fajr == null ? null : fajr,
        "shurooq": shurooq == null ? null : shurooq,
        "dhuhr": dhuhr == null ? null : dhuhr,
        "asr": asr == null ? null : asr,
        "maghrib": maghrib == null ? null : maghrib,
        "isha": isha == null ? null : isha,
    };
}



// To parse this JSON data, do
//
//     final UserResponse = UserResponseFromJson(jsonString);

import 'dart:convert';

UserResponse UserResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String UserResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.status,
        this.user,
    });

    String? status;
    User? user;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
    };
}

class User {
    User({
        this.id,
        this.fullName,
        this.email,
        this.phone,
        this.city,
        this.ward,
        this.district,
        this.province,
        this.address,
        this.profilePicture,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? fullName;
    String? email;
    String? phone;
    String? city;
    String? ward;
    String? district;
    String? province;
    String? address;
    String? profilePicture;
    String? emailVerifiedAt;
    String? createdAt;
    String? updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
        address: json["address"],
        profilePicture: json["profile_picture"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "city": city,
        "ward": ward,
        "district": district,
        "province": province,
        "address": address,
        "profile_picture": profilePicture,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

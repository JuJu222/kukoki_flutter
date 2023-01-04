class UserResponse {
    UserResponse({
        this.status,
        this.user,
    });

    String? status;
    User? user;

    // Convert JSON to UserResponse object
    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json['status'],
        user: User.fromJson(json['user']),
    );
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

    // Convert JSON to User object
    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        city: json['city'],
        ward: json['ward'],
        district: json['district'],
        province: json['province'],
        address: json['address'],
        profilePicture: json['profile_picture'],
        emailVerifiedAt: json['email_verified_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
    );
}

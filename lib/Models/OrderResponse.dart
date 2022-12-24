import 'dart:convert';

OrderResponse orderResponseFromJson(String str) => OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  OrderResponse({
    this.status,
    this.order,
    this.orderDetails,
  });

  String? status;
  Order? order;
  List<OrderDetail>? orderDetails;

  // Convert JSON to OrderResponse object
  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    status: json['status'],
    order: Order.fromJson(json['order']),
    orderDetails: List<OrderDetail>.from(json['orderDetails'].map((x) => OrderDetail.fromJson(x))),
  );

  // Convert OrderResponse object to JSON
  Map<String, dynamic> toJson() => {
    'status': status,
    'order': order?.toJson(),
    'orderDetails': List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.userId,
    this.date,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int? userId;
  String? date;
  String? updatedAt;
  String? createdAt;
  int? id;

  // Convert JSON to Order object
  factory Order.fromJson(Map<String, dynamic> json) => Order(
    userId: json['user_id'],
    date: json['date'],
    updatedAt: json['updated_at'],
    createdAt: json['created_at'],
    id: json['id'],
  );

  // Convert Order object to JSON
  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'date': date,
    'updated_at': updatedAt,
    'created_at': createdAt,
    'id': id,
  };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.userId,
    this.mealId,
    this.orderId,
    this.portion,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? mealId;
  int? orderId;
  int? portion;
  String? date;
  String? createdAt;
  String? updatedAt;

  // Convert JSON to OrderDetail object
  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json['id'],
    userId: json['user_id'],
    mealId: json['meal_id'],
    orderId: json['order_id'],
    portion: json['portion'],
    date: json['date'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  // Convert OrderDetail object to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'meal_id': mealId,
    'order_id': orderId,
    'portion': portion,
    'date': date,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

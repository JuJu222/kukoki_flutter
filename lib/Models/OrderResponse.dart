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
}

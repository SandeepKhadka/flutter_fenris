// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    int id;
    int userId;
    String orderNumber;
    String deliveryAddress;
    int totalAmount;
    String paymentMethod;
    String paymentStatus;
    String condition;
    int deliveryCharge;
    DateTime createdAt;
    DateTime updatedAt;
    List<Product> products;

    Order({
        required this.id,
        required this.userId,
        required this.orderNumber,
        required this.deliveryAddress,
        required this.totalAmount,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.condition,
        required this.deliveryCharge,
        required this.createdAt,
        required this.updatedAt,
        required this.products,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        orderNumber: json["order_number"],
        deliveryAddress: json["delivery_address"],
        totalAmount: json["total_amount"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        condition: json["condition"],
        deliveryCharge: json["delivery_charge"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_number": orderNumber,
        "delivery_address": deliveryAddress,
        "total_amount": totalAmount,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "condition": condition,
        "delivery_charge": deliveryCharge,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String name;
    String slug;
    String summary;
    String description;
    int quantity;
    int catId;
    String image;
    int price;
    int discount;
    String conditions;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    Pivot pivot;

    Product({
        required this.id,
        required this.name,
        required this.slug,
        required this.summary,
        required this.description,
        required this.quantity,
        required this.catId,
        required this.image,
        required this.price,
        required this.discount,
        required this.conditions,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        summary: json["summary"],
        description: json["description"],
        quantity: json["quantity"],
        catId: json["cat_id"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
        conditions: json["conditions"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "summary": summary,
        "description": description,
        "quantity": quantity,
        "cat_id": catId,
        "image": image,
        "price": price,
        "discount": discount,
        "conditions": conditions,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    int orderId;
    int productId;
    int quantity;

    Pivot({
        required this.orderId,
        required this.productId,
        required this.quantity,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
    };
}
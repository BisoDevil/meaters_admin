// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromMap(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Order {
  int id;
  int parentId;
  String number;
  String orderKey;
  String createdVia;
  String version;
  String status;
  String currency;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  bool pricesIncludeTax;
  int customerId;
  String customerIpAddress;
  String customerUserAgent;
  String customerNote;
  Ing billing;
  Ing shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  DateTime datePaid;
  DateTime datePaidGmt;
  DateTime dateCompleted;
  DateTime dateCompletedGmt;
  String cartHash;
  List<MetaDatum> metaData;
  List<LineItem> lineItems;
  List<dynamic> taxLines;
  List<ShippingLine> shippingLines;
  List<dynamic> feeLines;
  List<dynamic> couponLines;
  List<dynamic> refunds;
  String currencySymbol;
  Links links;

  Order({
    this.id,
    this.parentId,
    this.number,
    this.orderKey,
    this.createdVia,
    this.version,
    this.status,
    this.currency,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.pricesIncludeTax,
    this.customerId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.customerNote,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.datePaid,
    this.datePaidGmt,
    this.dateCompleted,
    this.dateCompletedGmt,
    this.cartHash,
    this.metaData,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.currencySymbol,
    this.links,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        parentId: json["parent_id"],
        number: json["number"],
        orderKey: json["order_key"],
        createdVia: json["created_via"],
        version: json["version"],
        status: json["status"],
        currency: json["currency"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        discountTotal: json["discount_total"],
        discountTax: json["discount_tax"],
        shippingTotal: json["shipping_total"],
        shippingTax: json["shipping_tax"],
        cartTax: json["cart_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        pricesIncludeTax: json["prices_include_tax"],
        customerId: json["customer_id"],
        customerIpAddress: json["customer_ip_address"],
        customerUserAgent: json["customer_user_agent"],
        customerNote: json["customer_note"],
        billing: Ing.fromMap(json["billing"]),
        shipping: Ing.fromMap(json["shipping"]),
        paymentMethod: json["payment_method"],
        paymentMethodTitle: json["payment_method_title"],
        transactionId: json["transaction_id"],
        datePaid: json["date_paid"] == null
            ? null
            : DateTime.parse(json["date_paid"]),
        datePaidGmt: json["date_paid_gmt"] == null
            ? null
            : DateTime.parse(json["date_paid_gmt"]),
        dateCompleted: json["date_completed"] == null
            ? null
            : DateTime.parse(json["date_completed"]),
        dateCompletedGmt: json["date_completed_gmt"] == null
            ? null
            : DateTime.parse(json["date_completed_gmt"]),
        cartHash: json["cart_hash"],
        metaData: List<MetaDatum>.from(
            json["meta_data"].map((x) => MetaDatum.fromMap(x))),
        lineItems: List<LineItem>.from(
            json["line_items"].map((x) => LineItem.fromMap(x))),
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
        shippingLines: List<ShippingLine>.from(
            json["shipping_lines"].map((x) => ShippingLine.fromMap(x))),
        feeLines: List<dynamic>.from(json["fee_lines"].map((x) => x)),
        couponLines: List<dynamic>.from(json["coupon_lines"].map((x) => x)),
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        currencySymbol: json["currency_symbol"],
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parent_id": parentId,
        "number": number,
        "order_key": orderKey,
        "created_via": createdVia,
        "version": version,
        "status": status,
        "currency": currency,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "discount_total": discountTotal,
        "discount_tax": discountTax,
        "shipping_total": shippingTotal,
        "shipping_tax": shippingTax,
        "cart_tax": cartTax,
        "total": total,
        "total_tax": totalTax,
        "prices_include_tax": pricesIncludeTax,
        "customer_id": customerId,
        "customer_ip_address": customerIpAddress,
        "customer_user_agent": customerUserAgent,
        "customer_note": customerNote,
        "billing": billing.toMap(),
        "shipping": shipping.toMap(),
        "payment_method": paymentMethod,
        "payment_method_title": paymentMethodTitle,
        "transaction_id": transactionId,
        "date_paid": datePaid == null ? null : datePaid.toIso8601String(),
        "date_paid_gmt":
            datePaidGmt == null ? null : datePaidGmt.toIso8601String(),
        "date_completed":
            dateCompleted == null ? null : dateCompleted.toIso8601String(),
        "date_completed_gmt": dateCompletedGmt == null
            ? null
            : dateCompletedGmt.toIso8601String(),
        "cart_hash": cartHash,
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toMap())),
        "line_items": List<dynamic>.from(lineItems.map((x) => x.toMap())),
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
        "shipping_lines":
            List<dynamic>.from(shippingLines.map((x) => x.toMap())),
        "fee_lines": List<dynamic>.from(feeLines.map((x) => x)),
        "coupon_lines": List<dynamic>.from(couponLines.map((x) => x)),
        "refunds": List<dynamic>.from(refunds.map((x) => x)),
        "currency_symbol": currencySymbol,
        "_links": links.toMap(),
      };
}

class Ing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;
  String email;
  String phone;

  Ing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory Ing.fromMap(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
      };
}

class LineItem {
  int id;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  List<dynamic> taxes;
  List<dynamic> metaData;
  String sku;
  int price;

  LineItem({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
  });

  factory LineItem.fromMap(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        quantity: json["quantity"],
        taxClass: json["tax_class"],
        subtotal: json["subtotal"],
        subtotalTax: json["subtotal_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
        metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
        sku: json["sku"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "variation_id": variationId,
        "quantity": quantity,
        "tax_class": taxClass,
        "subtotal": subtotal,
        "subtotal_tax": subtotalTax,
        "total": total,
        "total_tax": totalTax,
        "taxes": List<dynamic>.from(taxes.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x)),
        "sku": sku,
        "price": price,
      };
}

class Links {
  List<Collection> self;
  List<Collection> collection;
  List<Collection> customer;

  Links({
    this.self,
    this.collection,
    this.customer,
  });

  factory Links.fromMap(Map<String, dynamic> json) =>
      Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromMap(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromMap(x))),
        customer: json["customer"] == null
            ? null
            : List<Collection>.from(
            json["customer"].map((x) => Collection.fromMap(x))),
      );

  Map<String, dynamic> toMap() =>
      {
        "self": List<dynamic>.from(self.map((x) => x.toMap())),
        "collection": List<dynamic>.from(collection.map((x) => x.toMap())),
        "customer": customer == null
            ? null
            : List<dynamic>.from(customer.map((x) => x.toMap())),
      };
}

class Collection {
  String href;

  Collection({
    this.href,
  });

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class MetaDatum {
  int id;
  String key;
  String value;

  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDatum.fromMap(Map<String, dynamic> json) =>
      MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() =>
      {
        "id": id,
        "key": key,
        "value": value,
      };
}

class ShippingLine {
  int id;
  String methodTitle;
  String methodId;
  String instanceId;
  String total;
  String totalTax;
  List<dynamic> taxes;
  List<dynamic> metaData;

  ShippingLine({
    this.id,
    this.methodTitle,
    this.methodId,
    this.instanceId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  factory ShippingLine.fromMap(Map<String, dynamic> json) =>
      ShippingLine(
        id: json["id"],
        methodTitle: json["method_title"],
        methodId: json["method_id"],
        instanceId: json["instance_id"],
        total: json["total"],
        totalTax: json["total_tax"],
        taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
        metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
      );

  Map<String, dynamic> toMap() =>
      {
        "id": id,
        "method_title": methodTitle,
        "method_id": methodId,
        "instance_id": instanceId,
        "total": total,
        "total_tax": totalTax,
        "taxes": List<dynamic>.from(taxes.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x)),
      };
}

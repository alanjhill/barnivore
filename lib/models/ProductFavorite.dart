/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ProductFavorite type in your schema. */
@immutable
class ProductFavorite extends Model {
  static const classType = const _ProductFavoriteModelType();
  final String id;
  final Product? _product;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _productFavoriteProductId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Product? get product {
    return _product;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get productFavoriteProductId {
    return _productFavoriteProductId;
  }
  
  const ProductFavorite._internal({required this.id, product, createdAt, updatedAt, productFavoriteProductId}): _product = product, _createdAt = createdAt, _updatedAt = updatedAt, _productFavoriteProductId = productFavoriteProductId;
  
  factory ProductFavorite({String? id, Product? product, String? productFavoriteProductId}) {
    return ProductFavorite._internal(
      id: id == null ? UUID.getUUID() : id,
      product: product,
      productFavoriteProductId: productFavoriteProductId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductFavorite &&
      id == other.id &&
      _product == other._product &&
      _productFavoriteProductId == other._productFavoriteProductId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductFavorite {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("productFavoriteProductId=" + "$_productFavoriteProductId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductFavorite copyWith({String? id, Product? product, String? productFavoriteProductId}) {
    return ProductFavorite._internal(
      id: id ?? this.id,
      product: product ?? this.product,
      productFavoriteProductId: productFavoriteProductId ?? this.productFavoriteProductId);
  }
  
  ProductFavorite.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _product = json['product']?['serializedData'] != null
        ? Product.fromJson(new Map<String, dynamic>.from(json['product']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _productFavoriteProductId = json['productFavoriteProductId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'product': _product?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'productFavoriteProductId': _productFavoriteProductId
  };

  static final QueryField ID = QueryField(fieldName: "productFavorite.id");
  static final QueryField PRODUCT = QueryField(
    fieldName: "product",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Product).toString()));
  static final QueryField PRODUCTFAVORITEPRODUCTID = QueryField(fieldName: "productFavoriteProductId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductFavorite";
    modelSchemaDefinition.pluralName = "ProductFavorites";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: ProductFavorite.PRODUCT,
      isRequired: false,
      ofModelName: (Product).toString(),
      associatedKey: Product.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductFavorite.PRODUCTFAVORITEPRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ProductFavoriteModelType extends ModelType<ProductFavorite> {
  const _ProductFavoriteModelType();
  
  @override
  ProductFavorite fromJson(Map<String, dynamic> jsonData) {
    return ProductFavorite.fromJson(jsonData);
  }
}
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


/** This is an auto generated class representing the Product type in your schema. */
@immutable
class Product extends Model {
  static const classType = const _ProductModelType();
  final String id;
  final String? _companyId;
  final String? _productName;
  final String? _status;
  final RedYellowGreen? _redYellowGreen;
  final String? _keywords;
  final Company? _company;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _productCompanyId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get companyId {
    return _companyId;
  }
  
  String? get productName {
    return _productName;
  }
  
  String? get status {
    return _status;
  }
  
  RedYellowGreen? get redYellowGreen {
    return _redYellowGreen;
  }
  
  String? get keywords {
    return _keywords;
  }
  
  Company? get company {
    return _company;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get productCompanyId {
    return _productCompanyId;
  }
  
  const Product._internal({required this.id, companyId, productName, status, redYellowGreen, keywords, company, createdAt, updatedAt, productCompanyId}): _companyId = companyId, _productName = productName, _status = status, _redYellowGreen = redYellowGreen, _keywords = keywords, _company = company, _createdAt = createdAt, _updatedAt = updatedAt, _productCompanyId = productCompanyId;
  
  factory Product({String? id, String? companyId, String? productName, String? status, RedYellowGreen? redYellowGreen, String? keywords, Company? company, String? productCompanyId}) {
    return Product._internal(
      id: id == null ? UUID.getUUID() : id,
      companyId: companyId,
      productName: productName,
      status: status,
      redYellowGreen: redYellowGreen,
      keywords: keywords,
      company: company,
      productCompanyId: productCompanyId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
      id == other.id &&
      _companyId == other._companyId &&
      _productName == other._productName &&
      _status == other._status &&
      _redYellowGreen == other._redYellowGreen &&
      _keywords == other._keywords &&
      _company == other._company &&
      _productCompanyId == other._productCompanyId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Product {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("companyId=" + "$_companyId" + ", ");
    buffer.write("productName=" + "$_productName" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("redYellowGreen=" + (_redYellowGreen != null ? enumToString(_redYellowGreen)! : "null") + ", ");
    buffer.write("keywords=" + "$_keywords" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("productCompanyId=" + "$_productCompanyId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Product copyWith({String? id, String? companyId, String? productName, String? status, RedYellowGreen? redYellowGreen, String? keywords, Company? company, String? productCompanyId}) {
    return Product._internal(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      productName: productName ?? this.productName,
      status: status ?? this.status,
      redYellowGreen: redYellowGreen ?? this.redYellowGreen,
      keywords: keywords ?? this.keywords,
      company: company ?? this.company,
      productCompanyId: productCompanyId ?? this.productCompanyId);
  }
  
  Product.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _companyId = json['companyId'],
      _productName = json['productName'],
      _status = json['status'],
      _redYellowGreen = enumFromString<RedYellowGreen>(json['redYellowGreen'], RedYellowGreen.values),
      _keywords = json['keywords'],
      _company = json['company']?['serializedData'] != null
        ? Company.fromJson(new Map<String, dynamic>.from(json['company']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _productCompanyId = json['productCompanyId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'companyId': _companyId, 'productName': _productName, 'status': _status, 'redYellowGreen': enumToString(_redYellowGreen), 'keywords': _keywords, 'company': _company?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'productCompanyId': _productCompanyId
  };

  static final QueryField ID = QueryField(fieldName: "product.id");
  static final QueryField COMPANYID = QueryField(fieldName: "companyId");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField REDYELLOWGREEN = QueryField(fieldName: "redYellowGreen");
  static final QueryField KEYWORDS = QueryField(fieldName: "keywords");
  static final QueryField COMPANY = QueryField(
    fieldName: "company",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Company).toString()));
  static final QueryField PRODUCTCOMPANYID = QueryField(fieldName: "productCompanyId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Product";
    modelSchemaDefinition.pluralName = "Products";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.COMPANYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.PRODUCTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.REDYELLOWGREEN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.KEYWORDS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Product.COMPANY,
      isRequired: false,
      ofModelName: (Company).toString(),
      associatedKey: Company.ID
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
      key: Product.PRODUCTCOMPANYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ProductModelType extends ModelType<Product> {
  const _ProductModelType();
  
  @override
  Product fromJson(Map<String, dynamic> jsonData) {
    return Product.fromJson(jsonData);
  }
}
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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Company type in your schema. */
@immutable
class Company extends Model {
  static const classType = const _CompanyModelType();
  final String id;
  final String? _companyName;
  final String? _country;
  final String? _keywords;
  final String? _status;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get companyName {
    return _companyName;
  }
  
  String? get country {
    return _country;
  }
  
  String? get keywords {
    return _keywords;
  }
  
  String? get status {
    return _status;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Company._internal({required this.id, companyName, country, keywords, status, createdAt, updatedAt}): _companyName = companyName, _country = country, _keywords = keywords, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Company({String? id, String? companyName, String? country, String? keywords, String? status}) {
    return Company._internal(
      id: id == null ? UUID.getUUID() : id,
      companyName: companyName,
      country: country,
      keywords: keywords,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Company &&
      id == other.id &&
      _companyName == other._companyName &&
      _country == other._country &&
      _keywords == other._keywords &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Company {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("companyName=" + "$_companyName" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("keywords=" + "$_keywords" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Company copyWith({String? id, String? companyName, String? country, String? keywords, String? status}) {
    return Company._internal(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      country: country ?? this.country,
      keywords: keywords ?? this.keywords,
      status: status ?? this.status);
  }
  
  Company.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _companyName = json['companyName'],
      _country = json['country'],
      _keywords = json['keywords'],
      _status = json['status'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'companyName': _companyName, 'country': _country, 'keywords': _keywords, 'status': _status, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "company.id");
  static final QueryField COMPANYNAME = QueryField(fieldName: "companyName");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField KEYWORDS = QueryField(fieldName: "keywords");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Company";
    modelSchemaDefinition.pluralName = "Companies";
    
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
      key: Company.COMPANYNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Company.COUNTRY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Company.KEYWORDS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Company.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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
  });
}

class _CompanyModelType extends ModelType<Company> {
  const _CompanyModelType();
  
  @override
  Company fromJson(Map<String, dynamic> jsonData) {
    return Company.fromJson(jsonData);
  }
}
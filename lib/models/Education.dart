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

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Education type in your schema. */
@immutable
class Education extends Model {
  static const classType = const _EducationModelType();
  final String id;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  const Education._internal({required this.id}) ;
  
  factory Education({String? id}) {
    return Education._internal(
      id: id == null ? UUID.getUUID() : id);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Education &&
      id == other.id;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Education {");
    buffer.write("id=" + "$id");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Education copyWith({String? id}) {
    return Education(
      id: id ?? this.id);
  }
  
  Education.fromJson(Map<String, dynamic> json)  
    : id = json['id'];
  
  Map<String, dynamic> toJson() => {
    'id': id
  };

  static final QueryField ID = QueryField(fieldName: "education.id");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Education";
    modelSchemaDefinition.pluralName = "Educations";
    
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
  });
}

class _EducationModelType extends ModelType<Education> {
  const _EducationModelType();
  
  @override
  Education fromJson(Map<String, dynamic> jsonData) {
    return Education.fromJson(jsonData);
  }
}
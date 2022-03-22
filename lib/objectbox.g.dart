// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Services/object_box/Test_cvd.dart';
import 'Services/object_box/contact.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 334219213812083858),
      name: 'Contact',
      lastPropertyId: const IdUid(4, 3763886023927636119),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5258029564361964203),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7563082360686561305),
            name: 'uid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 235385708197308081),
            name: 'username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3763886023927636119),
            name: 'email',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 326062917992827007),
      name: 'Test_cvd',
      lastPropertyId: const IdUid(2, 7498172959481976534),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 26184097508928405),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7498172959481976534),
            name: 'test_url',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String directory,
        int maxDBSizeInKB,
        int fileMode,
        int maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 326062917992827007),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Contact: EntityDefinition<Contact>(
        model: _entities[0],
        toOneRelations: (Contact object) => [],
        toManyRelations: (Contact object) => {},
        getId: (Contact object) => object.id,
        setId: (Contact object, int id) {
          object.id = id;
        },
        objectToFB: (Contact object, fb.Builder fbb) {
          final uidOffset =
              object.uid == null ? null : fbb.writeString(object.uid);
          final usernameOffset =
              object.username == null ? null : fbb.writeString(object.username);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, uidOffset);
          fbb.addOffset(2, usernameOffset);
          fbb.addOffset(3, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Contact(
              uid: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              username: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              email: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10))
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

          return object;
        }),
    Test_cvd: EntityDefinition<Test_cvd>(
        model: _entities[1],
        toOneRelations: (Test_cvd object) => [],
        toManyRelations: (Test_cvd object) => {},
        getId: (Test_cvd object) => object.id,
        setId: (Test_cvd object, int id) {
          object.id = id;
        },
        objectToFB: (Test_cvd object, fb.Builder fbb) {
          final test_urlOffset =
              object.test_url == null ? null : fbb.writeString(object.test_url);
          fbb.startTable(3);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, test_urlOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Test_cvd(
              test_url: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6))
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Contact] entity fields to define ObjectBox queries.
class Contact_ {
  /// see [Contact.id]
  static final id = QueryIntegerProperty<Contact>(_entities[0].properties[0]);

  /// see [Contact.uid]
  static final uid = QueryStringProperty<Contact>(_entities[0].properties[1]);

  /// see [Contact.username]
  static final username =
      QueryStringProperty<Contact>(_entities[0].properties[2]);

  /// see [Contact.email]
  static final email = QueryStringProperty<Contact>(_entities[0].properties[3]);
}

/// [Test_cvd] entity fields to define ObjectBox queries.
class Test_cvd_ {
  /// see [Test_cvd.id]
  static final id = QueryIntegerProperty<Test_cvd>(_entities[1].properties[0]);

  /// see [Test_cvd.test_url]
  static final test_url =
      QueryStringProperty<Test_cvd>(_entities[1].properties[1]);
}

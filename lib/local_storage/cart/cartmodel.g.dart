// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartModelAdapter extends TypeAdapter<HiveCartModel> {
  @override
  final int typeId = 0;

  @override
  HiveCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartModel(
      fields[0] as String,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.qty)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.resid)
      ..writeByte(6)
      ..write(obj.resName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

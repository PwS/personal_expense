// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppThemeEnumAdapter extends TypeAdapter<AppThemeEnum> {
  @override
  final int typeId = 1;

  @override
  AppThemeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppThemeEnum.light;
      case 1:
        return AppThemeEnum.dark;
      default:
        return AppThemeEnum.light;
    }
  }

  @override
  void write(BinaryWriter writer, AppThemeEnum obj) {
    switch (obj) {
      case AppThemeEnum.light:
        writer.writeByte(0);
        break;
      case AppThemeEnum.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

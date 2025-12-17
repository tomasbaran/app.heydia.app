import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_list.freezed.dart';

/// Represents a list of items for a specific date
///
/// Contains an ordered array of item IDs that belong to this date.
/// The date acts as the identifier for this list.
@freezed
abstract class DateList with _$DateList {
  const factory DateList({
    required DateTime date,
    required List<String> itemIds,
  }) = _DateList;
}

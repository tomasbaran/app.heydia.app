// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DateList {

 DateTime get date; List<String> get itemIds;
/// Create a copy of DateList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateListCopyWith<DateList> get copyWith => _$DateListCopyWithImpl<DateList>(this as DateList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateList&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.itemIds, itemIds));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(itemIds));

@override
String toString() {
  return 'DateList(date: $date, itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class $DateListCopyWith<$Res>  {
  factory $DateListCopyWith(DateList value, $Res Function(DateList) _then) = _$DateListCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<String> itemIds
});




}
/// @nodoc
class _$DateListCopyWithImpl<$Res>
    implements $DateListCopyWith<$Res> {
  _$DateListCopyWithImpl(this._self, this._then);

  final DateList _self;
  final $Res Function(DateList) _then;

/// Create a copy of DateList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? itemIds = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,itemIds: null == itemIds ? _self.itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DateList].
extension DateListPatterns on DateList {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DateList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DateList() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DateList value)  $default,){
final _that = this;
switch (_that) {
case _DateList():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DateList value)?  $default,){
final _that = this;
switch (_that) {
case _DateList() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<String> itemIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DateList() when $default != null:
return $default(_that.date,_that.itemIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<String> itemIds)  $default,) {final _that = this;
switch (_that) {
case _DateList():
return $default(_that.date,_that.itemIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<String> itemIds)?  $default,) {final _that = this;
switch (_that) {
case _DateList() when $default != null:
return $default(_that.date,_that.itemIds);case _:
  return null;

}
}

}

/// @nodoc


class _DateList implements DateList {
  const _DateList({required this.date, required final  List<String> itemIds}): _itemIds = itemIds;
  

@override final  DateTime date;
 final  List<String> _itemIds;
@override List<String> get itemIds {
  if (_itemIds is EqualUnmodifiableListView) return _itemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemIds);
}


/// Create a copy of DateList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateListCopyWith<_DateList> get copyWith => __$DateListCopyWithImpl<_DateList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateList&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._itemIds, _itemIds));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_itemIds));

@override
String toString() {
  return 'DateList(date: $date, itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class _$DateListCopyWith<$Res> implements $DateListCopyWith<$Res> {
  factory _$DateListCopyWith(_DateList value, $Res Function(_DateList) _then) = __$DateListCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<String> itemIds
});




}
/// @nodoc
class __$DateListCopyWithImpl<$Res>
    implements _$DateListCopyWith<$Res> {
  __$DateListCopyWithImpl(this._self, this._then);

  final _DateList _self;
  final $Res Function(_DateList) _then;

/// Create a copy of DateList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? itemIds = null,}) {
  return _then(_DateList(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,itemIds: null == itemIds ? _self._itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Item {

 String get id; String get title; bool get isCompleted; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted,createdAt,updatedAt);

@override
String toString() {
  return 'Item(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isCompleted, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Task value)?  task,TResult Function( Todo value)?  todo,TResult Function( Event value)?  event,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Task() when task != null:
return task(_that);case Todo() when todo != null:
return todo(_that);case Event() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Task value)  task,required TResult Function( Todo value)  todo,required TResult Function( Event value)  event,}){
final _that = this;
switch (_that) {
case Task():
return task(_that);case Todo():
return todo(_that);case Event():
return event(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Task value)?  task,TResult? Function( Todo value)?  todo,TResult? Function( Event value)?  event,}){
final _that = this;
switch (_that) {
case Task() when task != null:
return task(_that);case Todo() when todo != null:
return todo(_that);case Event() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String title,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  task,TResult Function( String id,  String title,  DateTime date,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  todo,TResult Function( String id,  String title,  DateTime startDateTime,  DateTime? endDateTime,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  event,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Task() when task != null:
return task(_that.id,_that.title,_that.isCompleted,_that.createdAt,_that.updatedAt);case Todo() when todo != null:
return todo(_that.id,_that.title,_that.date,_that.isCompleted,_that.createdAt,_that.updatedAt);case Event() when event != null:
return event(_that.id,_that.title,_that.startDateTime,_that.endDateTime,_that.isCompleted,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String title,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)  task,required TResult Function( String id,  String title,  DateTime date,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)  todo,required TResult Function( String id,  String title,  DateTime startDateTime,  DateTime? endDateTime,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)  event,}) {final _that = this;
switch (_that) {
case Task():
return task(_that.id,_that.title,_that.isCompleted,_that.createdAt,_that.updatedAt);case Todo():
return todo(_that.id,_that.title,_that.date,_that.isCompleted,_that.createdAt,_that.updatedAt);case Event():
return event(_that.id,_that.title,_that.startDateTime,_that.endDateTime,_that.isCompleted,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String title,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  task,TResult? Function( String id,  String title,  DateTime date,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  todo,TResult? Function( String id,  String title,  DateTime startDateTime,  DateTime? endDateTime,  bool isCompleted,  DateTime? createdAt,  DateTime? updatedAt)?  event,}) {final _that = this;
switch (_that) {
case Task() when task != null:
return task(_that.id,_that.title,_that.isCompleted,_that.createdAt,_that.updatedAt);case Todo() when todo != null:
return todo(_that.id,_that.title,_that.date,_that.isCompleted,_that.createdAt,_that.updatedAt);case Event() when event != null:
return event(_that.id,_that.title,_that.startDateTime,_that.endDateTime,_that.isCompleted,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class Task extends Item {
  const Task({required this.id, required this.title, this.isCompleted = false, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted,createdAt,updatedAt);

@override
String toString() {
  return 'Item.task(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isCompleted, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class Todo extends Item {
  const Todo({required this.id, required this.title, required this.date, this.isCompleted = false, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String title;
 final  DateTime date;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoCopyWith<Todo> get copyWith => _$TodoCopyWithImpl<Todo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,date,isCompleted,createdAt,updatedAt);

@override
String toString() {
  return 'Item.todo(id: $id, title: $title, date: $date, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) = _$TodoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime date, bool isCompleted, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TodoCopyWithImpl<$Res>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? date = null,Object? isCompleted = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Todo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class Event extends Item {
  const Event({required this.id, required this.title, required this.startDateTime, this.endDateTime, this.isCompleted = false, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String title;
 final  DateTime startDateTime;
 final  DateTime? endDateTime;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDateTime, startDateTime) || other.startDateTime == startDateTime)&&(identical(other.endDateTime, endDateTime) || other.endDateTime == endDateTime)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,startDateTime,endDateTime,isCompleted,createdAt,updatedAt);

@override
String toString() {
  return 'Item.event(id: $id, title: $title, startDateTime: $startDateTime, endDateTime: $endDateTime, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime startDateTime, DateTime? endDateTime, bool isCompleted, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? startDateTime = null,Object? endDateTime = freezed,Object? isCompleted = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDateTime: null == startDateTime ? _self.startDateTime : startDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,endDateTime: freezed == endDateTime ? _self.endDateTime : endDateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

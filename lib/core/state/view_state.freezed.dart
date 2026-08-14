// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewState<T> {

 String get message; BaseContentState<T> get actionStatus;
/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewStateCopyWith<T, ViewState<T>> get copyWith => _$ViewStateCopyWithImpl<T, ViewState<T>>(this as ViewState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewState<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,message,actionStatus);

@override
String toString() {
  return 'ViewState<$T>(message: $message, actionStatus: $actionStatus)';
}


}

/// @nodoc
abstract mixin class $ViewStateCopyWith<T,$Res>  {
  factory $ViewStateCopyWith(ViewState<T> value, $Res Function(ViewState<T>) _then) = _$ViewStateCopyWithImpl;
@useResult
$Res call({
 String message, BaseContentState<T> actionStatus
});


$BaseContentStateCopyWith<T, $Res> get actionStatus;

}
/// @nodoc
class _$ViewStateCopyWithImpl<T,$Res>
    implements $ViewStateCopyWith<T, $Res> {
  _$ViewStateCopyWithImpl(this._self, this._then);

  final ViewState<T> _self;
  final $Res Function(ViewState<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? actionStatus = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as BaseContentState<T>,
  ));
}
/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseContentStateCopyWith<T, $Res> get actionStatus {
  
  return $BaseContentStateCopyWith<T, $Res>(_self.actionStatus, (value) {
    return _then(_self.copyWith(actionStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewState].
extension ViewStatePatterns<T> on ViewState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewState<T> value)  $default,){
final _that = this;
switch (_that) {
case _ViewState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  BaseContentState<T> actionStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewState() when $default != null:
return $default(_that.message,_that.actionStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  BaseContentState<T> actionStatus)  $default,) {final _that = this;
switch (_that) {
case _ViewState():
return $default(_that.message,_that.actionStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  BaseContentState<T> actionStatus)?  $default,) {final _that = this;
switch (_that) {
case _ViewState() when $default != null:
return $default(_that.message,_that.actionStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ViewState<T> implements ViewState<T> {
  const _ViewState({this.message = '', this.actionStatus = const BaseContentState()});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  BaseContentState<T> actionStatus;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewStateCopyWith<T, _ViewState<T>> get copyWith => __$ViewStateCopyWithImpl<T, _ViewState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewState<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,message,actionStatus);

@override
String toString() {
  return 'ViewState<$T>(message: $message, actionStatus: $actionStatus)';
}


}

/// @nodoc
abstract mixin class _$ViewStateCopyWith<T,$Res> implements $ViewStateCopyWith<T, $Res> {
  factory _$ViewStateCopyWith(_ViewState<T> value, $Res Function(_ViewState<T>) _then) = __$ViewStateCopyWithImpl;
@override @useResult
$Res call({
 String message, BaseContentState<T> actionStatus
});


@override $BaseContentStateCopyWith<T, $Res> get actionStatus;

}
/// @nodoc
class __$ViewStateCopyWithImpl<T,$Res>
    implements _$ViewStateCopyWith<T, $Res> {
  __$ViewStateCopyWithImpl(this._self, this._then);

  final _ViewState<T> _self;
  final $Res Function(_ViewState<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? actionStatus = null,}) {
  return _then(_ViewState<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as BaseContentState<T>,
  ));
}

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseContentStateCopyWith<T, $Res> get actionStatus {
  
  return $BaseContentStateCopyWith<T, $Res>(_self.actionStatus, (value) {
    return _then(_self.copyWith(actionStatus: value));
  });
}
}

// dart format on

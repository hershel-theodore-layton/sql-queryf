/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

newtype Opaque as arraykey = arraykey;
newtype OpaqueArraykey<T as arraykey> as Opaque = T;
type OpaqueInt = OpaqueArraykey<int>;
type OpaqueString = OpaqueArraykey<string>;

function opaque_int_from_int(int $int)[]: OpaqueInt {
  return $int;
}

function opaque_int_to_int(OpaqueInt $opaque_int)[]: int {
  return $opaque_int;
}

function opaque_string_from_string(string $string)[]: OpaqueString {
  return $string;
}

function opaque_string_to_string(OpaqueString $opaque_string)[]: string {
  return $opaque_string;
}

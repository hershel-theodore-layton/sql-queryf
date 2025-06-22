/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\_Private;

/**
 * Hack tries to stop you from using \HH\BuiltinEnum<...> in your code.
 * Hack has made an exception for "built-in header files" (hhi files).
 * This file is not a `.hack` file, but a `.hhi` file, to use this exception.
 * This is not a definition of AliasFor..., but merely a declaration.
 * This declaration informs Hack that there is some type named AliasFor...
 * and that it is equivalent to \HH\BuiltinEnum<arraykey>. In reality,
 * this type does not exist at runtime. Using this name directly may result in
 * undefined behavior. You must treat this type very gingerly.
 */
type AliasForAnyEnumNotPresentAtRuntime__DO_NOT_USE = \HH\BuiltinEnum<arraykey>;

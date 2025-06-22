/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\_Private;

/**
 * @see AliasForAnyEnumNotPresentAtRuntime__DO_NOT_USE
 *
 * We have a type that is not present at runtime,
 * which means we can not refer to it in an enforced position.
 * By wrapping a type in a generic type alias, the runtime
 * will not try to enforce the type. This allows us to get
 * away with using a type that does not exist.
 */
type ReferToATypeThatNotExistWithoutFatalErrors<T> = T;

/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

/**
 * The idea is to be able to support `%e` (take any enum) in SqlFormat.
 *
 * This type refers to any enum, FOR THE TYPECHECKER ONLY!
 * The runtime will read this type as `type AnyEnum = mixed`,
 * because of arcane reasons.
 *
 * Please do not use `TypeVisitor\visit<AnyEnum>()`
 * on this type, since the runtime will realize it has been duped.
 * 
 * @see _Private\ReferToATypeThatNotExistWithoutFatalErrors for details.
 */
type AnyEnum = _Private\ReferToATypeThatNotExistWithoutFatalErrors<
  _Private\AliasForAnyEnumNotPresentAtRuntime__DO_NOT_USE,
>;

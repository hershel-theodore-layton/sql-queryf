/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

/**
 * The "compatible" query pack, that only uses specifiers supported by
 * `HH\Lib\SQL\Query`.
 */
final class HipHopLibSqlQueryPack {
  use QueryMethods;
}

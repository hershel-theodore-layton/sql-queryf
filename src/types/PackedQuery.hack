/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

/**
 * The "fancy" query pack that supports an open set of specifiers.
 */
interface PackedQuery {
  public function getArguments()[]: vec<mixed>;
  public function getFormat()[]: string;
}

/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function bool_to_int(bool $bool)[]: int {
  return $bool ? 1 : 0;
}

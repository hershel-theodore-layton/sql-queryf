/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_int_equality(?int $int)[]: string {
  return $int is null ? 'IS NULL' : '= '.$int;
}

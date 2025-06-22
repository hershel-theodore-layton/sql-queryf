/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_int(?int $int)[]: string {
  return $int is null ? 'NULL' : (string)$int;
}

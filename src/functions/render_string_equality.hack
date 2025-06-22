/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_string_equality(?string $string)[]: string {
  return $string is null ? 'IS NULL' : '= '.render_string($string);
}

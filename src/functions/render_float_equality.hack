/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_float_equality(?float $float)[]: string {
  return $float is null ? 'IS NULL' : '= '.render_float($float);
}

/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_string(?string $string)[]: string {
  return $string is null ? 'NULL' : '"'.fake_mysql_escape_UNSAFE($string).'"';
}

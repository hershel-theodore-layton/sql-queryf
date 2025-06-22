/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\Str;

function render_column(string $column)[]: string {
  return Str\replace($column, '`', '``') |> '`'.$$.'`';
}

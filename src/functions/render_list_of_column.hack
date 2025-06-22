/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\{Str, Vec};

function render_list_of_column(vec<string> $columns)[]: string {
  return Vec\map($columns, render_column<>) |> Str\join($$, ', ');
}

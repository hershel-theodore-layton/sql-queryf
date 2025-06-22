/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\{Str, Vec};

function render_list_of_string(vec<string> $strings)[]: string {
  return Vec\map($strings, render_string<>) |> Str\join($$, ', ');
}

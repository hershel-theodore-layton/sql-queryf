/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\{Str, Vec};

function render_list_of_int(vec<int> $ints)[]: string {
  return Vec\map($ints, render_int<>) |> Str\join($$, ', ');
}

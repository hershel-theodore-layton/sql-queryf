/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\{Str, Vec};

function render_list_of_float(vec<float> $floats)[]: string {
  return Vec\map($floats, render_float<>) |> Str\join($$, ', ');
}

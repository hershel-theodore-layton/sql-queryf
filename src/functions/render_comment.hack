/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\Str;

function render_comment(string $comment)[]: string {
  return Str\replace($comment, '*/', '* /') |> '/*'.$$.'*/';
}

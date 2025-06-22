/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\Str;

function fake_mysql_escape_UNSAFE(string $string)[]: string {
  return Str\replace_every($string, dict['\\' => '\\\\', '"' => '\"']);
}

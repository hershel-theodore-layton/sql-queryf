/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\ToString;

use type HTL\Pragma\Pragmas;

<<file:
  Pragmas(
    vec['PhaLinters', 'fixme:camel_cased_methods_underscored_functions'],
  )>>

interface Sql {
  public function format_upcase_c(string $_)[]: string;
  public function format_upcase_k(string $_)[]: string;
  public function format_upcase_q(
    \HTL\SqlQueryf\HipHopLibSqlQueryPack $_,
  )[]: string;
  public function format_upcase_t(string $_)[]: string;
  public function format_d(?int $_)[]: string;
  public function format_f(?float $_)[]: string;
  public function format_s(?string $_)[]: string;
  public function format_0x25()[]: string;
  public function format_0x3d()[]: SqlWithEquals;
  public function format_upcase_l()[]: SqlWithUpperL;
}

interface SqlWithEquals {
  public function format_d(?int $_)[]: string;
  public function format_f(?float $_)[]: string;
  public function format_s(?string $_)[]: string;
}

interface SqlWithUpperL {
  public function format_upcase_c(vec<string> $_)[]: string;
  public function format_d(vec<int> $_)[]: string;
  public function format_f(vec<float> $_)[]: string;
  public function format_s(vec<string> $_)[]: string;
}

function engine(
  string $old_format,
  vec<mixed> $old_args,
)[]: (string, vec<mixed>) {
  $new_format = '';
  $new_args = vec[];

  for ($percent = 0, $arg_i = 0, $unseen_part = 0; ; ) {
    $percent = \HH\Lib\Str\search($old_format, '%', $unseen_part);
    $new_format .= \HH\Lib\Str\slice(
      $old_format,
      $unseen_part,
      $percent is nonnull ? $percent - $unseen_part : null,
    );

    if ($percent is null) {
      $consumed_arg_count = \HH\Lib\C\count($old_args);
      invariant(
        $consumed_arg_count === $arg_i,
        'Arguments were not consumed correctly. %d arguments were provided, but %d were consumed',
        $consumed_arg_count,
        $arg_i,
      );
      return tuple($new_format, $new_args);
    }

    if ($old_format[$percent + 1] === '%') {
      $new_format .= '%%';
      $unseen_part = $percent + 2;
      continue;
    }

    $done = false;
    $state = 0;
    for ($char_i = $percent + 1; !$done; ++$char_i) {
      $arg = $old_args[$arg_i] ?? null;
      $char = \ord($old_format[$char_i] ?? '');
      switch ($state) {
        case 0:
          switch ($char) {
            case 0x43: // 'C'
              $arg = $arg |> cast_generated_79ee78ec1a12904739e2904d($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_column($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x4b: // 'K'
              $arg = $arg |> cast_generated_79ee78ec1a12904739e2904d($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_comment($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x51: // 'Q'
              $new_format .= '%s';
              $new_args[] = $arg
                |> $$ is \HTL\SqlQueryf\HipHopLibSqlQueryPack
                  ? \HTL\SqlQueryf\render_hh_lib_sql_style_pack($$)
                  : \HTL\SqlQueryf\unsupported_query_object($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x54: // 'T'
              $arg = $arg |> cast_generated_79ee78ec1a12904739e2904d($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_column($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x64: // 'd'
              $arg = $arg |> cast_generated_868f84cda605c65bc8733c69($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_int($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x66: // 'f'
              $arg = $arg |> cast_generated_a9f8a9bb2b6c302f20901be3($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_float($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x73: // 's'
              $arg = $arg |> cast_generated_dcd6916a0daf20dbd3dc4622($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_string($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x25: // '%' -> string
              $state = 1;
              break;
            case 0x3d: // '=' -> SqlWithEquals
              $state = 2;
              break;
            case 0x4c: // 'L' -> SqlWithUpperL
              $state = 3;
              break;
            default:
              invariant_violation('Unexpected 0x%x at %d', $char, $char_i);
          }
          break;

        case 1:
          switch ($char) {

            default:
              invariant_violation('Unexpected 0x%x at %d', $char, $char_i);
          }
          break;

        case 2:
          switch ($char) {
            case 0x64: // '=d'
              $arg = $arg |> cast_generated_868f84cda605c65bc8733c69($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_int_equality($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x66: // '=f'
              $arg = $arg |> cast_generated_a9f8a9bb2b6c302f20901be3($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_float_equality($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x73: // '=s'
              $arg = $arg |> cast_generated_dcd6916a0daf20dbd3dc4622($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_string_equality($$);
              ++$arg_i;
              $done = true;
              break;
            default:
              invariant_violation('Unexpected 0x%x at %d', $char, $char_i);
          }
          break;

        case 3:
          switch ($char) {
            case 0x43: // 'LC'
              $arg = $arg |> cast_generated_93ee28980c044af8f00a932f($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_list_of_column($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x64: // 'Ld'
              $arg = $arg |> cast_generated_51dc9156be078e6c34774551($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_list_of_int($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x66: // 'Lf'
              $arg = $arg |> cast_generated_43968a707009283bfa08c6e1($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_list_of_float($$);
              ++$arg_i;
              $done = true;
              break;
            case 0x73: // 'Ls'
              $arg = $arg |> cast_generated_93ee28980c044af8f00a932f($$);
              $new_format .= '%s';
              $new_args[] = $arg |> \HTL\SqlQueryf\render_list_of_string($$);
              ++$arg_i;
              $done = true;
              break;
            default:
              invariant_violation('Unexpected 0x%x at %d', $char, $char_i);
          }
          break;
        default:
          invariant_violation('unreachable');
      }
    }

    $unseen_part = $char_i;
  }
}

function cast_generated_79ee78ec1a12904739e2904d(
  mixed $htl_untyped_variable,
)[]: string {
  return $htl_untyped_variable as string;
}

function cast_generated_93ee28980c044af8f00a932f(
  mixed $htl_untyped_variable,
)[]: vec<string> {
  $out__1 = vec[];
  foreach (($htl_untyped_variable as vec<_>) as $v__1) {
    $out__1[] = $v__1 as string;
  }
  return $out__1;
}

function cast_generated_868f84cda605c65bc8733c69(
  mixed $htl_untyped_variable,
)[]: ?int {
  return $htl_untyped_variable as ?int;
}

function cast_generated_51dc9156be078e6c34774551(
  mixed $htl_untyped_variable,
)[]: vec<int> {
  $out__1 = vec[];
  foreach (($htl_untyped_variable as vec<_>) as $v__1) {
    $out__1[] = $v__1 as int;
  }
  return $out__1;
}

function cast_generated_a9f8a9bb2b6c302f20901be3(
  mixed $htl_untyped_variable,
)[]: ?float {
  return $htl_untyped_variable as ?float;
}

function cast_generated_43968a707009283bfa08c6e1(
  mixed $htl_untyped_variable,
)[]: vec<float> {
  $out__1 = vec[];
  foreach (($htl_untyped_variable as vec<_>) as $v__1) {
    $out__1[] = $v__1 as float;
  }
  return $out__1;
}

function cast_generated_dcd6916a0daf20dbd3dc4622(
  mixed $htl_untyped_variable,
)[]: ?string {
  return $htl_untyped_variable as ?string;
}

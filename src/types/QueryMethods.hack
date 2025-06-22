/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH;

<<__ConsistentConstruct>>
trait QueryMethods {
  private string $format;
  private vec<mixed> $args;

  private function __construct(string $format, vec<mixed> $args)[] {
    $this->format = $format;
    $this->args = $args;
  }

  public static function create<<<__Explicit>> T>(
    HH\FormatString<T> $format,
    mixed ...$args
  )[]: this {
    return new static($format as string, vec($args));
  }

  public static function createWithoutTypechecking_UNSAFE(
    string $format,
    vec<mixed> $args,
  )[]: this {
    return new static($format, $args);
  }

  public function getArguments()[]: vec<mixed> {
    return $this->args;
  }

  public function getFormat()[]: string {
    return $this->format;
  }
}

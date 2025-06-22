/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\Project_iq6mhAJvIVlG\GeneratedTestChain;

use namespace HTL\TestChain;

async function tests_async(
  TestChain\ChainController<\HTL\TestChain\Chain> $controller
)[defaults]: Awaitable<TestChain\ChainController<\HTL\TestChain\Chain>> {
  return $controller
    ->addTestGroup(\HTL\SqlQueryf\Tests\usage<>);
}

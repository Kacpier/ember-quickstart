import { module, test } from 'qunit';
import { setupTest } from 'emberjs-webmeets/tests/helpers';

module('Unit | Route | profiles/profile', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:profiles/profile');
    assert.ok(route);
  });
});

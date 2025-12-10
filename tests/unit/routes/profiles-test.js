import { module, test } from 'qunit';
import { setupTest } from 'emberjs-webmeets/tests/helpers';

module('Unit | Route | profiles', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:profiles');
    assert.ok(route);
  });
});

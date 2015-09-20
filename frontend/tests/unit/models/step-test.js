import { moduleForModel, test } from 'ember-qunit';

moduleForModel('step', 'Unit | Model | step', {
  // Specify the other units that are required for this test.
  needs: ['model:parent', 'model:sibling', 'model:child', 'model:completed-by']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});

import DS from 'ember-data';
import $ from 'jquery';
import ActiveModelAdapter from 'active-model-adapter';

export default ActiveModelAdapter.extend({
  /*  headers: {
      "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content'),
      "Content-Type": "application/json"
    }, */
    namespace: 'api'
});

import DS from 'ember-data';
import $ from 'jquery';

export default DS.JSONAPIAdapter.extend({
  headers: {
    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content'),
    "Content-Type": "application/json"
  },
  namespace: 'api',
  host: 'http://our_club_tracker.dev'
});

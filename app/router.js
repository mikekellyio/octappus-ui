import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('organizations', {path: '/orgs'}, function(){
    this.route('show', { path: '/orgs/:organization_id' }, function(){
      this.route('teams');
    });
  });

  this.route('teams.show', { path: '/teams/:team_id' });

  this.route('children', { path: '/children' });
  this.route('children.show', { path: '/children/:child_id' }, function(){
      this.route('attendance', { path: 'attendance' });
      this.route('awards', { path: 'awards' }, function(){
        this.route('show', { path: ':award_id' });
      });
      this.route('steps', { path: 'step' }, function(){
        this.route('next', { path: 'next' });
        this.route('pending', { path: 'pending' }, function(){
          this.route('show', { path: ':step_id' });
        });
        this.route('completed', { path: 'completed' }, function(){
          this.route('show', { path: ':step_id' });
        });
      });
  });
  this.route('steps');
  this.route('protected');
});

export default Router;

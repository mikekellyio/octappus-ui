import DS from 'ember-data';

export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  nickname: DS.attr('string'),
  birthday: DS.attr('date'),
  avatarHash: DS.attr('string'),
  team: DS.belongsTo('team'),
  completedSteps: DS.hasMany('step', { inverse: 'completedBy' }),
  pendingSteps: DS.hasMany('step'),
  nextStep: DS.belongsTo('step'),
  completedAwards: DS.hasMany('award'),
  pendingAwards: DS.hasMany('award'),
  awards: DS.hasMany('award', { inverse: 'children' }),
  filteredCompletedSteps: function(){
    return this.get('completedSteps').filterBy('isLeaf', false);
  }.property('completedSteps.[]'),
  filteredPendingSteps: function(){
    return this.get('pendingSteps').filterBy('isLeaf', false);
  }.property('pendingSteps.[]'),
  avatarUrl: function() {
    var hash = this.get('avatarHash') ? this.get('avatarHash') : this.get('name');
    return "http://robohash.org/"+hash+".png?";
  }.property('avatarHash'),
  badgeAvatar: function(){
    return this.get('avatarUrl') + "&size=40x40";
  }.property('avatarUrl'),
  chipAvatar: function(){
    return this.get('avatarUrl') + "&size=32x32";
  }.property('avatarUrl'),
  largeAvatar: function(){
    return this.get('avatarUrl') + "&size=150x150&bgset=bg1";
  }.property('avatarUrl'),
  name: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName')
});

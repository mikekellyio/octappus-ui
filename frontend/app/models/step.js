import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  content: DS.attr('string'),
  parent: DS.belongsTo('step', { inverse: 'children' }),
  siblings: DS.hasMany('step'),
  children: DS.hasMany('step', { inverse: 'parent' }),
  completedBy: DS.hasMany('child', { inverse: 'completedSteps'}),
  isLeaf: function(){
    return this.get('children').length === 0;
  }.property('children'),
});

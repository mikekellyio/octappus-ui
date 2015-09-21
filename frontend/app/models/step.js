import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  content: DS.attr('string'),
  depth: DS.attr('number'),
  rgt: DS.attr('number'),
  lft: DS.attr('number'),
  parent: DS.belongsTo('step', { inverse: 'children' }),
  siblings: DS.hasMany('step'),
  children: DS.hasMany('step', { inverse: 'parent' }),
  completedBy: DS.hasMany('child', { inverse: 'completedSteps'})
});

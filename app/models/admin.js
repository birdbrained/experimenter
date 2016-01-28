import DS from 'ember-data';

export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  username: DS.attr('string'),
  password: DS.attr('string'),

  experiments: DS.hasMany('experiment'),
  configs: DS.belongsTo('config'),
});

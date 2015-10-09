chain = (klass, parents=[]) ->
  return parents unless klass.__super__?

  parent = klass.__super__
  parents.push parent
  chain parent, parents

mixup = (base, mixins...) ->
  class Mixed extends base

  for mixin in mixins
    # Inherit instance methods from mixed in classes
    for name, method of mixin::
      Mixed::[name] = method

    # Inherit class methods from mixed in classes
    for parent in chain mixin
      for name, method of parent.constructor
        unless name == '__super__'
          Mixed[name] = method

  Mixed

module.exports = mixup

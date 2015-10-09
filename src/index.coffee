chain = (klass, parents=[]) ->
  return parents unless klass.__super__?

  parent = klass.__super__
  parents.push parent
  chain parent, parents

mixup = (Base, mixins...) ->
  for mixin in mixins
    # Inherit instance methods/properties from mixed in classes
    for name, method of mixin::
      Base::[name] = method

    # Inherit class methods/properties from mixed in classes
    for parent in chain mixin
      for name, method of parent.constructor
        unless name == '__super__'
          Base[name] = method

  Base

module.exports = mixup

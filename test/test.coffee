should = require('chai').should()

mixup = require '../lib'

class A
  method: -> 'A'

class B extends A
  method: -> "B > #{super}"

class C extends A
  @classmethod: -> "C"
  method: -> "C > #{super}"

class D extends C
  method: -> "D > #{super}"

class E extends mixup B, C, D
  method: -> "E > #{super}"

e = new E

describe 'mixup', ->
  it 'should mixin instance methods correctly', ->
    e.method().should.eq 'E > D > C > A'
  it 'should mixin class methods correctly', ->
    E.classmethod().should.eq 'C'

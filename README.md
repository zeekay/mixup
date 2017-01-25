## mixup [![Build Status](https://travis-ci.org/zeekay/mixup.svg?branch=master)](https://travis-ci.org/zeekay/mixup)
#### Mixins for CoffeeScript

[![Greenkeeper badge](https://badges.greenkeeper.io/zeekay/mixup.svg)](https://greenkeeper.io/)
Fast, simple mixin library for CoffeeScript. Supports instance and class
variables. Does not to do any fancy linearization or anything like that. Each
class in a mixup clobbers previously defined methods. If you want something
closer to Python's multiple inheritance, checkout
[heterarchy](https://github.com/arximboldi/heterarchy).

### Installation

```sh
$ npm install mixup
```

### Usage
```coffeescript
mixup = require 'mixup'

class A
  method: -> 'A'

class B extends A
  method: -> "B > #{super}"

class C extends A
  @classmethod: -> "C"
  method: -> "C > #{super}"

class D extends mixup B, C
  method: -> "D > #{super}"

d = new D
console.log d.method()
console.log D.classmethod()
```

Would output:

```
D > C > A
C
```

fs = require 'fs'

Key = require './key'
key = new Key fs.readFileSync '/tmp/key'

text = process.argv[2]
console.log key.decrypt key.encrypt text

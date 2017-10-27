crypto = require 'crypto'
fs = require 'fs'

file = process.argv[2]
string = crypto.randomBytes 32

fs.writeFileSync file, string

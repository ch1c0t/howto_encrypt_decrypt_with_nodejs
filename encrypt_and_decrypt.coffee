{ encrypt, decrypt } = require './encryption'

text = process.argv[2]
console.log decrypt encrypt text

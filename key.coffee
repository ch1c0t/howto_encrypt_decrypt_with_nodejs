crypto = require 'crypto'

IV_LENGTH = 16

class Key
  constructor: (@key) ->

  encrypt: (string) ->
    iv = crypto.randomBytes IV_LENGTH
    cipher = crypto.createCipheriv(
      'aes-256-cbc'
      new Buffer(@key), iv
    )
    encrypted = cipher.update string

    encrypted = Buffer.concat [encrypted, cipher.final()]

    iv.toString('hex') + ':' + encrypted.toString('hex')

  decrypt: (string) ->
    textParts = string.split ':'
    iv = new Buffer textParts.shift(), 'hex'
    encryptedText = new Buffer textParts.join(':'), 'hex'
    decipher = crypto.createDecipheriv 'aes-256-cbc', new Buffer(@key), iv
    decrypted = decipher.update encryptedText

    decrypted = Buffer.concat [decrypted, decipher.final()]

    decrypted.toString()


module.exports = Key

# Pip.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#


Pip = () ->
	self = this
	this["bind"] = (exchange,key,queue) ->
		console.log("Got request to bind #{exchange}:#{key} ->  #{queue}")
		self.connection.exchange exchange, { durable: false, type: 'topic', autoDelete: true }, (Exchange) ->
			self.connection.queue queue,{ arguments: { "x-message-ttl" : 60000 } }, (Queue) ->
				Queue.bind exchange, key
				console.log "bound #{exchange}:#{key} -> #{queue}"
	this["unbind"] = (exchange,key,queue) ->
		console.log("Got request to unbind #{exchange}:#{key} ->  #{queue}")
		self.connection.queue queue,{ arguments: { "x-message-ttl" : 60000 } }, (Queue) ->
			Queue.unbind exchange, key
			console.log "unbound #{exchange}:#{key} -> #{queue}"
	this["*"] = (message...) ->
		console.log(message)

module.exports = Pip

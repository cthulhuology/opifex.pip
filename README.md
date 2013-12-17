Opifex.pip
=================

A module for managing dynamic exchange bindings


Getting Started:
----------------

You can start up an opifex.pip as follows

	opifex 'amqp://guest:guest@localhost:5672//pip-in/#/pip/pip-out/pip' pip

This module acts as the backend for the pip framework for building dynamically configured
networks of opifex daemons.  Where as pip can create a directed graph, the opifex.pip module
turns it into a reality on the backend.

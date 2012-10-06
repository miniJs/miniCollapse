#
# Name        : miniCollapse
# Description : Add collapsible content with ease
# Author      : Matthieu Aussaguel, matthieu.aussaguel@gmail.com
# Version     : 0.1.0
# Repo        : git://github.com/miniJs/miniCollapse.git
# Website     : https://github.com/miniJs/miniCollapse
#

jQuery ->
  $.miniCollapse = ( element, options ) ->
    # current state
    state = ''

    # plugin settings
    @settings = {}

    # jQuery version of DOM element attached to the plugin
    @$element = $ element

    # set current state
    @setState = ( _state ) -> state = _state

    #get current state
    @getState = -> state

    # get particular plugin setting
    @getSetting = ( key ) ->
      @settings[ key ]

    # call one of the plugin setting functions
    @callSettingFunction = ( name, args = [] ) ->
      @settings[name].apply( this, args )

    @init = ->
      @settings = $.extend( {}, @defaults, options )
      @callSettingFunction( 'callback', [ @$element, @getSetting( 'message' ) ] ) 

      @setState 'ready'

    # initialise the plugin
    @init()

    # make the plugin chainable
    this

  # default plugin settings
  $.miniCollapse::defaults =
      message: 'hello word'  # option description
      callback: ->           # callback description

  $.fn.miniCollapse = ( options ) ->
    this.each ->
      if $( this ).data( 'miniCollapse' ) is undefined
        plugin = new $.miniCollapse( this, options )
        $( this).data( 'miniCollapse', plugin )
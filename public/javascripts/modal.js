/* Simple JavaScript Inheritance
 * By John Resig http://ejohn.org/
 * MIT Licensed.
 */
// Inspired by base2 and Prototype
(function(){
  var initializing = false, fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;
  // The base Class implementation (does nothing)
  this.Class = function(){};
  
  // Create a new Class that inherits from this class
  Class.extend = function(prop) {
    var _super = this.prototype;
    
    // Instantiate a base class (but only create the instance,
    // don't run the init constructor)
    initializing = true;
    var prototype = new this();
    initializing = false;
    
    // Copy the properties over onto the new prototype
    for (var name in prop) {
      // Check if we're overwriting an existing function
      prototype[name] = typeof prop[name] == "function" && 
        typeof _super[name] == "function" && fnTest.test(prop[name]) ?
        (function(name, fn){
          return function() {
            var tmp = this._super;
            
            // Add a new ._super() method that is the same method
            // but on the super-class
            this._super = _super[name];
            
            // The method only need to be bound temporarily, so we
            // remove it when we're done executing
            var ret = fn.apply(this, arguments);        
            this._super = tmp;
            
            return ret;
          };
        })(name, prop[name]) :
        prop[name];
    }
    
    // The dummy class constructor
    function Class() {
      // All construction is actually done in the init method
      if ( !initializing && this.init )
        this.init.apply(this, arguments);
    }
    
    // Populate our constructed prototype object
    Class.prototype = prototype;
    
    // Enforce the constructor to be what we expect
    Class.prototype.constructor = Class;

    // And make this class extendable
    Class.extend = arguments.callee;
    
    return Class;
  };
})();

var Modal = Class.extend({
  init: function(isModal){
    this.isModal = isModal;
  },
  getModal: function(){
    return this.isModal;
  },
  bindOpenHandler : function(linkSelector){
    var selector = "a[name=modal]";
    if(linkSelector)
    {
      selector = linkSelector;
    }
    
    $(selector).click(function(e) {        
      //Cancel the link behavior        
      e.preventDefault();        
      //Get the A tag        
      var id = $(this).attr('href');             
      //Get the screen height and width        
      var maskHeight = $(document).height();        
      var maskWidth = $(window).width();             
      //Set height and width to mask to fill up the whole screen        
      $('#modal_mask').css({'width':maskWidth,'height':maskHeight});                 
      //transition effect        
      $('#modal_mask').fadeIn(400);            
      $('#modal_mask').fadeTo("slow",0.5);
      //Get the window height and width        
      var winH = $(window).height();        
      var winW = $(window).width();                       
      //Set the popup window to center        
      $(id).css('top', winH/2-$(id).outerHeight()/2);        
      $(id).css('left', winW/2-$(id).outerWidth()/2);             
      //transition effect        
      $(id).fadeIn(300);          
    }); 
  },
  bindCloseHandler : function(){
    //if close button is clicked    
    /*$('.window .close').click(function (e) {        
      //Cancel the link behavior        
      e.preventDefault();        
      $('#mask, .window').fadeOut();   
    });*/
    //if mask is clicked    
    $('#modal_mask').click(function () {        
      $(this).fadeOut();        
      $('.modal').fadeOut();    
    });
  },
  open : function(elementSelector){
    if(!elementSelector){/*should write message*/return;}

    // should be the super class method
    //Get the screen height and width        
    var maskHeight = $(document).height();        
    var maskWidth = $(window).width();             
    //Set height and width to mask to fill up the whole screen        
    $('#modal_mask').css({'width':maskWidth,'height':maskHeight});                 
    //transition effect        
    $('#modal_mask').fadeIn(400);            
    $('#modal_mask').fadeTo("slow",0.5);
    // should be the super class method

    // method that sets the content
    //Get the window height and width        
    var winH = $(window).height();        
    var winW = $(window).width();                       
    //Set the popup window to center        
    $(elementSelector).css('top', winH/2-$(elementSelector).outerHeight()/2);        
    $(elementSelector).css('left', winW/2-$(elementSelector).outerWidth()/2);             
    //transition effect
    $(elementSelector).fadeIn(300);
    // end
  },
  close : function(){
    $("#modal_mask").fadeOut();
    $('.modal').fadeOut();
  }
});


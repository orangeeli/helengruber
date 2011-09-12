// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery
//= require jquery_ujs

// add page to application.js

// page worker - will config the elements with the necessary logic and ui

// page worker init

// page worker set bindings

// page worker render

// implement chain in javascript (javascript should be cached and accessible once the page loads)

// create chain of responsability. Chain of responsability, chain of responsability, chain of responsability
$(document).ready(function() {
    // should be done only once in the application

    // should only run when form with file upload exists in the document
    fileUploadBuilder = new FileUploadFormBuilder;
    fileUploadBuilder.buildFakeForm();
    fileUploadBuilder.buildForm('file_upload');

    // create factory! factory! factory!
    modal = new Modal(false);   
    modal.bindOpenHandler("#contact_anchor");
    modal.bindCloseHandler();

    imageDeleteHook();
    sendMessageHook();
    fileUploadHook();
    modalConfig();
});

function fileUploadHook(){
  /*$('form').live('ajax:aborted:file', function(event, elements){
    // Implement own remote file-transfer handler here for non-blank file inputs
    return false;
  });*/
}

function imageDeleteHook(){
  if($('.image_delete')){
    $('.image_delete').bind('ajax:success', function(evt, data, status, xhr){
      $('div[data-id="'+data['response']['work_graphic_id']+'"]').remove();
      var message = [
        { MessageText: data['response']['message'], MessageType: "success" }
      ];
      $("#application_messages").empty();
      $("#messagesTemplate").tmpl(message).appendTo("#application_messages");
      t=setTimeout((function(){window.modal.close();})(),1000);
    });
  }
}

function sendMessageHook(){

  $('.send_message_form').bind('ajax:success', function(evt, data, status, xhr){
    var message = [
      { MessageText: 'Successfuly Sent', MessageType: "success" }
    ];
    $("#send_message_feedback").empty();
    $("#messagesTemplate").tmpl(message).appendTo("#send_message_feedback");

    // create util singleton that will have set message method (args:: setIn, message array)
    var messagesSelector = "div[id='flash_success'], div[id='flash_notice'], div[id='flash_warning'], div[id='flash_error']";
    var messages = $(messagesSelector);
    if(messages){
      messages.each(function(){
        $(this).delay(2000).fadeOut();
      });
    }
  })

  .bind('ajax:error', function(evt, data, status, xhr){
    var message = [
      { MessageText: 'Please try again. Sorry.', MessageType: "error" }
    ];
    $("#send_message_feedback").empty();
    $("#messagesTemplate").tmpl(message).appendTo("#send_message_feedback");

    var messagesSelector = "div[id='flash_success'], div[id='flash_notice'], div[id='flash_warning'], div[id='flash_error']";
    var messages = $(messagesSelector);
    if(messages){
      messages.each(function(){
        $(this).delay(2000).fadeOut();
      });
    }
  })

  .live('ajax:aborted:required', function(event, elements){
    elements.each(function(){
      $(this).addClass('blank-required');
    });
  });
}

function modalConfig(){
  // set some options
/*  $.nmObj({});

  // set opacity to 50% instead of the 75%
  $.nmAnims({
    fade: {
      showBg: function(nm, clb) {
        nm.elts.bg.fadeTo(250, 0.5, clb);
      }
    }
  });*/
}


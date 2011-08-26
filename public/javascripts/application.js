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

$(document).ready(function() {
    // should be done only once in the application
    fileUploadBuilder = new FileUploadFormBuilder;
    fileUploadBuilder.buildFakeForm();
    fileUploadBuilder.buildForm('file_upload');
    imageDeleteHook();
    fileUploadHook();
    modalConfig();
});

function fileUploadHook(){
  $('form').live('ajax:aborted:file', function(event, elements){
    // Implement own remote file-transfer handler here for non-blank file inputs
    return false;
  });
}

function imageDeleteHook(){
  if($('.image_delete')){
    $('.image_delete').bind('ajax:success', function(evt, data, status, xhr){
      $('div[data-id="'+data['response']['work_graphic_id']+'"]').remove();
      var message = [
        { MessageText: data['response']['message'], MessageType: "success" }
      ];
      $("#messages").empty();
      $("#messagesTemplate").tmpl(message).appendTo("#messages");
      t=setTimeout("delayedModalClose()",1000);
    });
  }
}

function delayedModalClose(){
  $.nmTop().close();
  /*var modal =  $('.nyroModalBg');
  if(modal){
    var parentElement = modal.parent();
    if(parentElement && parentElement.is('div')){
      var grandpa = parentElement.parent();
      if(grandpa && grandpa.is('div')){
        grandpa.remove();
      }
    }
  }*/
}

function modalConfig(){
  // set some options
  $.nmObj({});

  // set opacity to 50% instead of the 75%
  $.nmAnims({
    fade: {
      showBg: function(nm, clb) {
        nm.elts.bg.fadeTo(250, 0.5, clb);
      }
    }
  });
}


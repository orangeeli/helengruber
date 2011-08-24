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
    setImageDeleteBehavior();
});

function setImageDeleteBehavior(){
  if($('.image_delete')){
    $('.image_delete').bind('ajax:success', function(evt, data, status, xhr){
      $('div[data-id="'+data['response']['work_graphic_id']+'"]').remove();
      var message = [
        { MessageText: data['response']['message'], MessageType: "success" }
      ];
      $("#messages").empty();
      $("#messagesTemplate").tmpl(message).appendTo("#messages");
    });
  }
}

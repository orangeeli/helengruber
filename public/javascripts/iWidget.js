
IWdidget.prototype.render = function(){
};
function IWdidget(){ 
}

WidgetBuilder.prototype.build = function(){}

WidgetBuilder.prototype.renderElement= function(element, new_element_name, new_element_attr){
  new_element = document.createElement(new_element_name);
  // for each element attr
  for(var attr in new_element_attr)
  {
     new_element.setAttribute(attr, new_element_attr[attr]);
  }
  element.appendChild(new_element);
}
WidgetBuilder.prototype.createElement= function(new_element_name, new_element_attr){
  new_element = document.createElement(new_element_name);
  // for each element attr
  for(var attr in new_element_attr)
  {
     new_element.setAttribute(attr, new_element_attr[attr]);
  }
  return new_element;
}

function WidgetBuilder(){}

// File form builder
FileUploadFormBuilder.prototype = new WidgetBuilder;
FileUploadFormBuilder.prototype.constructor = FileUploadFormBuilder;
function FileUploadFormBuilder(){
  this.default_file_upload_form_class = 'file_upload';
}

FileUploadFormBuilder.prototype.buildFakeForm = function () {
  var W3CDOM = (document.createElement && document.getElementsByTagName);
  if (!W3CDOM) return;
  
  var fakeFileUpload = this.createElement('div',{"class": 'fakefile'});
  this.renderElement(fakeFileUpload,'input', {"class": "fake_input"});
  this.renderElement(fakeFileUpload,'input', {"type": "button", "value": "Choose File" });

  var x = document.getElementsByTagName('input');
  for (var i=0;i<x.length;i++) {
    if (x[i].type != 'file') continue;
    if (x[i].parentNode.className != 'field file_inputs') continue;
    var clone = fakeFileUpload.cloneNode(true);
    x[i].parentNode.appendChild(clone);
    x[i].relatedElement = clone.getElementsByTagName('input')[0];
    x[i].onchange = x[i].onmouseout = function () {
      this.relatedElement.value = this.value;
    }
  }
}
canSubmit = true;
FileUploadFormBuilder.prototype.buildForm = function (file_upload_form_class){
  container = document.querySelector('.' + file_upload_form_class);
  if(!container) return;
  input_file = container.querySelector('input[type="file"]');
  file_upload_form = container.querySelector('form');

  file_upload_iframe = file_upload_form.id + "_iframe";
  file_upload_form.target = file_upload_iframe;
  
  canSubmit = true;
  $(file_upload_form).submit(function(e){
    $('input[type=file]').each(function(){
      if(!this.value){
        e.preventDefault();
        canSubmit = false;
        renderMessage("Can't upload an empty file", "warning");
        enableFormElements();
        $.nmTop().close();
        return canSubmit;
      }
    });
  });

  this.renderElement(container,'iframe', {"class":'file_upload_iframe_form', "id":file_upload_iframe});
  $(container).find('input[type="submit"]').click(function(e){
    if(!$('input.file').val()){
      e.preventDefault();
      renderMessage("Can't upload an empty file", "warning");
      return false;
    }
    onformSubmit(file_upload_form, input_file);
  });
}
FileUploadFormBuilder.prototype.renderElement = function(container, element, attrs){
  WidgetBuilder.prototype.renderElement(container, element, attrs);
}
FileUploadFormBuilder.prototype.createElement = function(element, attrs){
  return WidgetBuilder.prototype.createElement(element, attrs);
}
function onformSubmit(file_upload_form, input_file){
  // search for the input and hide it
  // show on loading message
  input_file = $(file_upload_form).find('input[type="file"]');
  // input_file.hide();

  //div_actions = $(file_upload_form).find('.actions');
  //div_actions.hide();
  // inject with client side loading feedback element
  // should only change the button label
  // $(file_upload_form).append('<div class="upload_feedback">uploading image...</div>');
  $('iframe').each(function(){
        this.onload = onframeloaded(this);
  });
}
function onframeloaded(iframe){
  // either refresh page or show or inject image (that would require json response) => do it. Return a json object
  $(iframe).load(function(){
    //$('.upload_feedback').text("Image uploaded. Wait for page reload.");
    t=setTimeout("reloadPage()",500);
  });
}
function renderMessage(text, type){
  var message = [
    { MessageText: text, MessageType: type }
  ];
  $("#application_messages").empty();
  $("#messagesTemplate").tmpl(message).appendTo("#application_messages");
}
function enableFormElements(){
  $('form').find('input[data-disable-with]:disabled').each(function() {
    var input = $(this);
    input.val(input.data('ujs:enable-with')).removeAttr('disabled');
  });
}

function cleanInputs(){
  $('input[type=file]').each(function(){
    this.value = null;
  });
}
function reloadPage(){
  //window.location.reload();

  cleanInputs();

  var work_graphic = $.parseJSON($($('iframe').contents().find('body').html()).text()).work_graphic;

  // set success message
  var message = [
    { MessageText: 'Image uploaded', MessageType: "success" }
  ];
  $("#application_messages").empty();
  $("#messagesTemplate").tmpl(message).appendTo("#application_messages");

  // append new image
  var new_work_graphic = [
    { Url: work_graphic.graphic_file, Id: work_graphic.id }
  ];
  $("#workGraphicTemplate").tmpl(new_work_graphic).appendTo("#new_work_graphics");

  enableFormElements();
  imageDeleteHook();
  cleanInputs();
  modal.close();
  clearTimeout(t);
}

// Submit button
SubmitButton.prototype = new WidgetBuilder
SubmitButton.prototype.constructor = SubmitButton;
function SubmitButton(name){
  this.name = name;
}
SubmitButton.prototype.configClick = function(){
   submit_button = document.querySelector('.' + this.name);
}


// add behavior for form buttons: listeners for enabling and disabling the button

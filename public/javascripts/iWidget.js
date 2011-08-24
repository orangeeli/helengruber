
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

function WidgetBuilder(){}


FileUploadFormBuilder.prototype = new WidgetBuilder;

FileUploadFormBuilder.prototype.constructor = FileUploadFormBuilder;

function FileUploadFormBuilder(){
  this.default_file_upload_form_class = 'file_upload';
}
FileUploadFormBuilder.prototype.buildForm = function (file_upload_form_class){
                container = document.querySelector('.' + file_upload_form_class);
                if(!container) return;
                input_file = container.querySelector('input[type="file"]');
                file_upload_form = container.querySelector('form');

                file_upload_iframe = file_upload_form.id + "_iframe";
                file_upload_form.target = file_upload_iframe;

                var attrs = new Array;
                attrs['class'] = 'file-upload-iframe-form';
                attrs['id'] = file_upload_iframe;

                this.renderElement(container,'iframe', attrs);
                $('input[type="submit"]').click(function(){onformSubmit(file_upload_form, input_file);});
              }
FileUploadFormBuilder.prototype.renderElement = function(container, element, attrs){
                WidgetBuilder.prototype.renderElement(container, 'iframe', attrs);
   }

SubmitButton.prototype = new WidgetBuilder

SubmitButton.prototype.constructor = SubmitButton;

function SubmitButton(name){
  this.name = name;
}

SubmitButton.prototype.configClick = function(){

   submit_button = document.querySelector('.' + this.name);
   // submit_button.onclick = 

}


// add behavior for form buttons: listeners for enabling and disabling the button

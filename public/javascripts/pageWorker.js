/**
 * Created by eliseu 'orangeeli' martinho
 * User: eliseu martinho
 * Date: 3/5/11
 * Time: 8:19 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function() {
    // go through elements with class add a function
    // load the menu functions

    // should be done only once in the application
    //Configuration.setMenuActions();
    fileUploadBuilder = new FileUploadFormBuilder;
    fileUploadBuilder.buildForm('file_upload');
    initFileUploads();
});

// page worker - will config the elements with the necessary logic and ui

// page worker init

// page worker set bindings

// page worker render

function onFileChanged(){
  $('.file_has_changed').val(1);
}

function onformSubmit(file_upload_form, input_file){

  // search for the input and hide it
  // show on loading message
  input_file = $(file_upload_form).find('input[type="file"]');
  input_file.hide();
  
  div_actions = $(file_upload_form).find('.actions');
  div_actions.hide();
  // inject with client side loading feedback element
  // should only change the button label
  $(file_upload_form).append('<div class="upload_feedback">uploading image...</div>');

  $('iframe').each(function(){
        this.onload = onframeloaded(this);
  });

}
function onframeloaded(iframe){
  // either refresh page or show or inject image (that would require json response) => do it. Return a json object
  if($(iframe).contents()){
    $('.upload_feedback').text("Image uploaded");
    window.location.reload();
  }
}

var W3CDOM = (document.createElement && document.getElementsByTagName);

function initFileUploads() {
	if (!W3CDOM) return;
	var fakeFileUpload = document.createElement('div');
	fakeFileUpload.className = 'fakefile';
        var fakeInput = document.createElement('input');
        fakeInput.className = 'fake_input';
        var fakeInputButton = document.createElement('input');
        fakeInputButton.type = 'button'; 
        fakeInputButton.value = 'Choose File';
	fakeFileUpload.appendChild(fakeInput);
        fakeFileUpload.appendChild(fakeInputButton);
	var x = document.getElementsByTagName('input');
	for (var i=0;i<x.length;i++) {
		if (x[i].type != 'file') continue;
		if (x[i].parentNode.className != 'field file_inputs') continue;
		//x[i].className = 'file hidden';
		var clone = fakeFileUpload.cloneNode(true);
		x[i].parentNode.appendChild(clone);
		x[i].relatedElement = clone.getElementsByTagName('input')[0];
		x[i].onchange = x[i].onmouseout = function () {
			this.relatedElement.value = this.value;
		}
	}
}



module ApplicationHelper

  def link_to_section(section_name, current_section_id, section_id)
     if current_section_id.to_s.eql? section_id.to_s
       link_to section_name, work_pieces_path(:section_id => section_id), {:class=>'selected'}
     else
       link_to section_name, work_pieces_path(:section_id => section_id)
     end
  end

  def custom_form_for(name, *args, &block)
    options = args.extract_options!
  
    form_element_content = form_for(name, *(args << options.merge(:builder => CustomFormBuilder, :html => {:multipart => true})), &block)
    content_tag("div", form_element_content, :class => "file_upload");

    # aform_element_content
    # getting the indexes
    # id_index = form_element_content.to_s().index('id')
    # method_index = form_element_content.to_s().index('method')

    # add_till_first_quote = 4
    # updated_id_index = id_index + add_till_first_quote
    # add_till_last_quote = method_index - updated_id_index - 2

    # setting up the ids (some of this code very cumbersome and awkward in order to set the form target based on the generated id)
    # form_iframe_id = form_element_content.to_s()[updated_id_index, add_till_last_quote] + "_iframe"
    # iframe_content = content_tag("iframe", "", {:class=>"file-upload-iframe-form", :id => form_iframe_id})

    # form_element_content = form_for(name, *(args << options.merge({:builder => CustomFormBuilder, :html => {:multipart => true, :target => form_iframe_id}})), &block)

    # adding the frame after the form
    # form_element_content.concat(iframe_content)
 
  end

end

Ajax = {
    htmlDataType : 'html',
    call : function(url){
        $.ajax({
                url: url,
                cache: true,
                dataType: Ajax.htmlDataType,
                success: function(html){
                    $(Configuration.sub_menu_section).html(html);
                },
                error: function(){
                    // should be a general error
                    // show blocking pop up
                    alert('Whoooopsieee you broke it!');
                }
            });
        },

     deleteWorkGraphic : function(url){
                           $.ajax({
                                   url: url,
                                   cache: true,
                                   dataType: Ajax.htmlDataType,
                                   success: function(data){
                                            },
                                   error: function(){
                                          }
                           });

                         }
};


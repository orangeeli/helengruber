Configuration = {
    sub_menu_section : '#sub_menu',
    selected_style_name : 'selected',
    application_sections : {
        'home' : 'home',
        'infographics' : 'infographics',
        'art' : 'art',
        'information' : 'information',
        'contact' : 'contact',
        'illustration' : 'illustration',
        'painting' : 'painting',
        'animation' : 'animation'    
    },
    application_urls : {
        'art' : '/submenuart'
    },
    setMenuActions : function(){
        $('.menu_link').each(function(){

            switch(this.id){
                case Configuration.application_sections['art']:
                {
                     Configuration.setMenuAction(this.id, Configuration.application_urls[this.id]);
                     break;
                }
                default:
                {
                    Configuration.setMenuNoAction(this.id);
                    break;
                }
            }
        });
    },
    setMenuAction : function(menuItem, url){
        $(Util.getLinkAnchor(menuItem)).click(function(){
            if($(Configuration.sub_menu_section).html().length != 0){
                $(Configuration.sub_menu_section).html(Util.emptyString);
                Util.removeElementClass(Configuration.selected_style_name);
            }else{
                Ajax.call(url);
                $(Util.getLinkAnchor(menuItem)).addClass(Configuration.selected_style_name);
            }
        });
    },
    setMenuNoAction : function(menuItem){
        $(Util.getLinkAnchor(menuItem)).click(function(){
            if($(Configuration.sub_menu_section).html().length != 0){
                $(Configuration.sub_menu_section).html(Util.emptyString);
                Util.removeElementClass(Configuration.selected_style_name);
            }
        });
    }
};


Util = {
    removeElementClass : function(elementClass){
        $('.'+elementClass).removeClass(elementClass);
    },
    getLinkAnchor : function(elementName){
        return '#' + elementName +' a';
    },
    emptyString : ''
};

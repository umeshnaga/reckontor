/* jquery-ticker.js version 1.0
 * VTC-6353
 * Author: Jerome Ebuenga
 * Description: This plugin generates a counter widget.
 */

(function($) {
$.fn.ticker = function(options) {
    var settings = $.extend({
            initNum: 0,
            padded: false,
            pad: {right: 0, baseDigit: 0}
        }, options);

    var id = this.attr("id");
    var numId = id + "_num";
    var element = this;
    
    element.append('<div class="counter-number" id='+numId+'0"></div>');
        
    var currentValue = settings.initNum;
    var numheight = element.css("height").replace("px","");
    var firstCounterDiv = element.find(".counter-number");
    var fullHeight = firstCounterDiv.css("height").replace("px","");
    var numWidth = firstCounterDiv.css("width").replace("px","");
    var currentWidth = 0;
    var initDigitsCount = String(settings.initNum).length;
    
    show(settings.initNum);
    
    function show(ticnum) {           
        currentValue = parseInt(ticnum);           
        element.find(".counter-number").each(function(i) {
            $(this).attr('id',numId+i);
        });

        function addTicker(newnum) {
            var digitcnt = element.find(".counter-number").size();
            var nnum = String(newnum).length;
            var digitdiff = Number(nnum - Number(digitcnt));

            if (digitdiff < 0) {
                var ltdig = (Number(nnum)-1);
                element.find(".counter-number:gt(" + ltdig + ")").remove();
            }

            $("#"+numId+"0").css("display","block");

            for(var i=1;i<=digitdiff;i++) {
                element.append('<div class="counter-number" id="'+ numId + (Number(digitcnt+i-1)) + '"></div>');
            }

            if (settings.padded 
                && settings.pad.right > 0) {                
                var digitIncCount = String(ticnum).length - initDigitsCount;                
                if (digitIncCount > 0) {
                    $('.counter-block').remove();              
                }
                
                if (digitdiff > 0) {
                    var rightPad = settings.pad.baseDigit > 0 
                        ? (settings.pad.right + settings.pad.baseDigit) - initDigitsCount 
                        : settings.pad.right;                    
                    for(var i=0;i<rightPad-digitIncCount;i++) {
                        element.append('<div class="counter-block" style="top: ' + (numheight*-11) + 'px;"></div>');
                    }
                }
            }
        }

        function addCommas(nStr) {
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        var fticnum = addCommas(ticnum);
        var strNumLength = String(fticnum).length;

        if(currentWidth != strNumLength) {
            currentWidth = strNumLength * numWidth;
        }

        addTicker(fticnum);

        if (ticnum && ticnum != 0) {
            var s = String(fticnum);
            for (i=s.length;i>=0;i--){
                var onum=s.charAt(i);			
                $("#"+numId+i).attr('value',onum);
            }
            element.find(".counter-number").each( function() {
                var nval=$(this).attr("value");
                if (!isNaN(nval)) {
                    var nheight = Number(nval)*numheight*-1;
                    $(this).animate({top: nheight+'px'}, "slow");
                    $(this).removeClass('counter-comma');
                } 
                if (nval==',') {
                    $(this).animate({top: numheight-fullHeight+'px'}, "slow");
                    $(this).addClass('counter-comma');
                }
            });
        }
    }
    
    return {
        increment: function(incVal) {
            if (isNaN(incVal)) {
                incVal = 1;
            }
            if (isNaN(currentValue)) {
                 currentValue = parseInt(currentValue.replace(/\s/g,"").replace(",",""));
            }    
            currentValue += incVal;
            show(currentValue);
            return element;
        },
        update: function(newNum) {
            show(newNum);
            return element;
        }
    }
}
})(jQuery);

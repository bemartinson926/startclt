$(document).ready(function () {
    var changer = $('#changer');
    var replacements = [' a workshop', ' a conference', ' an experience'];
    var i = 0;

    function swapText() {
        if (i < replacements.length) {
            var changedText = replacements[i];
            changer.fadeOut(1500, function() {
                i++;
                $(this).text(changedText).fadeIn(1500, swapText);
            });
        }
    }
    setTimeout(swapText,1700);
    //swapText(); call here if setTimeout not desired
});
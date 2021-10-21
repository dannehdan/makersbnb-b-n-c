console.log("Javascript Jim :beforecallback")
$('textarea').keyup(function() { 
    console.log("Javascript Jim:callback")   
    var characterCount = $(this).val().length,
        current_count = $('#current_count'),
        maximum_count = $('#maximum_count'),
        count = $('#count');    
        current_count.text(characterCount);        
});
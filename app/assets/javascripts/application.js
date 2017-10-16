// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/dialog
//= require jquery-ui/widgets/sortable
//= require jquery-ui/effects/effect-highlight
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .



$(document).ajaxError(function(event,xhr,options,exc) {
    console.error(exc);

    try {
	    var errors = JSON.parse(xhr.responseText);
	    var kk ="<ul>";

	    for(var i = 0; i < errors.length; i++){
	        var list = errors[i];
	        kk += "<li>"+list+"</li>"
	    }
	 
	    kk +="</ul>"

	    $("#error_explanation").html(kk);
	} catch (e) {
		console.error("Cannot parse errors");
	}       
});

  // This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require plyr
//= require_tree .


$(document).on("turbolinks:load", function() {
    const players = Array.from(document.querySelectorAll('.js-player')).map(p => new Plyr(p));
    $('#file-upload').bind('change', function() { var fileName = ''; fileName = ('Image selected: ' +$(this).val()); $('#file-selected').html(fileName); });
});

window.onload = function() {
    document.addEventListener("play", function(event) {
        audio_elements = document.body.getElementsByTagName("audio")
        for(i=0; i < audio_elements.length; i++) {
            audio_element = audio_elements[i];
            if (audio_element !== event.target.firstElementChild) {
                audio_element.pause();
            }
        }
    }, false);

  };

$( document ).ready(function() {
    $('#bug_dropdown').hide();
});
$(function() {
  $('#bug_bug_type_feature').click(function(event){
    $('#feature_dropdown').show();
    $('#bug_dropdown').hide();
  });
  $('#bug_bug_type_bug').click(function(event){
    $('#feature_dropdown').hide();
    $('#bug_dropdown').show();
  });
});

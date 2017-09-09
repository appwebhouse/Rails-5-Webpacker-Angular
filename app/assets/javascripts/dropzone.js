$(document).on('dragover dragenter drop', '.dropzone', function(e){
  e.preventDefault();
  e.stopPropagation();
});

$(document).on('dragover', '.dropzone', function(){
  $(this).addClass('dz-drag-hover');
});

$(document).on('dragleave', '.dropzone', function(){
  $(this).removeClass('dz-drag-hover');
});

$(document).on('click', '#imageDropzone', function(){
  $("#image_file").click();
});

$(document).on('drop', '#imageDropzone', function(e){
  if(e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files.length){
    $(this).find('.dz-message').text(
      I18n.t("helpers.input.added", {name: e.originalEvent.dataTransfer.files[0].name})
    );
    $("#image_file").prop("files", e.originalEvent.dataTransfer.files);
  }
});

$(document).on('change', '#image_file', function() {
  $('#imageDropzone .dz-message').text(
    I18n.t("helpers.input.added", {name: this.files[0].name})
  );
});


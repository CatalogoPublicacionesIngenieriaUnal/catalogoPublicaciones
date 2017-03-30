$(document).ready(function(){
  tinymce.remove();
  tinymce.init({
    selector:'#post_content',
    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image |  preview media fullpage | forecolor backcolor emoticons',
    plugins : 'advlist template searchreplace spellchecker autolink link image lists charmap hr table textcolor codesample preview pagebreak wordcount emoticons insertdatetime autoresize',
    statusbar: false,
    menubar: false

  });
});

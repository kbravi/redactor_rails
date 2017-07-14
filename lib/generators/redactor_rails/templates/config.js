window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params = {};
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
  }
  $('#redactor').redactor({
    // You can specify, which ones plugins you need.
    // If you want to use plugins, you have download fils and add plugins to your
    // application.js and application.css files and uncomment the line below:
    // "plugins": ['fontsize', 'fontcolor', 'fontfamily', 'fullscreen', 'textdirection', 'clips'],
    "imageUpload":"/redactor_rails/pictures",
    "imageUploadFields": params,
    "imageGetJson":"/redactor_rails/pictures",
    "fileUpload":"/redactor_rails/documents",
    "fileUploadFields": params,
    "fileGetJson":"/redactor_rails/documents",
    "path":"/assets/redactor_rails"
  });
}

$(document).ready(window.init_redactor);

$(document).on("turbolinks:before-cache", function() {
  $('.redactor').redactor('core.destroy');
});

// // Advanced Example to set redactor globally on the class ".redactor"
// window.init_redactor = function (){
//   var csrf_token = $('meta[name=csrf-token]').attr('content');
//   var csrf_param = $('meta[name=csrf-param]').attr('content');
//   var params = {};
//   if (csrf_param !== undefined && csrf_token !== undefined) {
//       params[csrf_param] = csrf_token;
//   }
//   $('.redactor').not('.redactored').each(function(){
//     var minHeight = parseInt($(this).css('min-height'));
//     var maxHeight = parseInt($(this).css('max-height'));
//     $(this).addClass('redactored');
//     $(this).redactor({
//       imageUpload:"/redactor_rails/pictures",
//       imageUploadFields: params,
//       imageGetJson:"/redactor_rails/pictures",
//       fileUpload:"/redactor_rails/documents",
//       fileUploadFields: params,
//       fileGetJson:"/redactor_rails/documents",
//       path:"/assets/redactor_rails",
//       minHeight:minHeight,
//       maxHeight:maxHeight,
//       buttons : ['formatting', 'bold', 'italic', 'deleted', 'unorderedlist', 'orderedlist', 'outdent', 'indent', 'table', 'link', 'video', 'image', 'file', 'alignleft', 'aligncenter', 'alignright', 'justify', 'horizontalrule'],
//       convertVideoLinks: true,
//       convertImageLinks: true,
//       plugins: ['fullscreen', 'video'],
//       callbacks: {
//         keyup: function(e){
//           console.log(this.code.get().length);
//         },
//         imageUploadError: function(json){
//           console.log(json.error);
//           console.log(json.message);
//         },
//         fileUploadError: function(json){
//           console.log(json.error);
//           console.log(json.message);
//         }
//       }
//     });
//   });
// }

// $(document).ready( window.init_redactor );
// $(document).ajaxSuccess(window.init_redactor);

// // When you have turbolinks enabled
// $(document).on("turbolinks:before-cache", function() {
//   $('.redactor').redactor('core.destroy');
//   $('.redactor').removeClass('redactored');
// });

// $(function () {
//   $('#courses_search input').keyup(function () {
//     $.get($('#courses_search').attr('action'), &crarr;
//       $('#courses_search').serialize(), null, 'script');
//     return false;
//   });
// });

function submitFrmAjax(){
   $.ajax({
         url : "/courses/do_search",
         data : $("form#search").serialize()
    });
}

// the dollar sign wasn't being recognized so I'm passing it in
// some conflict maybe
jQuery(function($) {

  var student_query, student_name, student_query_pattern, $student_box;

  $("#find_student_query").on("keyup", function(){

    student_query = $(this).val().toLowerCase();
    student_query_pattern = new RegExp(student_query);

    $(".big-comment").each(function() {

      student_name = $(this).text().toLowerCase();
      $student_box = $(this).closest(".home-blog-post");

      if(student_query_pattern.test(student_name)) {

        $student_box.fadeIn();

      } else {

        $student_box.fadeOut();

      }

    }); // end each

  }); // end keyup



});
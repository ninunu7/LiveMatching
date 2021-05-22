//$("#comments_area").html("<%= j(render 'index', { comments: @comment.item.comments }) %>")
//$("textarea").val('')


$("comments").html("<%= j(render 'blog_comment',{comments: @blog.blog_comment.comment})%>")
$("textarea").val('')
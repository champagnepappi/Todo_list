html = "<%= escape_javascript(render partial: 'cards/todo_item', locals: {card: @card, item: @todo_item}) %>"
$("#items_<%= @todo_item.card_id %>").append(html)
$("#card_<%=@todo_item.card_id%>").val('')

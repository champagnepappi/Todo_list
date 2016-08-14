html = "<%= escape_javascript(render partial: 'cards/card', locals: {card: @card}) %>"
$("#cards_<%= @card.list_id %>").append(html)
$("#list_<%=@card.list_id%>").val('')

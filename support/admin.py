from django.contrib import admin

from .models import Chat, ChatMessage, Ticket, TicketReplay

admin.site.register(Chat)
admin.site.register(ChatMessage)
admin.site.register(Ticket)
admin.site.register(TicketReplay)

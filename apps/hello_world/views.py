from django.http import HttpRequest, HttpResponse
from django.shortcuts import render
from django.utils.timezone import now


def hello_world(request: HttpRequest) -> HttpResponse:
    return render(
        request,
        "hello_world/index.html",
        {
            "now": now(),
        },
    )

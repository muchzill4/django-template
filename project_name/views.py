from django.http import HttpRequest, HttpResponse
from django.shortcuts import render


def hello_world(request: HttpRequest) -> HttpResponse:
    return render(request, "hello-world.html")

from django.test import Client
from django.urls import reverse


def test_hello_world(client: Client) -> None:
    response = client.get(reverse("hello-world"))

    assert response.status_code == 200
    assert response.content.decode() == "Hello, World!"

from django.shortcuts import reverse
from django.test import Client


def test_index(client: Client):
    res = client.get(reverse("index"))

    assert res.status_code == 200

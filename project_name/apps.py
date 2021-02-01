from django.apps import AppConfig


# TODO: Should I worry about this?
class ProjectNameConfig(AppConfig):
    name = "{{ project_name }}"

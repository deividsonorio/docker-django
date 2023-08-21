from django.db import models


# Model Usuário
class User(models.Model):
    name = models.CharField(max_length=250)
    email = models.CharField(max_length=250)

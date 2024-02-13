import jwt as PyJWT
from datetime import datetime, timedelta
from django.conf import settings


def generate_jwt_token(user):
    expiry_time = datetime.utcnow() + timedelta(minutes=settings.JWT_EXPIRATION_DELTA)
    payload = {
        'id': user.id,
        'username': user.name,
        'email': user.email,
        'exp': int(expiry_time.timestamp()),
    }
    token = PyJWT.encode(payload, settings.SECRET_KEY, algorithm='HS256')
    return token

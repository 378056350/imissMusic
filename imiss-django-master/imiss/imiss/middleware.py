from django.http import HttpResponse
import json
import time
from django.utils.deprecation import MiddlewareMixin


class dataMiddleware(MiddlewareMixin):
    def process_response(self, request, response):
        path = request.path
        if 'admin' in path or 'media' in path:
            return response
        else:
            time.sleep(0.5)
            return HttpResponse(json.dumps(response), content_type="application/json")


 #!/usr/bin/python
 # -*- coding: utf-8 -*-
import subprocess
from time import time

class Py3status:
    def __init__(self):
        self.cache_timeout = 60

    def emailCount(self, json, i3status_config):
        response = {
            'cached_until': time() + self.cache_timeout,
            'full_text': '',
            'name': 'email-inbox'
        }

        unread_emails = int(subprocess.check_output(["/home/jmonetta/bin/unread-emails"]).split()[0])
        response['full_text'] = ": %d                                                                 " % unread_emails
        return (0, response)

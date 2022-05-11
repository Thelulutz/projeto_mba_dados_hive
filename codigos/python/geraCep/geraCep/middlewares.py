#from fake_useragent import UserAgent
from scrapy.utils.project import get_project_settings

# class UserAgentMiddleware(object):
#     def __init__(self):
#         super(UserAgentMiddleware, self).__init__()
#         self.ua = UserAgent()

#     def process_request(self, request, spider):
#         user_agent = self.ua.random
#         request.headers.setdefault('User-Agent', user_agent)


# import base64

# class ProxyMiddleware(object):
#     def __init__(self):
#         settings = get_project_settings()
#         self.proxy_country_name = settings.get("PROXY_COUNTRY_NAME")
#         self.proxy_username = settings.get("PROXY_USERNAME")
#         self.proxy_password = settings.get("PROXY_PASSWORD")
#         self.proxy_port = settings.get("PROXY_PORT", "31280")

#     def process_request(self, request, spider):
#         request.meta['proxy'] = "http://{0}.proxymesh.com:{1}".format(self.proxy_country_name, self.proxy_port)

#         proxy_user_pass = "{0}:{1}".format(self.proxy_username, self.proxy_password)

#         encoded_user_pass = base64.b64encode(proxy_user_pass)

#         request.headers["Proxy-Authorization"] = 'Basic ' + encoded_user_pass


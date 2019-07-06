import os
import sys

c = get_config()

c.JupyterHub.base_url = os.environ['CONTEXT_PATH']
c.JupyterHub.log_level = 10

#c.JupyterHub.ssl_key = '/opt/jupyterhub/server.key'
#c.JupyterHub.ssl_cert = '/opt/jupyterhub/server.crt'

# GitHub
from oauthenticator.github import LocalGitHubOAuthenticator
c.JupyterHub.authenticator_class = LocalGitHubOAuthenticator
c.LocalGitHubOAuthenticator.create_system_users = True
c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']

# LDAP
#c.JupyterHub.authenticator_class = 'ldapauthenticator.LDAPAuthenticator'
#c.LDAPAuthenticator.server_address = 'ldap://127.0.0.1'
#c.LDAPAuthenticator.server_port = 1389
#c.LDAPAuthenticator.bind_dn_template = 'cn={username},ou=People,dc=codelibs,dc=org'

c.Authenticator.whitelist = whitelist = set()
c.Authenticator.admin_users = admin = set()

join = os.path.join

here = os.path.dirname(__file__)
root = os.environ.get('OAUTHENTICATOR_DIR', here)
sys.path.insert(0, root)

with open(join(root, 'userlist')) as f:
    for line in f:
        if not line:
            continue
        parts = line.split()
        name = parts[1]
        whitelist.add(name)
        if len(parts) > 2 and parts[2] == 'admin':
            admin.add(name)

#c.Spawner.default_url = '/lab'
c.Spawner.env_keep.append('LD_LIBRARY_PATH')

